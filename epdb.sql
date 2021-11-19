/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : epdb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2021-11-19 22:07:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for core_store
-- ----------------------------
DROP TABLE IF EXISTS `core_store`;
CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_store
-- ----------------------------
INSERT INTO `core_store` VALUES ('1', 'model_def_strapi::core-store', '{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('2', 'model_def_strapi::webhooks', '{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('3', 'model_def_strapi::permission', '{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"fields\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('4', 'model_def_strapi::role', '{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('5', 'model_def_strapi::user', '{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('6', 'model_def_plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('7', 'model_def_plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('8', 'model_def_plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('9', 'model_def_plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('10', 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('11', 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":true}', 'object', 'development', '');
INSERT INTO `core_store` VALUES ('12', 'plugin_content_manager_configuration_content_types::strapi::user', '{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('13', 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('14', 'plugin_content_manager_configuration_content_types::strapi::role', '{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('15', 'plugin_content_manager_configuration_content_types::strapi::permission', '{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"fields\":{\"edit\":{\"label\":\"Fields\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fields\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"fields\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('16', 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('17', 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('18', 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('19', 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('20', 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}', 'object', '', '');
INSERT INTO `core_store` VALUES ('21', 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('22', 'model_def_application::emergencyplan.emergencyplan', '{\"uid\":\"application::emergencyplan.emergencyplan\",\"collectionName\":\"emergencyplans\",\"kind\":\"collectionType\",\"info\":{\"name\":\"emergencyplan\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"user_name\":{\"type\":\"string\"},\"plan_name\":{\"type\":\"string\"},\"plan_summary\":{\"type\":\"text\"},\"flan_file\":{\"type\":\"string\"},\"emergencyplandeps\":{\"collection\":\"emergencyplandep\",\"via\":\"emergencyplan\",\"isVirtual\":true},\"plan_id\":{\"type\":\"integer\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('23', 'model_def_application::test.test', '{\"uid\":\"application::test.test\",\"collectionName\":\"tests\",\"kind\":\"collectionType\",\"info\":{\"name\":\"test\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"title\":{\"type\":\"string\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('24', 'plugin_content_manager_configuration_content_types::application::emergencyplan.emergencyplan', '{\"uid\":\"application::emergencyplan.emergencyplan\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"user_name\",\"defaultSortBy\":\"user_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"user_name\":{\"edit\":{\"label\":\"User_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"User_name\",\"searchable\":true,\"sortable\":true}},\"plan_name\":{\"edit\":{\"label\":\"Plan_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_name\",\"searchable\":true,\"sortable\":true}},\"plan_summary\":{\"edit\":{\"label\":\"Plan_summary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_summary\",\"searchable\":true,\"sortable\":true}},\"flan_file\":{\"edit\":{\"label\":\"Flan_file\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Flan_file\",\"searchable\":true,\"sortable\":true}},\"emergencyplandeps\":{\"edit\":{\"label\":\"Emergencyplandeps\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"plan_dep_name\"},\"list\":{\"label\":\"Emergencyplandeps\",\"searchable\":false,\"sortable\":false}},\"plan_id\":{\"edit\":{\"label\":\"Plan_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_id\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"plan_id\",\"user_name\",\"plan_name\"],\"edit\":[[{\"name\":\"user_name\",\"size\":6}],[{\"name\":\"plan_name\",\"size\":6},{\"name\":\"plan_summary\",\"size\":6}],[{\"name\":\"flan_file\",\"size\":6},{\"name\":\"plan_id\",\"size\":4}]],\"editRelations\":[\"emergencyplandeps\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('25', 'plugin_content_manager_configuration_content_types::application::test.test', '{\"uid\":\"application::test.test\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"published_at\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"title\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('26', 'model_def_application::emergencyplandep.emergencyplandep', '{\"uid\":\"application::emergencyplandep.emergencyplandep\",\"collectionName\":\"emergencyplandeps\",\"kind\":\"collectionType\",\"info\":{\"name\":\"emergencyplandep\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"plan_dep_id\":{\"type\":\"uid\"},\"plan_dep_name\":{\"type\":\"string\"},\"plan_id\":{\"type\":\"integer\"},\"emergencyplan\":{\"via\":\"emergencyplandeps\",\"model\":\"emergencyplan\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('27', 'plugin_content_manager_configuration_content_types::application::emergencyplandep.emergencyplandep', '{\"uid\":\"application::emergencyplandep.emergencyplandep\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"plan_dep_name\",\"defaultSortBy\":\"plan_dep_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"plan_dep_id\":{\"edit\":{\"label\":\"Plan_dep_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_dep_id\",\"searchable\":true,\"sortable\":true}},\"plan_dep_name\":{\"edit\":{\"label\":\"Plan_dep_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_dep_name\",\"searchable\":true,\"sortable\":true}},\"plan_id\":{\"edit\":{\"label\":\"Plan_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_id\",\"searchable\":true,\"sortable\":true}},\"emergencyplan\":{\"edit\":{\"label\":\"Emergencyplan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"user_name\"},\"list\":{\"label\":\"Emergencyplan\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"plan_dep_id\",\"plan_dep_name\",\"plan_id\"],\"edit\":[[{\"name\":\"plan_dep_id\",\"size\":6},{\"name\":\"plan_dep_name\",\"size\":6}],[{\"name\":\"plan_id\",\"size\":4}]],\"editRelations\":[\"emergencyplan\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('28', 'model_def_application::replanlist.replanlist', '{\"uid\":\"application::replanlist.replanlist\",\"collectionName\":\"replanlists\",\"kind\":\"collectionType\",\"info\":{\"name\":\"replan\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"plan_name\":{\"type\":\"string\"},\"plansummary\":{\"type\":\"text\"},\"plan_file\":{\"type\":\"string\"},\"replan_depts\":{\"collection\":\"replan-dept\",\"via\":\"replan\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('29', 'plugin_content_manager_configuration_content_types::application::replanlist.replanlist', '{\"uid\":\"application::replanlist.replanlist\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"plan_name\",\"defaultSortBy\":\"plan_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"plan_name\":{\"edit\":{\"label\":\"Plan_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_name\",\"searchable\":true,\"sortable\":true}},\"plansummary\":{\"edit\":{\"label\":\"Plansummary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plansummary\",\"searchable\":true,\"sortable\":true}},\"plan_file\":{\"edit\":{\"label\":\"Plan_file\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_file\",\"searchable\":true,\"sortable\":true}},\"replan_depts\":{\"edit\":{\"label\":\"Replan_depts\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"plan_dept_name\"},\"list\":{\"label\":\"Replan_depts\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"plan_name\",\"plansummary\",\"plan_file\"],\"edit\":[[{\"name\":\"plan_name\",\"size\":6},{\"name\":\"plansummary\",\"size\":6}],[{\"name\":\"plan_file\",\"size\":6}]],\"editRelations\":[\"replan_depts\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('30', 'model_def_application::replan-dep.replan-dep', '{\"uid\":\"application::replan-dep.replan-dep\",\"collectionName\":\"replan_deps\",\"kind\":\"singleType\",\"info\":{\"name\":\"replan_dep\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('31', 'plugin_content_manager_configuration_content_types::application::replan-dep.replan-dep', '{\"uid\":\"application::replan-dep.replan-dep\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"published_at\",\"created_at\"],\"edit\":[],\"editRelations\":[]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('32', 'model_def_application::replan-dept.replan-dept', '{\"uid\":\"application::replan-dept.replan-dept\",\"collectionName\":\"replan_depts\",\"kind\":\"collectionType\",\"info\":{\"name\":\"replan_dept\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"plan_dept_name\":{\"type\":\"string\"},\"replan\":{\"via\":\"replan_depts\",\"model\":\"replanlist\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('33', 'plugin_content_manager_configuration_content_types::application::replan-dept.replan-dept', '{\"uid\":\"application::replan-dept.replan-dept\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"plan_dept_name\",\"defaultSortBy\":\"plan_dept_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"plan_dept_name\":{\"edit\":{\"label\":\"Plan_dept_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_dept_name\",\"searchable\":true,\"sortable\":true}},\"replan\":{\"edit\":{\"label\":\"Replan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"plan_name\"},\"list\":{\"label\":\"Replan\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"plan_dept_name\",\"published_at\",\"created_at\"],\"edit\":[[{\"name\":\"plan_dept_name\",\"size\":6}]],\"editRelations\":[\"replan\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('34', 'model_def_application::plan.plan', '{\"uid\":\"application::plan.plan\",\"collectionName\":\"plans\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"plan_deps\":{\"collection\":\"plan-dep\",\"via\":\"plan\",\"isVirtual\":true},\"plan_flows\":{\"collection\":\"plan-flow\",\"via\":\"plan\",\"isVirtual\":true},\"plan_summary\":{\"type\":\"text\"},\"dd_plan_dep_id\":{\"type\":\"string\"},\"planName\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"},\"count\":{\"type\":\"integer\"},\"plan_events\":{\"via\":\"plan\",\"collection\":\"plan-event\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('35', 'plugin_content_manager_configuration_content_types::application::plan.plan', '{\"uid\":\"application::plan.plan\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"dd_plan_dep_id\",\"defaultSortBy\":\"dd_plan_dep_id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"plan_deps\":{\"edit\":{\"label\":\"Plan_deps\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_name\"},\"list\":{\"label\":\"Plan_deps\",\"searchable\":false,\"sortable\":false}},\"plan_flows\":{\"edit\":{\"label\":\"Plan_flows\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"flow_name\"},\"list\":{\"label\":\"Plan_flows\",\"searchable\":false,\"sortable\":false}},\"plan_summary\":{\"edit\":{\"label\":\"Plan_summary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Plan_summary\",\"searchable\":true,\"sortable\":true}},\"dd_plan_dep_id\":{\"edit\":{\"label\":\"Dd_plan_dep_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dd_plan_dep_id\",\"searchable\":true,\"sortable\":true}},\"planName\":{\"edit\":{\"label\":\"PlanName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PlanName\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"Status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Status\",\"searchable\":true,\"sortable\":true}},\"count\":{\"edit\":{\"label\":\"Count\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Count\",\"searchable\":true,\"sortable\":true}},\"plan_events\":{\"edit\":{\"label\":\"Plan_events\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"status\"},\"list\":{\"label\":\"Plan_events\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"published_at\",\"created_at\",\"status\"],\"edit\":[[{\"name\":\"plan_summary\",\"size\":6}],[{\"name\":\"dd_plan_dep_id\",\"size\":6},{\"name\":\"planName\",\"size\":6}],[{\"name\":\"status\",\"size\":6},{\"name\":\"count\",\"size\":4}]],\"editRelations\":[\"plan_deps\",\"plan_flows\",\"plan_events\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('36', 'model_def_application::plan-dep.plan-dep', '{\"uid\":\"application::plan-dep.plan-dep\",\"collectionName\":\"plan_deps\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_dep\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"dep_name\":{\"type\":\"string\"},\"plan_dep_users\":{\"collection\":\"plan-dep-user\",\"via\":\"plan_dep\",\"isVirtual\":true},\"dd_sub_dep_id\":{\"type\":\"string\"},\"plan\":{\"via\":\"plan_deps\",\"model\":\"plan\"},\"plan_flow\":{\"via\":\"plan_deps\",\"model\":\"plan-flow\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('37', 'plugin_content_manager_configuration_content_types::application::plan-dep.plan-dep', '{\"uid\":\"application::plan-dep.plan-dep\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"dep_name\",\"defaultSortBy\":\"dep_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"dep_name\":{\"edit\":{\"label\":\"Dep_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dep_name\",\"searchable\":true,\"sortable\":true}},\"plan_dep_users\":{\"edit\":{\"label\":\"Plan_dep_users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_user_name\"},\"list\":{\"label\":\"Plan_dep_users\",\"searchable\":false,\"sortable\":false}},\"dd_sub_dep_id\":{\"edit\":{\"label\":\"Dd_sub_dep_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dd_sub_dep_id\",\"searchable\":true,\"sortable\":true}},\"plan\":{\"edit\":{\"label\":\"Plan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dd_plan_dep_id\"},\"list\":{\"label\":\"Plan\",\"searchable\":true,\"sortable\":true}},\"plan_flow\":{\"edit\":{\"label\":\"Plan_flow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"flow_name\"},\"list\":{\"label\":\"Plan_flow\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"dep_name\",\"published_at\",\"dd_sub_dep_id\"],\"edit\":[[{\"name\":\"dep_name\",\"size\":6},{\"name\":\"dd_sub_dep_id\",\"size\":6}]],\"editRelations\":[\"plan_dep_users\",\"plan\",\"plan_flow\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('38', 'model_def_application::plan-dep-user.plan-dep-user', '{\"uid\":\"application::plan-dep-user.plan-dep-user\",\"collectionName\":\"plan_dep_users\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_dep_user\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"dep_user_name\":{\"type\":\"string\"},\"plan_flow_user_deps\":{\"collection\":\"plan-flow-user-dep\",\"via\":\"plan_dep_user\",\"isVirtual\":true},\"dd_user_id\":{\"type\":\"string\"},\"phone\":{\"type\":\"string\"},\"plan_dep\":{\"via\":\"plan_dep_users\",\"model\":\"plan-dep\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('39', 'plugin_content_manager_configuration_content_types::application::plan-dep-user.plan-dep-user', '{\"uid\":\"application::plan-dep-user.plan-dep-user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"dep_user_name\",\"defaultSortBy\":\"dep_user_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"dep_user_name\":{\"edit\":{\"label\":\"Dep_user_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dep_user_name\",\"searchable\":true,\"sortable\":true}},\"plan_flow_user_deps\":{\"edit\":{\"label\":\"Plan_flow_user_deps\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_name\"},\"list\":{\"label\":\"Plan_flow_user_deps\",\"searchable\":false,\"sortable\":false}},\"dd_user_id\":{\"edit\":{\"label\":\"Dd_user_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dd_user_id\",\"searchable\":true,\"sortable\":true}},\"phone\":{\"edit\":{\"label\":\"Phone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Phone\",\"searchable\":true,\"sortable\":true}},\"plan_dep\":{\"edit\":{\"label\":\"Plan_dep\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_name\"},\"list\":{\"label\":\"Plan_dep\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"dep_user_name\",\"published_at\",\"created_at\"],\"edit\":[[{\"name\":\"dep_user_name\",\"size\":6},{\"name\":\"dd_user_id\",\"size\":6}],[{\"name\":\"phone\",\"size\":6}]],\"editRelations\":[\"plan_flow_user_deps\",\"plan_dep\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('40', 'model_def_application::plan-flow.plan-flow', '{\"uid\":\"application::plan-flow.plan-flow\",\"collectionName\":\"plan_flows\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_flow\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"flow_name\":{\"type\":\"string\"},\"plan\":{\"via\":\"plan_flows\",\"model\":\"plan\"},\"plan_flow_users\":{\"collection\":\"plan-flow-user\",\"via\":\"plan_flow\",\"isVirtual\":true},\"flow_content\":{\"type\":\"text\"},\"plan_deps\":{\"collection\":\"plan-dep\",\"via\":\"plan_flow\",\"isVirtual\":true},\"dd_dep_id_str\":{\"type\":\"text\"},\"flow_events\":{\"via\":\"plan_flow\",\"collection\":\"flow-event\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('41', 'plugin_content_manager_configuration_content_types::application::plan-flow.plan-flow', '{\"uid\":\"application::plan-flow.plan-flow\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"flow_name\",\"defaultSortBy\":\"flow_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"flow_name\":{\"edit\":{\"label\":\"Flow_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Flow_name\",\"searchable\":true,\"sortable\":true}},\"plan\":{\"edit\":{\"label\":\"Plan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dd_plan_dep_id\"},\"list\":{\"label\":\"Plan\",\"searchable\":true,\"sortable\":true}},\"plan_flow_users\":{\"edit\":{\"label\":\"Plan_flow_users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"flow_username\"},\"list\":{\"label\":\"Plan_flow_users\",\"searchable\":false,\"sortable\":false}},\"flow_content\":{\"edit\":{\"label\":\"Flow_content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Flow_content\",\"searchable\":true,\"sortable\":true}},\"plan_deps\":{\"edit\":{\"label\":\"Plan_deps\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_name\"},\"list\":{\"label\":\"Plan_deps\",\"searchable\":false,\"sortable\":false}},\"dd_dep_id_str\":{\"edit\":{\"label\":\"Dd_dep_id_str\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dd_dep_id_str\",\"searchable\":true,\"sortable\":true}},\"flow_events\":{\"edit\":{\"label\":\"Flow_events\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"status\"},\"list\":{\"label\":\"Flow_events\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"flow_name\",\"published_at\",\"created_at\"],\"edit\":[[{\"name\":\"flow_name\",\"size\":6},{\"name\":\"flow_content\",\"size\":6}],[{\"name\":\"dd_dep_id_str\",\"size\":6}]],\"editRelations\":[\"plan\",\"plan_flow_users\",\"plan_deps\",\"flow_events\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('42', 'model_def_application::plan-flow-user.plan-flow-user', '{\"uid\":\"application::plan-flow-user.plan-flow-user\",\"collectionName\":\"plan_flow_users\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_flow_user\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"flow_username\":{\"type\":\"string\"},\"plan_flow\":{\"via\":\"plan_flow_users\",\"model\":\"plan-flow\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('43', 'plugin_content_manager_configuration_content_types::application::plan-flow-user.plan-flow-user', '{\"uid\":\"application::plan-flow-user.plan-flow-user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"flow_username\",\"defaultSortBy\":\"flow_username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"flow_username\":{\"edit\":{\"label\":\"Flow_username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Flow_username\",\"searchable\":true,\"sortable\":true}},\"plan_flow\":{\"edit\":{\"label\":\"Plan_flow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"flow_name\"},\"list\":{\"label\":\"Plan_flow\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"flow_username\",\"published_at\",\"created_at\"],\"edit\":[[{\"name\":\"flow_username\",\"size\":6}]],\"editRelations\":[\"plan_flow\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('44', 'model_def_application::plan-flow-user-dep.plan-flow-user-dep', '{\"uid\":\"application::plan-flow-user-dep.plan-flow-user-dep\",\"collectionName\":\"plan_flow_user_deps\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_flow_user_dep\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"plan_dep_user\":{\"via\":\"plan_flow_user_deps\",\"model\":\"plan-dep-user\"},\"dep_name\":{\"type\":\"string\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('45', 'plugin_content_manager_configuration_content_types::application::plan-flow-user-dep.plan-flow-user-dep', '{\"uid\":\"application::plan-flow-user-dep.plan-flow-user-dep\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"dep_name\",\"defaultSortBy\":\"dep_name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"plan_dep_user\":{\"edit\":{\"label\":\"Plan_dep_user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dep_user_name\"},\"list\":{\"label\":\"Plan_dep_user\",\"searchable\":true,\"sortable\":true}},\"dep_name\":{\"edit\":{\"label\":\"Dep_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Dep_name\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"plan_dep_user\",\"dep_name\",\"published_at\"],\"editRelations\":[\"plan_dep_user\"],\"edit\":[[{\"name\":\"dep_name\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('46', 'model_def_application::flow-event.flow-event', '{\"uid\":\"application::flow-event.flow-event\",\"collectionName\":\"flow_events\",\"kind\":\"collectionType\",\"info\":{\"name\":\"flow_event\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"status\":{\"type\":\"string\"},\"flow_content\":{\"type\":\"string\"},\"plan_flow\":{\"model\":\"plan-flow\",\"via\":\"flow_events\"},\"plan_event\":{\"via\":\"flow_events\",\"model\":\"plan-event\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('47', 'plugin_content_manager_configuration_content_types::application::flow-event.flow-event', '{\"uid\":\"application::flow-event.flow-event\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"status\",\"defaultSortBy\":\"status\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"Status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Status\",\"searchable\":true,\"sortable\":true}},\"flow_content\":{\"edit\":{\"label\":\"Flow_content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Flow_content\",\"searchable\":true,\"sortable\":true}},\"plan_flow\":{\"edit\":{\"label\":\"Plan_flow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"flow_name\"},\"list\":{\"label\":\"Plan_flow\",\"searchable\":true,\"sortable\":true}},\"plan_event\":{\"edit\":{\"label\":\"Plan_event\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"status\"},\"list\":{\"label\":\"Plan_event\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"status\",\"flow_content\",\"plan_flow\"],\"edit\":[[{\"name\":\"status\",\"size\":6},{\"name\":\"flow_content\",\"size\":6}]],\"editRelations\":[\"plan_flow\",\"plan_event\"]}}', 'object', '', '');
INSERT INTO `core_store` VALUES ('48', 'model_def_application::plan-event.plan-event', '{\"uid\":\"application::plan-event.plan-event\",\"collectionName\":\"plan_events\",\"kind\":\"collectionType\",\"info\":{\"name\":\"plan_event\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"status\":{\"type\":\"string\"},\"plan\":{\"model\":\"plan\",\"via\":\"plan_events\"},\"flow_events\":{\"collection\":\"flow-event\",\"via\":\"plan_event\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}', 'object', null, null);
INSERT INTO `core_store` VALUES ('49', 'plugin_content_manager_configuration_content_types::application::plan-event.plan-event', '{\"uid\":\"application::plan-event.plan-event\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"status\",\"defaultSortBy\":\"status\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"Status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Status\",\"searchable\":true,\"sortable\":true}},\"plan\":{\"edit\":{\"label\":\"Plan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"dd_plan_dep_id\"},\"list\":{\"label\":\"Plan\",\"searchable\":true,\"sortable\":true}},\"flow_events\":{\"edit\":{\"label\":\"Flow_events\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"status\"},\"list\":{\"label\":\"Flow_events\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"status\",\"published_at\",\"created_at\"],\"edit\":[[{\"name\":\"status\",\"size\":6}]],\"editRelations\":[\"plan\",\"flow_events\"]}}', 'object', '', '');

-- ----------------------------
-- Table structure for emailnotice
-- ----------------------------
DROP TABLE IF EXISTS `emailnotice`;
CREATE TABLE `emailnotice` (
  `Rid` int(11) NOT NULL,
  `MailTo` varchar(500) DEFAULT NULL,
  `MailTitle` varchar(5000) DEFAULT NULL,
  `MailBody` varchar(5000) DEFAULT NULL,
  `MailTime` datetime DEFAULT NULL,
  `ReplyTitle` varchar(5000) DEFAULT NULL,
  `ReplyContent` varchar(5000) DEFAULT NULL,
  `ReplyFrom` varchar(500) DEFAULT NULL,
  `ReplyTime` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emailnotice
-- ----------------------------

-- ----------------------------
-- Table structure for emergencyevent
-- ----------------------------
DROP TABLE IF EXISTS `emergencyevent`;
CREATE TABLE `emergencyevent` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '突发事件id',
  `event_name` varchar(255) NOT NULL COMMENT '突发事件描述',
  `plan_id` int(11) NOT NULL COMMENT '预案id',
  `start_time` datetime NOT NULL COMMENT '预案启动时间',
  `startar` varchar(255) NOT NULL COMMENT '预案启动人',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyevent
-- ----------------------------

-- ----------------------------
-- Table structure for emergencyflow
-- ----------------------------
DROP TABLE IF EXISTS `emergencyflow`;
CREATE TABLE `emergencyflow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流程id',
  `flow_name` varchar(255) NOT NULL COMMENT '流程名称',
  `order_id` int(11) NOT NULL COMMENT '顺序号',
  `plan_id` int(11) NOT NULL COMMENT '预案id',
  `flow_message` varchar(2550) DEFAULT NULL COMMENT '消息模板',
  PRIMARY KEY (`flow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyflow
-- ----------------------------
INSERT INTO `emergencyflow` VALUES ('1', '第一步', '1', '1', '第一步的信息');
INSERT INTO `emergencyflow` VALUES ('2', '第二部', '2', '1', '第二部的消息');

-- ----------------------------
-- Table structure for emergencyflowuser
-- ----------------------------
DROP TABLE IF EXISTS `emergencyflowuser`;
CREATE TABLE `emergencyflowuser` (
  `fow_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流程用户id',
  `flow_id` int(11) NOT NULL COMMENT '流程id',
  `user_name` varchar(30) NOT NULL COMMENT '用户登陆名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `user_role` varchar(20) DEFAULT NULL COMMENT '用户角色',
  `plan_id` int(11) NOT NULL COMMENT '预案id',
  `plan_dep_name` varchar(255) DEFAULT NULL COMMENT '预案机构id',
  `user_mobile` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`fow_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyflowuser
-- ----------------------------
INSERT INTO `emergencyflowuser` VALUES ('1', '1', 'xxxx', '张三', '站长', '1', '三峡水站组', '17533631036');
INSERT INTO `emergencyflowuser` VALUES ('2', '2', 'yyy', '李四', '成员', '1', '三峡水站组', '15125271022');
INSERT INTO `emergencyflowuser` VALUES ('3', '1', 'sss', '王五', '副站长', '2', '三峡风力电站组', '15127271818');

-- ----------------------------
-- Table structure for emergencymessage
-- ----------------------------
DROP TABLE IF EXISTS `emergencymessage`;
CREATE TABLE `emergencymessage` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '预案流程id',
  `plan_id` int(11) NOT NULL COMMENT '预案id',
  `user_name` varchar(30) NOT NULL COMMENT '收信人id',
  `nick_name` varchar(30) NOT NULL COMMENT '收信人姓名',
  `event_id` int(11) NOT NULL COMMENT '事件id',
  `message_content` varchar(2550) NOT NULL COMMENT '消息内容',
  `message_time` datetime NOT NULL COMMENT '发送消息时间',
  `message_sender` varchar(30) NOT NULL COMMENT '消息发送人',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencymessage
-- ----------------------------

-- ----------------------------
-- Table structure for emergencyplan
-- ----------------------------
DROP TABLE IF EXISTS `emergencyplan`;
CREATE TABLE `emergencyplan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预案编号',
  `user_name` varchar(30) NOT NULL COMMENT '创建人',
  `plan_name` varchar(255) NOT NULL COMMENT '预案名称',
  `plan_summary` varchar(2550) DEFAULT NULL COMMENT '预案摘要',
  `plan_file` varchar(255) DEFAULT NULL COMMENT '预案文件',
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyplan
-- ----------------------------
INSERT INTO `emergencyplan` VALUES ('1', '单维锋', '测试预案', '试试看', null);

-- ----------------------------
-- Table structure for emergencyplandep
-- ----------------------------
DROP TABLE IF EXISTS `emergencyplandep`;
CREATE TABLE `emergencyplandep` (
  `plan_dep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预案部门id',
  `plan_id` int(11) NOT NULL COMMENT '预案id',
  `plan_dep_name` varchar(255) NOT NULL COMMENT '预案部门名称',
  PRIMARY KEY (`plan_dep_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyplandep
-- ----------------------------

-- ----------------------------
-- Table structure for emergencyplandeps
-- ----------------------------
DROP TABLE IF EXISTS `emergencyplandeps`;
CREATE TABLE `emergencyplandeps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_dep_id` varchar(255) DEFAULT NULL,
  `plan_dep_name` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `emergencyplan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emergencyplandeps_plan_dep_id_unique` (`plan_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emergencyplandeps
-- ----------------------------
INSERT INTO `emergencyplandeps` VALUES ('2', '2', 'qfe', '2', '2021-04-01 01:52:07', '1', '1', '2021-04-01 01:52:04', '2021-04-01 02:13:52', null);

-- ----------------------------
-- Table structure for emergencyplandepuser
-- ----------------------------
DROP TABLE IF EXISTS `emergencyplandepuser`;
CREATE TABLE `emergencyplandepuser` (
  `plan_dep_user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL COMMENT '预案id，外键',
  `plan_dep_id` int(11) NOT NULL COMMENT '预案机构id',
  `user_name` varchar(30) NOT NULL COMMENT '用户登陆名',
  `user_role` varchar(20) DEFAULT NULL COMMENT '用户角色',
  `user_mobile` varchar(11) NOT NULL COMMENT '用户手机号',
  PRIMARY KEY (`plan_dep_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of emergencyplandepuser
-- ----------------------------

-- ----------------------------
-- Table structure for emergencyplans
-- ----------------------------
DROP TABLE IF EXISTS `emergencyplans`;
CREATE TABLE `emergencyplans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_summary` longtext,
  `flan_file` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emergencyplans
-- ----------------------------
INSERT INTO `emergencyplans` VALUES ('1', '2', 'asdd', 'asd', 'asdas', 'dssa', '2021-04-01 01:37:13', '1', '1', '2021-04-01 01:36:59', '2021-04-01 01:37:13');
INSERT INTO `emergencyplans` VALUES ('3', '2', 'dfads', 'dasf', 'afdsf', null, '2021-04-01 02:10:15', '1', '1', '2021-04-01 02:10:11', '2021-04-01 02:15:36');

-- ----------------------------
-- Table structure for flow_events
-- ----------------------------
DROP TABLE IF EXISTS `flow_events`;
CREATE TABLE `flow_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `flow_content` varchar(255) DEFAULT NULL,
  `plan_flow` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_event` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_events
-- ----------------------------
INSERT INTO `flow_events` VALUES ('1', '0', 'dfsd', '78', '2021-04-24 09:33:21', '1', '1', '2021-04-24 09:33:18', '2021-04-24 09:33:21', null);
INSERT INTO `flow_events` VALUES ('2', '1', null, '78', '2021-04-24 09:34:19', null, null, '2021-04-24 09:34:19', '2021-04-24 09:34:19', null);
INSERT INTO `flow_events` VALUES ('3', '1', 'safsdf ', '78', '2021-04-24 09:34:46', null, null, '2021-04-24 09:34:46', '2021-04-24 09:34:46', null);
INSERT INTO `flow_events` VALUES ('4', '1', '是打发斯蒂芬', '93', '2021-04-24 09:42:46', null, null, '2021-04-24 09:42:46', '2021-04-24 09:42:46', null);
INSERT INTO `flow_events` VALUES ('5', '1', '是打发斯蒂芬', '93', '2021-04-24 09:44:26', null, null, '2021-04-24 09:44:26', '2021-04-24 09:44:26', null);
INSERT INTO `flow_events` VALUES ('6', '1', '是打发斯蒂芬', '93', '2021-04-24 09:45:04', null, null, '2021-04-24 09:45:04', '2021-04-24 09:45:04', null);
INSERT INTO `flow_events` VALUES ('7', '1', 'safsdf ', '78', '2021-04-24 10:02:02', null, null, '2021-04-24 10:02:02', '2021-04-24 10:02:02', null);
INSERT INTO `flow_events` VALUES ('8', '1', 'safsdf ', '78', '2021-04-24 10:06:16', null, null, '2021-04-24 10:06:16', '2021-04-24 10:06:16', '1');
INSERT INTO `flow_events` VALUES ('9', '1', '是打发斯蒂芬', '93', '2021-04-24 10:11:00', null, null, '2021-04-24 10:11:00', '2021-04-24 10:11:00', '8');
INSERT INTO `flow_events` VALUES ('10', '0', '', null, '2021-04-24 10:56:58', null, null, '2021-04-24 10:56:58', '2021-04-24 10:56:58', '21');
INSERT INTO `flow_events` VALUES ('11', '0', '总指挥根据事故报告立即到现场进行指挥（总指挥不在现场由副总指挥负责指挥）', '90', '2021-04-24 10:58:34', null, null, '2021-04-24 10:58:34', '2021-04-24 10:58:34', '23');
INSERT INTO `flow_events` VALUES ('12', '0', '发送内容', '88', '2021-04-24 11:00:49', null, null, '2021-04-24 11:00:49', '2021-04-24 11:00:49', '25');
INSERT INTO `flow_events` VALUES ('13', '0', '是打发斯蒂芬', '93', '2021-04-24 11:02:47', null, null, '2021-04-24 11:02:47', '2021-04-24 11:02:47', '26');
INSERT INTO `flow_events` VALUES ('14', '0', '大范甘迪', '94', '2021-04-24 11:02:56', null, null, '2021-04-24 11:02:56', '2021-04-24 11:02:56', '26');
INSERT INTO `flow_events` VALUES ('15', '0', '阿斯顿发斯蒂芬', '95', '2021-04-24 11:03:20', null, null, '2021-04-24 11:03:20', '2021-04-24 11:03:20', '26');
INSERT INTO `flow_events` VALUES ('16', '0', '是打发斯蒂芬', '93', '2021-04-24 11:27:19', null, null, '2021-04-24 11:27:19', '2021-04-24 11:27:19', '28');
INSERT INTO `flow_events` VALUES ('17', '0', '说得好像', '96', '2021-04-24 11:30:00', null, null, '2021-04-24 11:30:00', '2021-04-24 11:30:00', '29');
INSERT INTO `flow_events` VALUES ('18', '0', '说得好像', '97', '2021-04-24 11:30:06', null, null, '2021-04-24 11:30:06', '2021-04-24 11:30:06', '29');
INSERT INTO `flow_events` VALUES ('19', '0', '，好想好想', '98', '2021-04-24 11:30:11', null, null, '2021-04-24 11:30:11', '2021-04-24 11:30:11', '29');
INSERT INTO `flow_events` VALUES ('20', '0', '，好想好想', null, '2021-04-24 11:30:18', null, null, '2021-04-24 11:30:18', '2021-05-10 09:03:07', '29');
INSERT INTO `flow_events` VALUES ('21', '0', '说得好像', '97', '2021-05-10 10:14:30', null, null, '2021-05-10 10:14:30', '2021-05-10 10:14:30', '57');
INSERT INTO `flow_events` VALUES ('22', '0', '大范甘迪', '94', '2021-05-10 10:19:04', null, null, '2021-05-10 10:19:04', '2021-05-10 10:19:04', '58');
INSERT INTO `flow_events` VALUES ('23', '0', '确判明因矛盾纠纷而产生的升级事件动态，及时启动处置应急预案。xgai', '109', '2021-05-28 09:16:28', null, null, '2021-05-28 09:16:28', '2021-05-28 09:16:28', '79');
INSERT INTO `flow_events` VALUES ('24', '0', '在报警的同时，营业网点行长、副行长要做好客户的思想工作，能化解的要尽力化解纠纷，防止事态的扩大。', '110', '2021-05-28 09:16:39', null, null, '2021-05-28 09:16:39', '2021-05-28 09:16:39', '79');
INSERT INTO `flow_events` VALUES ('25', '0', '恢复办公秩序和营业秩序，做好营业网点善后工作。', '112', '2021-05-28 09:16:59', null, null, '2021-05-28 09:16:59', '2021-05-28 09:16:59', '79');

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_summary` longtext,
  `dd_dep_id` bigint(20) DEFAULT NULL,
  `dd_plan_dep_id` varchar(255) DEFAULT NULL,
  `planName` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES ('349', null, '2021-04-13 07:18:08', null, null, '2021-04-13 07:18:08', '2021-05-11 08:35:07', ' 手足口病是一种由肠道病毒引起的一种常见传染病之一，主要感染对象五岁以下婴幼儿。一年四季均可见到，以夏秋季较多。可以通过玩具、食具、鼻咽分泌物、飞沫等多种途径传染，以出疹、发热为特征，临床为口腔内、手、足部等部位发生疱疹，潜伏期为3-8日。修改', null, '479707793', '学校安全预案', '1', null);
INSERT INTO `plans` VALUES ('352', null, '2021-04-15 09:48:54', null, null, '2021-04-15 09:48:54', '2021-04-24 09:17:24', '预案描述', null, '480809152', '预案1', '1', null);
INSERT INTO `plans` VALUES ('353', null, '2021-04-15 10:13:23', null, null, '2021-04-15 10:13:23', '2021-04-24 09:12:27', '本公司生产经营的危险化学品与人体皮肤和眼睛直接接触可能造成灼伤，发生泄漏容易造成人员中毒，其蒸汽与空气能够形成爆炸性混合物；生产和库存的原料、产品与高热源、强氧化剂等接触，易发生火灾爆炸。', null, '480715170', '化学用品公司安全预案', '1', null);
INSERT INTO `plans` VALUES ('354', null, '2021-04-24 09:39:05', null, null, '2021-04-24 09:39:05', '2021-04-28 05:41:26', ' 我耳朵，更改预案', null, '482970125', '尔尔', '1', null);
INSERT INTO `plans` VALUES ('356', null, '2021-04-28 05:19:38', null, null, '2021-04-28 05:19:38', '2021-04-28 05:19:38', '预案秒速', null, '483446822', '创建预案 12', null, null);
INSERT INTO `plans` VALUES ('357', null, '2021-04-28 05:23:36', null, null, '2021-04-28 05:23:36', '2021-04-28 05:23:36', '是大是大非', null, '483732865', '预案111', null, null);
INSERT INTO `plans` VALUES ('358', null, '2021-05-10 09:59:34', null, null, '2021-05-10 09:59:34', '2021-05-10 09:59:34', '手足口病是一种由肠道病毒引起的一种常见传染病之一，主要感染对象五岁以下婴幼儿。一年四季均可见到，以夏秋季较多。可以通过玩具、食具、鼻咽分泌物、飞沫等多种途径传染，以出疹、发热为特征，临床为口腔内、手、足部等部位发生疱疹，潜伏期为3-8日。', null, '485692843', '手足口病应急预案', null, null);

-- ----------------------------
-- Table structure for plans__plan_deps
-- ----------------------------
DROP TABLE IF EXISTS `plans__plan_deps`;
CREATE TABLE `plans__plan_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `plan-dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans__plan_deps
-- ----------------------------
INSERT INTO `plans__plan_deps` VALUES ('1', '243', '2');
INSERT INTO `plans__plan_deps` VALUES ('2', '172', '2');

-- ----------------------------
-- Table structure for plan_deps
-- ----------------------------
DROP TABLE IF EXISTS `plan_deps`;
CREATE TABLE `plan_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan` int(11) DEFAULT NULL,
  `dd_sub_dep_id` varchar(255) DEFAULT NULL,
  `plan_flow` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_deps
-- ----------------------------
INSERT INTO `plan_deps` VALUES ('398', '领导小组及职责', null, '2021-04-13 07:20:13', null, null, '2021-04-13 07:20:13', '2021-04-13 07:20:13', '349', '480083241', null);
INSERT INTO `plan_deps` VALUES ('399', '灭火行动组', null, '2021-04-13 07:20:31', null, null, '2021-04-13 07:20:31', '2021-04-13 07:20:31', '349', '479853756', null);
INSERT INTO `plan_deps` VALUES ('400', '通讯联络组', null, '2021-04-13 07:20:45', null, null, '2021-04-13 07:20:45', '2021-04-13 07:20:45', '349', '480028214', null);
INSERT INTO `plan_deps` VALUES ('401', '疏散引导组', null, '2021-04-13 07:21:02', null, null, '2021-04-13 07:21:02', '2021-04-13 07:21:03', '349', '479865823', null);
INSERT INTO `plan_deps` VALUES ('402', '安全防护救护组', null, '2021-04-13 07:21:19', null, null, '2021-04-13 07:21:19', '2021-04-13 07:21:19', '349', '479962507', null);
INSERT INTO `plan_deps` VALUES ('403', '组织1', null, '2021-04-14 02:45:03', null, null, '2021-04-14 02:45:03', '2021-04-14 04:08:36', null, '479752980', null);
INSERT INTO `plan_deps` VALUES ('404', '组织2', null, '2021-04-14 02:46:23', null, null, '2021-04-14 02:46:23', '2021-04-14 04:08:36', null, '480024419', null);
INSERT INTO `plan_deps` VALUES ('410', '222', null, '2021-04-15 09:11:39', null, null, '2021-04-15 09:11:39', '2021-04-15 09:36:12', null, '480782129', null);
INSERT INTO `plan_deps` VALUES ('417', '组织1', null, '2021-04-15 09:49:07', null, null, '2021-04-15 09:49:07', '2021-04-15 09:49:07', '352', '480189489', null);
INSERT INTO `plan_deps` VALUES ('418', '组织2更改', null, '2021-04-15 09:49:22', null, null, '2021-04-15 09:49:22', '2021-04-15 09:49:38', '352', '480666175', null);
INSERT INTO `plan_deps` VALUES ('419', '指挥部', null, '2021-04-15 10:15:31', null, null, '2021-04-15 10:15:31', '2021-04-15 10:15:31', '353', '480578252', null);
INSERT INTO `plan_deps` VALUES ('420', '救护组', null, '2021-04-15 10:16:44', null, null, '2021-04-15 10:16:44', '2021-04-15 10:16:44', '353', '481029069', null);
INSERT INTO `plan_deps` VALUES ('421', '运输组', null, '2021-04-15 10:17:20', null, null, '2021-04-15 10:17:20', '2021-04-15 10:17:21', '353', '480936187', null);
INSERT INTO `plan_deps` VALUES ('422', '大幅度发的', null, '2021-04-24 09:39:19', null, null, '2021-04-24 09:39:19', '2021-04-24 09:39:19', '354', '482047880', null);
INSERT INTO `plan_deps` VALUES ('423', '风动旛动', null, '2021-04-24 09:39:30', null, null, '2021-04-24 09:39:30', '2021-04-24 09:39:30', '354', '482186846', null);
INSERT INTO `plan_deps` VALUES ('424', '小鬼当家', null, '2021-04-24 11:28:41', null, null, '2021-04-24 11:28:41', '2021-05-10 10:27:55', null, '482232910', null);
INSERT INTO `plan_deps` VALUES ('425', '小鬼当家', null, '2021-04-24 11:28:53', null, null, '2021-04-24 11:28:53', '2021-05-10 10:27:55', null, '482184846', null);
INSERT INTO `plan_deps` VALUES ('426', '预案组织', null, '2021-04-28 05:20:10', null, null, '2021-04-28 05:20:10', '2021-04-28 05:20:10', '356', '483846678', null);
INSERT INTO `plan_deps` VALUES ('427', '热热', null, '2021-04-28 05:20:26', null, null, '2021-04-28 05:20:26', '2021-04-28 05:20:26', '356', '483764871', null);
INSERT INTO `plan_deps` VALUES ('428', '涨价', null, '2021-04-28 05:20:44', null, null, '2021-04-28 05:20:44', '2021-04-28 05:20:44', '356', '484193399', null);
INSERT INTO `plan_deps` VALUES ('429', '撒地方都是', null, '2021-04-28 05:23:47', null, null, '2021-04-28 05:23:47', '2021-04-28 05:23:47', '357', '484230266', null);
INSERT INTO `plan_deps` VALUES ('430', '预案组织', null, '2021-04-28 05:24:40', null, null, '2021-04-28 05:24:40', '2021-04-28 05:24:40', '357', '483505757', null);
INSERT INTO `plan_deps` VALUES ('431', '预案阻止', null, '2021-04-28 05:25:01', null, null, '2021-04-28 05:25:01', '2021-04-28 05:25:01', '357', '483457855', null);
INSERT INTO `plan_deps` VALUES ('432', '尔尔', null, '2021-04-28 05:25:21', null, null, '2021-04-28 05:25:21', '2021-04-28 05:25:21', '357', '483793776', null);
INSERT INTO `plan_deps` VALUES ('433', '防治小组', null, '2021-05-10 10:01:37', null, null, '2021-05-10 10:01:37', '2021-05-10 10:01:37', '358', '486044652', null);
INSERT INTO `plan_deps` VALUES ('434', '宣传教育组', null, '2021-05-10 10:02:48', null, null, '2021-05-10 10:02:48', '2021-05-10 10:02:48', '358', '485677864', null);
INSERT INTO `plan_deps` VALUES ('435', '个人防护', null, '2021-05-10 10:03:23', null, null, '2021-05-10 10:03:23', '2021-05-10 10:03:23', '358', '486265502', null);
INSERT INTO `plan_deps` VALUES ('436', '保健组', null, '2021-05-10 10:04:00', null, null, '2021-05-10 10:04:00', '2021-05-10 10:04:00', '358', '486119569', null);
INSERT INTO `plan_deps` VALUES ('437', '打发第三方 ', null, '2021-05-28 05:11:18', null, null, '2021-05-28 05:11:18', '2021-05-28 09:09:08', null, '491289054', null);
INSERT INTO `plan_deps` VALUES ('438', '撒打发点是', null, '2021-05-28 05:11:32', null, null, '2021-05-28 05:11:32', '2021-05-28 09:09:08', null, '490900797', null);
INSERT INTO `plan_deps` VALUES ('439', ' 领导小组', null, '2021-05-28 09:12:57', null, null, '2021-05-28 09:12:57', '2021-05-28 09:17:20', null, '490982574', null);
INSERT INTO `plan_deps` VALUES ('440', '  矛盾纠纷化解小组', null, '2021-05-28 09:13:13', null, null, '2021-05-28 09:13:13', '2021-05-28 09:17:20', null, '491445030', null);
INSERT INTO `plan_deps` VALUES ('441', '人员疏散小组', null, '2021-05-28 09:13:32', null, null, '2021-05-28 09:13:32', '2021-05-28 09:17:20', null, '491299190', null);
INSERT INTO `plan_deps` VALUES ('442', '现金保护小组', null, '2021-05-28 09:13:51', null, null, '2021-05-28 09:13:51', '2021-05-28 09:17:20', null, '491408051', null);

-- ----------------------------
-- Table structure for plan_deps_plan_dep_users__plan_dep_users_plan_deps
-- ----------------------------
DROP TABLE IF EXISTS `plan_deps_plan_dep_users__plan_dep_users_plan_deps`;
CREATE TABLE `plan_deps_plan_dep_users__plan_dep_users_plan_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan-dep_id` int(11) DEFAULT NULL,
  `plan-dep-user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_deps_plan_dep_users__plan_dep_users_plan_deps
-- ----------------------------
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('1', '2', '4');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('2', '7', '4');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('3', '220', '8');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('4', '201', '8');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('5', '220', '13');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('6', '201', '13');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('7', '223', '14');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('8', '204', '14');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('9', '223', '15');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('10', '204', '15');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('11', '224', '16');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('12', '205', '16');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('13', '224', '17');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('14', '205', '17');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('16', '4', '18');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('17', '5', '18');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('19', '2', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('20', '4', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('21', '5', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('22', '200', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('23', '4', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('24', '201', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('25', '220', '19');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('26', '201', '19');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('27', '112', '4');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('28', '112', '8');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('29', '112', '3');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('30', '112', '15');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('31', '228', '27');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('32', '210', '27');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('33', '228', '28');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('34', '210', '28');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('35', '228', '29');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('36', '211', '29');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('37', '229', '30');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('38', '212', '30');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('39', '230', '31');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('40', '213', '31');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('41', '231', '32');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('42', '214', '32');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('43', '231', '33');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('44', '214', '33');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('45', '232', '34');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('46', '215', '34');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('47', '233', '35');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('48', '216', '35');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('49', '234', '36');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('50', '217', '36');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('51', '235', '37');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('52', '218', '37');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('53', '235', '38');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('54', '219', '38');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('55', '236', '39');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('56', '220', '39');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('57', '236', '40');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('58', '221', '40');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('59', '237', '41');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('60', '222', '41');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('61', '238', '42');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('62', '223', '42');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('63', '238', '43');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('64', '224', '43');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('65', '239', '44');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('66', '225', '44');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('67', '240', '45');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('68', '226', '45');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('69', '240', '46');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('70', '226', '46');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('71', '241', '47');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('72', '227', '47');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('73', '241', '48');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('74', '227', '48');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('75', '242', '49');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('76', '228', '49');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('77', '243', '50');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('78', '229', '50');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('79', '243', '51');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('80', '229', '51');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('81', '244', '52');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('82', '230', '52');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('83', '245', '53');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('84', '231', '53');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('85', '246', '54');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('86', '232', '54');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('87', '246', '55');
INSERT INTO `plan_deps_plan_dep_users__plan_dep_users_plan_deps` VALUES ('88', '232', '55');

-- ----------------------------
-- Table structure for plan_deps__plan_dep_users
-- ----------------------------
DROP TABLE IF EXISTS `plan_deps__plan_dep_users`;
CREATE TABLE `plan_deps__plan_dep_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_dep_id` int(11) DEFAULT NULL,
  `plan-dep-user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_deps__plan_dep_users
-- ----------------------------

-- ----------------------------
-- Table structure for plan_dep_users
-- ----------------------------
DROP TABLE IF EXISTS `plan_dep_users`;
CREATE TABLE `plan_dep_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dep_user_name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_dep` int(11) DEFAULT NULL,
  `dd_user_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_dep_users
-- ----------------------------

-- ----------------------------
-- Table structure for plan_events
-- ----------------------------
DROP TABLE IF EXISTS `plan_events`;
CREATE TABLE `plan_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan` int(11) DEFAULT NULL,
  `plan_event` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_events
-- ----------------------------
INSERT INTO `plan_events` VALUES ('1', '1', '2021-04-24 09:52:00', '1', '1', '2021-04-24 09:51:40', '2021-04-24 10:01:18', '349', null);
INSERT INTO `plan_events` VALUES ('2', '1', '2021-04-24 09:52:30', null, '1', '2021-04-24 09:52:30', '2021-04-24 10:18:35', '349', null);
INSERT INTO `plan_events` VALUES ('3', '1', '2021-04-24 10:18:40', null, '1', '2021-04-24 09:53:16', '2021-04-24 10:18:40', '349', null);
INSERT INTO `plan_events` VALUES ('4', '1', '2021-04-24 09:55:57', null, null, '2021-04-24 09:55:57', '2021-04-24 09:55:57', '354', null);
INSERT INTO `plan_events` VALUES ('5', '1', '2021-04-24 09:59:11', null, null, '2021-04-24 09:59:11', '2021-04-24 09:59:11', '354', null);
INSERT INTO `plan_events` VALUES ('6', '1', '2021-04-24 10:03:02', null, null, '2021-04-24 10:03:02', '2021-04-24 10:03:02', '349', null);
INSERT INTO `plan_events` VALUES ('7', '1', '2021-04-24 10:08:09', null, null, '2021-04-24 10:08:09', '2021-04-24 10:08:09', '354', null);
INSERT INTO `plan_events` VALUES ('8', '1', '2021-04-24 10:10:54', null, null, '2021-04-24 10:10:54', '2021-04-24 10:10:54', '354', null);
INSERT INTO `plan_events` VALUES ('9', '1', '2021-04-24 10:22:35', null, null, '2021-04-24 10:22:35', '2021-04-24 10:22:35', '354', null);
INSERT INTO `plan_events` VALUES ('10', '1', '2021-04-24 10:30:02', null, null, '2021-04-24 10:30:02', '2021-04-24 10:30:02', '354', null);
INSERT INTO `plan_events` VALUES ('11', '1', '2021-04-24 10:33:18', null, null, '2021-04-24 10:33:18', '2021-04-24 10:33:18', '354', null);
INSERT INTO `plan_events` VALUES ('12', '1', '2021-04-24 10:33:27', null, null, '2021-04-24 10:33:27', '2021-04-24 10:33:27', '354', null);
INSERT INTO `plan_events` VALUES ('13', '1', '2021-04-24 10:33:47', null, null, '2021-04-24 10:33:47', '2021-04-24 10:33:47', '353', null);
INSERT INTO `plan_events` VALUES ('14', '1', '2021-04-24 10:36:13', null, null, '2021-04-24 10:36:13', '2021-04-24 10:36:13', '354', null);
INSERT INTO `plan_events` VALUES ('15', '1', '2021-04-24 10:36:22', null, null, '2021-04-24 10:36:22', '2021-04-24 10:36:22', '354', null);
INSERT INTO `plan_events` VALUES ('16', '1', '2021-04-24 10:44:56', null, null, '2021-04-24 10:44:56', '2021-04-24 10:44:56', '352', null);
INSERT INTO `plan_events` VALUES ('17', '1', '2021-04-24 10:46:40', null, null, '2021-04-24 10:46:40', '2021-04-24 10:46:40', '353', null);
INSERT INTO `plan_events` VALUES ('18', '1', '2021-04-24 10:48:18', null, null, '2021-04-24 10:48:18', '2021-04-24 10:48:18', '353', null);
INSERT INTO `plan_events` VALUES ('19', '1', '2021-04-24 10:53:32', null, null, '2021-04-24 10:53:32', '2021-04-24 10:53:32', '354', null);
INSERT INTO `plan_events` VALUES ('20', '1', '2021-04-24 10:56:51', null, null, '2021-04-24 10:56:51', '2021-04-24 10:56:51', '349', null);
INSERT INTO `plan_events` VALUES ('21', '1', '2021-04-24 10:56:56', null, null, '2021-04-24 10:56:56', '2021-04-24 10:56:56', '349', null);
INSERT INTO `plan_events` VALUES ('22', '1', '2021-04-24 10:58:25', null, null, '2021-04-24 10:58:25', '2021-04-24 10:58:25', '353', null);
INSERT INTO `plan_events` VALUES ('23', '1', '2021-04-24 10:58:32', null, null, '2021-04-24 10:58:32', '2021-04-24 10:58:32', '353', null);
INSERT INTO `plan_events` VALUES ('24', '1', '2021-04-24 11:00:38', null, null, '2021-04-24 11:00:38', '2021-04-24 11:00:38', '352', null);
INSERT INTO `plan_events` VALUES ('25', '1', '2021-04-24 11:00:46', null, null, '2021-04-24 11:00:46', '2021-04-24 11:00:46', '352', null);
INSERT INTO `plan_events` VALUES ('26', '1', '2021-04-24 11:02:41', null, null, '2021-04-24 11:02:41', '2021-04-24 11:02:41', '354', null);
INSERT INTO `plan_events` VALUES ('27', '1', '2021-04-24 11:23:44', null, null, '2021-04-24 11:23:44', '2021-04-24 11:23:44', '349', null);
INSERT INTO `plan_events` VALUES ('28', '1', '2021-04-24 11:27:10', null, null, '2021-04-24 11:27:10', '2021-04-24 11:27:10', '354', null);
INSERT INTO `plan_events` VALUES ('29', '1', '2021-04-24 11:29:54', null, null, '2021-04-24 11:29:54', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('30', '1', '2021-04-24 11:33:10', null, null, '2021-04-24 11:33:10', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('31', '1', '2021-04-24 11:40:33', null, null, '2021-04-24 11:40:33', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('32', '1', '2021-04-24 11:45:37', null, null, '2021-04-24 11:45:37', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('33', '1', '2021-04-24 11:46:39', null, null, '2021-04-24 11:46:39', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('34', '1', '2021-04-24 11:48:04', null, null, '2021-04-24 11:48:04', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('35', '1', '2021-04-24 11:48:41', null, null, '2021-04-24 11:48:41', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('36', '1', '2021-04-24 11:49:39', null, null, '2021-04-24 11:49:39', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('37', '1', '2021-04-24 11:50:34', null, null, '2021-04-24 11:50:34', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('38', '1', '2021-04-24 11:52:16', null, null, '2021-04-24 11:52:16', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('39', '1', '2021-04-24 11:53:03', null, null, '2021-04-24 11:53:03', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('40', '1', '2021-04-24 11:53:26', null, null, '2021-04-24 11:53:26', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('41', '1', '2021-04-24 11:54:09', null, null, '2021-04-24 11:54:09', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('42', '1', '2021-04-24 11:54:37', null, null, '2021-04-24 11:54:37', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('43', '1', '2021-04-24 11:56:51', null, null, '2021-04-24 11:56:51', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('44', '1', '2021-04-24 11:57:30', null, null, '2021-04-24 11:57:30', '2021-04-24 11:57:30', '354', null);
INSERT INTO `plan_events` VALUES ('45', '1', '2021-04-24 11:59:22', null, null, '2021-04-24 11:59:22', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('46', '1', '2021-04-24 12:00:02', null, null, '2021-04-24 12:00:02', '2021-04-24 12:00:02', '354', null);
INSERT INTO `plan_events` VALUES ('47', '1', '2021-04-24 12:00:36', null, null, '2021-04-24 12:00:36', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('48', '1', '2021-04-24 12:01:06', null, null, '2021-04-24 12:01:06', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('49', '1', '2021-04-24 12:02:42', null, null, '2021-04-24 12:02:42', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('50', '1', '2021-04-28 05:22:01', null, null, '2021-04-28 05:22:01', '2021-04-28 05:22:01', '356', null);
INSERT INTO `plan_events` VALUES ('51', '1', '2021-04-28 05:26:22', null, null, '2021-04-28 05:26:22', '2021-04-28 05:26:22', '357', null);
INSERT INTO `plan_events` VALUES ('52', '1', '2021-04-28 05:27:01', null, null, '2021-04-28 05:27:01', '2021-04-28 05:27:02', '349', null);
INSERT INTO `plan_events` VALUES ('53', '1', '2021-04-28 05:27:27', null, null, '2021-04-28 05:27:27', '2021-04-28 05:27:27', '354', null);
INSERT INTO `plan_events` VALUES ('54', '1', '2021-04-28 05:41:35', null, null, '2021-04-28 05:41:35', '2021-04-28 05:41:35', '354', null);
INSERT INTO `plan_events` VALUES ('55', '1', '2021-05-10 09:24:47', null, null, '2021-05-10 09:24:47', '2021-05-10 09:24:47', '354', null);
INSERT INTO `plan_events` VALUES ('56', '1', '2021-05-10 10:08:16', null, null, '2021-05-10 10:08:16', '2021-05-10 10:08:16', '358', null);
INSERT INTO `plan_events` VALUES ('57', '1', '2021-05-10 10:14:17', null, null, '2021-05-10 10:14:17', '2021-05-10 10:27:55', null, null);
INSERT INTO `plan_events` VALUES ('58', '1', '2021-05-10 10:18:53', null, null, '2021-05-10 10:18:53', '2021-05-10 10:18:53', '354', null);
INSERT INTO `plan_events` VALUES ('59', '1', '2021-05-10 10:19:26', null, null, '2021-05-10 10:19:26', '2021-05-10 10:19:26', '356', null);
INSERT INTO `plan_events` VALUES ('60', '1', '2021-05-10 10:19:49', null, null, '2021-05-10 10:19:49', '2021-05-10 10:19:49', '354', null);
INSERT INTO `plan_events` VALUES ('61', '1', '2021-05-10 10:20:38', null, null, '2021-05-10 10:20:38', '2021-05-10 10:20:38', '354', null);
INSERT INTO `plan_events` VALUES ('62', '1', '2021-05-10 10:21:35', null, null, '2021-05-10 10:21:35', '2021-05-10 10:21:35', '354', null);
INSERT INTO `plan_events` VALUES ('63', '1', '2021-05-10 10:24:28', null, null, '2021-05-10 10:24:28', '2021-05-10 10:24:28', '354', null);
INSERT INTO `plan_events` VALUES ('64', '1', '2021-05-10 10:25:02', null, null, '2021-05-10 10:25:02', '2021-05-10 10:25:02', '357', null);
INSERT INTO `plan_events` VALUES ('65', '1', '2021-05-10 10:25:20', null, null, '2021-05-10 10:25:20', '2021-05-10 10:25:20', '356', null);
INSERT INTO `plan_events` VALUES ('66', '1', '2021-05-10 10:26:11', null, null, '2021-05-10 10:26:11', '2021-05-10 10:26:11', '358', null);
INSERT INTO `plan_events` VALUES ('67', '1', '2021-05-11 04:01:52', null, null, '2021-05-11 04:01:52', '2021-05-11 04:01:52', '358', null);
INSERT INTO `plan_events` VALUES ('68', '1', '2021-05-11 04:03:01', null, null, '2021-05-11 04:03:01', '2021-05-11 04:03:01', '354', null);
INSERT INTO `plan_events` VALUES ('69', '1', '2021-05-11 04:03:58', null, null, '2021-05-11 04:03:58', '2021-05-11 04:03:58', '353', null);
INSERT INTO `plan_events` VALUES ('70', '1', '2021-05-11 04:04:55', null, null, '2021-05-11 04:04:55', '2021-05-11 04:04:55', '353', null);
INSERT INTO `plan_events` VALUES ('71', '1', '2021-05-11 04:06:06', null, null, '2021-05-11 04:06:06', '2021-05-11 04:06:06', '354', null);
INSERT INTO `plan_events` VALUES ('72', '1', '2021-05-11 04:06:39', null, null, '2021-05-11 04:06:39', '2021-05-11 04:06:39', '352', null);
INSERT INTO `plan_events` VALUES ('73', '1', '2021-05-11 04:20:03', null, null, '2021-05-11 04:20:03', '2021-05-11 04:20:03', '354', null);
INSERT INTO `plan_events` VALUES ('74', '1', '2021-05-11 04:21:38', null, null, '2021-05-11 04:21:38', '2021-05-11 04:21:38', '358', null);
INSERT INTO `plan_events` VALUES ('75', '1', '2021-05-28 05:12:03', null, null, '2021-05-28 05:12:03', '2021-05-28 09:09:08', null, null);
INSERT INTO `plan_events` VALUES ('76', '1', '2021-05-28 05:12:37', null, null, '2021-05-28 05:12:37', '2021-05-28 09:09:08', null, null);
INSERT INTO `plan_events` VALUES ('77', '1', '2021-05-28 09:08:38', null, null, '2021-05-28 09:08:38', '2021-05-28 09:09:08', null, null);
INSERT INTO `plan_events` VALUES ('78', '1', '2021-05-28 09:09:20', null, null, '2021-05-28 09:09:20', '2021-05-28 09:09:20', '357', null);
INSERT INTO `plan_events` VALUES ('79', '1', '2021-05-28 09:16:18', null, null, '2021-05-28 09:16:18', '2021-05-28 09:17:20', null, null);

-- ----------------------------
-- Table structure for plan_flows
-- ----------------------------
DROP TABLE IF EXISTS `plan_flows`;
CREATE TABLE `plan_flows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan` int(11) DEFAULT NULL,
  `message_content` longtext,
  `flow_content` longtext,
  `dd_dep_id_str` longtext,
  `plan_event` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_flows
-- ----------------------------
INSERT INTO `plan_flows` VALUES ('78', '迅速集结待命', '2021-04-13 07:22:14', null, null, '2021-04-13 07:22:14', '2021-04-24 10:01:18', '349', null, '领导小组得悉消防紧急情况后立即赶赴本级指挥所，各种救护队伍迅速集结待命。', '480083241', '1');
INSERT INTO `plan_flows` VALUES ('79', ' 全面检查', '2021-04-13 07:22:44', null, null, '2021-04-13 07:22:44', '2021-04-14 07:45:30', '349', null, '灭火行动组组织有关人员对所属建筑进行全面检查，封堵、关闭危险场所，停止各项室内大型活动', '480028214', null);
INSERT INTO `plan_flows` VALUES ('80', ' 全面检查', '2021-04-13 07:23:11', null, null, '2021-04-13 07:23:11', '2021-04-14 04:01:14', '349', null, '灭火行动组组织有关人员对所属建筑进行全面检查，封堵、关闭危险场所，停止各项室内大型活动', '479853756', null);
INSERT INTO `plan_flows` VALUES ('81', '化学品的管理', '2021-04-13 07:23:44', null, null, '2021-04-13 07:23:44', '2021-04-13 07:23:44', '349', null, '灭火行动组加强对易燃易爆物品、有毒有害化学品的管理，加强供电输电、保管室等重要设备、场所的防护，保证工作顺利进行', '479853756', null);
INSERT INTO `plan_flows` VALUES ('82', ' 全面检查', '2021-04-13 07:24:17', null, null, '2021-04-13 07:24:17', '2021-04-15 09:51:06', '349', null, '安全救护组迅速关闭、切断输电、供水系统（应急照明系统除外）和各种明火，防止滋生其他灾害修改。', '479962507', null);
INSERT INTO `plan_flows` VALUES ('83', '现场救护', '2021-04-13 07:24:46', null, null, '2021-04-13 07:24:47', '2021-04-13 07:24:47', '349', null, '安全救护组迅速开展以抢救人员为主要内容的现场救护工作，及时将受伤人员转移并送至附近救护站抢救', '479962507', null);
INSERT INTO `plan_flows` VALUES ('84', '加强校园值班值勤', '2021-04-13 07:25:15', null, null, '2021-04-13 07:25:15', '2021-04-13 07:25:15', '349', null, '灭火行动组加强对重要设备、重要物品的救护和保护，加强校园值班值勤和巡逻，防止各类犯罪活动的发生', '479853756', null);
INSERT INTO `plan_flows` VALUES ('88', '流程1', '2021-04-15 09:50:07', null, null, '2021-04-15 09:50:07', '2021-04-15 09:50:07', '352', null, '发送内容', '480189489', null);
INSERT INTO `plan_flows` VALUES ('89', '流程2', '2021-04-15 09:50:27', null, null, '2021-04-15 09:50:27', '2021-04-15 09:50:27', '352', null, '2', '480189489', null);
INSERT INTO `plan_flows` VALUES ('90', '指挥', '2021-04-15 10:18:01', null, null, '2021-04-15 10:18:01', '2021-04-15 10:18:01', '353', null, '总指挥根据事故报告立即到现场进行指挥（总指挥不在现场由副总指挥负责指挥）', '480578252', null);
INSERT INTO `plan_flows` VALUES ('91', '救护', '2021-04-15 10:18:44', null, null, '2021-04-15 10:18:44', '2021-04-15 10:18:44', '353', null, '救护组进行现场救护，如有需要立即将伤员送至医院；', '481029069', null);
INSERT INTO `plan_flows` VALUES ('92', '运输', '2021-04-15 10:19:37', null, null, '2021-04-15 10:19:37', '2021-04-15 10:19:37', '353', null, '保证消防设备、设施、器材的有效运输', '480936187', null);
INSERT INTO `plan_flows` VALUES ('93', '打发', '2021-04-24 09:39:44', null, null, '2021-04-24 09:39:44', '2021-04-24 09:39:44', '354', null, '是打发斯蒂芬', '1557143208842061,011341055620774889', null);
INSERT INTO `plan_flows` VALUES ('94', '搭嘎多个', '2021-04-24 09:39:58', null, null, '2021-04-24 09:39:58', '2021-04-24 09:39:59', '354', null, '大范甘迪', '011341055620774889,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('95', '阿森松岛发多少', '2021-04-24 09:40:13', null, null, '2021-04-24 09:40:13', '2021-04-24 09:40:13', '354', null, '阿斯顿发斯蒂芬', '1557143208842061,012540052060937065', null);
INSERT INTO `plan_flows` VALUES ('96', ' 全面检查', '2021-04-24 11:29:09', null, null, '2021-04-24 11:29:09', '2021-05-10 10:27:55', null, null, '说得好像', '012540052060937065,1557143208842061,011341055620774889', null);
INSERT INTO `plan_flows` VALUES ('97', '水果蛋糕', '2021-04-24 11:29:11', null, null, '2021-04-24 11:29:11', '2021-05-10 10:27:55', null, null, '说得好像', '012540052060937065,1557143208842061,011341055620774889', null);
INSERT INTO `plan_flows` VALUES ('98', '说的话', '2021-04-24 11:29:32', null, null, '2021-04-24 11:29:32', '2021-05-10 10:27:55', null, null, '，好想好想', '012540073556681286,012540052060937065', null);
INSERT INTO `plan_flows` VALUES ('101', '预案1', '2021-04-28 05:21:19', null, null, '2021-04-28 05:21:19', '2021-04-28 05:21:19', '356', null, '预案流程民宿', '012540052060937065,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('102', '流程二', '2021-04-28 05:21:42', null, null, '2021-04-28 05:21:42', '2021-04-28 05:21:42', '356', null, '流程民宿', '012540052060937065,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('103', '地方撒多', '2021-04-28 05:25:47', null, null, '2021-04-28 05:25:47', '2021-04-28 05:25:47', '357', null, '大风', '012540052060937065,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('104', '宣传教育', '2021-05-10 10:05:21', null, null, '2021-05-10 10:05:21', '2021-05-10 10:05:21', '358', null, '①组织全体教职工学习防“手足口病”知识。  　　②开展防“手足口病”活动，教育学生做好个人清洁卫生，勤洗手。  　　③分发致家长的告知书，提高家长对“手足口病”的认识。', 'manager1637,011341055620774889,1557143208842061,012540073556681286', null);
INSERT INTO `plan_flows` VALUES ('105', '个人防护', '2021-05-10 10:06:14', null, null, '2021-05-10 10:06:14', '2021-05-10 10:06:14', '358', null, '①全体工作人员要勤洗手。  　　②尽量减少外出。  　　③教职工如有发热、皮疹要暂停工作，及时到去医院检查治疗。  　　④教育学生养成良好的个人卫生习惯，勤剪指甲、勤换衣服、勤洗手、多喝水。', 'manager1637,011341055620774889,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('106', '召开会议', '2021-05-10 10:06:41', null, null, '2021-05-10 10:06:41', '2021-05-10 10:06:41', '358', null, '召开会议，思想上加强重视，每天正确掌握学生出勤人数，了解各班缺勤情况。做好宣传工作，对家长、对学生、对全体教职工开展各种有关手足口病宣传，加强个人卫生习惯的指导', '1557143208842061,012540052060937065', null);
INSERT INTO `plan_flows` VALUES ('107', '老师加强晨检', '2021-05-10 10:07:08', null, null, '2021-05-10 10:07:08', '2021-05-10 10:07:08', '358', null, '老师加强晨检，严格按照一问，二看，三摸，四查的原则，一旦发现发热、皮疹现象立刻劝说家长回家就医，不得入校，并告之班级老师做好随访工作。', '0125400865291038722', null);
INSERT INTO `plan_flows` VALUES ('108', '', '2021-05-28 05:11:46', null, null, '2021-05-28 05:11:46', '2021-05-28 09:09:08', null, null, '打发大水分公司答复', '1557143208842061,011341055620774889', null);
INSERT INTO `plan_flows` VALUES ('109', '', '2021-05-28 09:14:16', null, null, '2021-05-28 09:14:16', '2021-05-28 09:17:20', null, null, '确判明因矛盾纠纷而产生的升级事件动态，及时启动处置应急预案。xgai', '012540052060937065,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('110', '矛盾纠纷化解', '2021-05-28 09:14:41', null, null, '2021-05-28 09:14:41', '2021-05-28 09:17:20', null, null, '在报警的同时，营业网点行长、副行长要做好客户的思想工作，能化解的要尽力化解纠纷，防止事态的扩大。', '012540052060937065,1557143208842061', null);
INSERT INTO `plan_flows` VALUES ('111', '抢救伤员。', '2021-05-28 09:15:03', null, null, '2021-05-28 09:15:03', '2021-05-28 09:17:20', null, null, '配合公安干警和医务人员抢救伤员，保护现场；向公安机关、安全保卫部门和上级有关部门如实报告案情，协助破案。', 'manager1637,1557143208842061,012540052060937065', null);
INSERT INTO `plan_flows` VALUES ('112', '做好善后工作', '2021-05-28 09:15:28', null, null, '2021-05-28 09:15:28', '2021-05-28 09:17:20', null, null, '恢复办公秩序和营业秩序，做好营业网点善后工作。', '1557143208842061', null);

-- ----------------------------
-- Table structure for plan_flows__plan_flow_users
-- ----------------------------
DROP TABLE IF EXISTS `plan_flows__plan_flow_users`;
CREATE TABLE `plan_flows__plan_flow_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_flow_id` int(11) DEFAULT NULL,
  `plan-flow-user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_flows__plan_flow_users
-- ----------------------------

-- ----------------------------
-- Table structure for plan_flow_users
-- ----------------------------
DROP TABLE IF EXISTS `plan_flow_users`;
CREATE TABLE `plan_flow_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_username` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_flow` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_flow_users
-- ----------------------------

-- ----------------------------
-- Table structure for plan_flow_user_deps
-- ----------------------------
DROP TABLE IF EXISTS `plan_flow_user_deps`;
CREATE TABLE `plan_flow_user_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_dep_user` int(11) DEFAULT NULL,
  `dep_name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_flow_user_deps
-- ----------------------------

-- ----------------------------
-- Table structure for replanlists
-- ----------------------------
DROP TABLE IF EXISTS `replanlists`;
CREATE TABLE `replanlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) DEFAULT NULL,
  `plansummary` longtext,
  `plan_file` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replanlists
-- ----------------------------

-- ----------------------------
-- Table structure for replan_deps
-- ----------------------------
DROP TABLE IF EXISTS `replan_deps`;
CREATE TABLE `replan_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replan_deps
-- ----------------------------

-- ----------------------------
-- Table structure for replan_depts
-- ----------------------------
DROP TABLE IF EXISTS `replan_depts`;
CREATE TABLE `replan_depts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_dept_name` varchar(255) DEFAULT NULL,
  `replan` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replan_depts
-- ----------------------------

-- ----------------------------
-- Table structure for strapi_administrator
-- ----------------------------
DROP TABLE IF EXISTS `strapi_administrator`;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_administrator
-- ----------------------------
INSERT INTO `strapi_administrator` VALUES ('1', 'yang', 'shuping', null, 'ysp@doe.com', '$2a$10$s3qKcPdy1l9LYrjJiGcPguEX.27O.u9K7kpiMLUhVs10P8tGNogrK', null, null, '1', null);

-- ----------------------------
-- Table structure for strapi_permission
-- ----------------------------
DROP TABLE IF EXISTS `strapi_permission`;
CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fields` longtext,
  `conditions` longtext,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_permission
-- ----------------------------
INSERT INTO `strapi_permission` VALUES ('1', 'plugins::upload.read', null, null, '[]', '2', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('2', 'plugins::upload.assets.update', null, null, '[]', '2', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('3', 'plugins::upload.assets.create', null, null, '[]', '2', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('4', 'plugins::upload.assets.download', null, null, '[]', '2', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('5', 'plugins::upload.assets.copy-link', null, null, '[]', '2', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('6', 'plugins::upload.read', null, null, '[\"admin::is-creator\"]', '3', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('7', 'plugins::upload.assets.create', null, null, '[]', '3', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('8', 'plugins::upload.assets.update', null, null, '[\"admin::is-creator\"]', '3', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('9', 'plugins::upload.assets.download', null, null, '[]', '3', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('10', 'plugins::upload.assets.copy-link', null, null, '[]', '3', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('11', 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]', '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('12', 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]', '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('13', 'plugins::content-manager.explorer.update', 'plugins::users-permissions.user', '[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]', '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('14', 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('15', 'plugins::content-type-builder.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('16', 'plugins::email.settings.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('17', 'plugins::upload.assets.download', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('18', 'plugins::upload.assets.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('19', 'plugins::upload.assets.create', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('20', 'plugins::upload.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('21', 'plugins::upload.assets.copy-link', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('22', 'plugins::upload.settings.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('23', 'plugins::content-manager.single-types.configure-view', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('24', 'plugins::content-manager.collection-types.configure-view', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('25', 'plugins::content-manager.components.configure-layout', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('26', 'plugins::users-permissions.roles.create', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('27', 'plugins::users-permissions.roles.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('28', 'plugins::users-permissions.roles.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('29', 'plugins::users-permissions.roles.delete', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('30', 'plugins::users-permissions.providers.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('31', 'plugins::users-permissions.email-templates.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('32', 'plugins::users-permissions.providers.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('33', 'plugins::users-permissions.email-templates.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('34', 'plugins::users-permissions.advanced-settings.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('35', 'plugins::users-permissions.advanced-settings.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('36', 'admin::marketplace.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('37', 'admin::marketplace.plugins.install', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('38', 'admin::webhooks.create', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('39', 'admin::webhooks.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('40', 'admin::marketplace.plugins.uninstall', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('41', 'admin::webhooks.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('42', 'admin::webhooks.delete', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('43', 'admin::users.create', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('44', 'admin::users.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('45', 'admin::users.delete', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('46', 'admin::users.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('47', 'admin::roles.create', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('48', 'admin::roles.read', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('49', 'admin::roles.update', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('50', 'admin::roles.delete', null, null, '[]', '1', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_permission` VALUES ('52', 'plugins::content-manager.explorer.create', 'application::test.test', '[\"title\"]', '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('54', 'plugins::content-manager.explorer.read', 'application::test.test', '[\"title\"]', '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('56', 'plugins::content-manager.explorer.update', 'application::test.test', '[\"title\"]', '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('57', 'plugins::content-manager.explorer.delete', 'application::test.test', null, '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('58', 'plugins::content-manager.explorer.delete', 'application::emergencyplan.emergencyplan', null, '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('59', 'plugins::content-manager.explorer.publish', 'application::emergencyplan.emergencyplan', null, '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('60', 'plugins::content-manager.explorer.publish', 'application::test.test', null, '[]', '1', '2021-04-01 01:35:48', '2021-04-01 01:35:49');
INSERT INTO `strapi_permission` VALUES ('64', 'plugins::content-manager.explorer.delete', 'application::emergencyplandep.emergencyplandep', null, '[]', '1', '2021-04-01 01:47:50', '2021-04-01 01:47:50');
INSERT INTO `strapi_permission` VALUES ('65', 'plugins::content-manager.explorer.publish', 'application::emergencyplandep.emergencyplandep', null, '[]', '1', '2021-04-01 01:47:50', '2021-04-01 01:47:50');
INSERT INTO `strapi_permission` VALUES ('66', 'plugins::content-manager.explorer.create', 'application::emergencyplan.emergencyplan', '[\"plan_id\",\"user_name\",\"plan_name\",\"plan_summary\",\"flan_file\",\"emergencyplandeps\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('67', 'plugins::content-manager.explorer.create', 'application::emergencyplandep.emergencyplandep', '[\"plan_dep_id\",\"plan_dep_name\",\"plan_id\",\"emergencyplan\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('68', 'plugins::content-manager.explorer.read', 'application::emergencyplan.emergencyplan', '[\"plan_id\",\"user_name\",\"plan_name\",\"plan_summary\",\"flan_file\",\"emergencyplandeps\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('69', 'plugins::content-manager.explorer.read', 'application::emergencyplandep.emergencyplandep', '[\"plan_dep_id\",\"plan_dep_name\",\"plan_id\",\"emergencyplan\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('70', 'plugins::content-manager.explorer.update', 'application::emergencyplan.emergencyplan', '[\"plan_id\",\"user_name\",\"plan_name\",\"plan_summary\",\"flan_file\",\"emergencyplandeps\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('71', 'plugins::content-manager.explorer.update', 'application::emergencyplandep.emergencyplandep', '[\"plan_dep_id\",\"plan_dep_name\",\"plan_id\",\"emergencyplan\"]', '[]', '1', '2021-04-01 02:09:43', '2021-04-01 02:09:43');
INSERT INTO `strapi_permission` VALUES ('75', 'plugins::content-manager.explorer.delete', 'application::replanlist.replanlist', null, '[]', '1', '2021-04-01 02:23:00', '2021-04-01 02:23:00');
INSERT INTO `strapi_permission` VALUES ('76', 'plugins::content-manager.explorer.publish', 'application::replanlist.replanlist', null, '[]', '1', '2021-04-01 02:23:00', '2021-04-01 02:23:00');
INSERT INTO `strapi_permission` VALUES ('77', 'plugins::content-manager.explorer.create', 'application::replan-dep.replan-dep', '[]', '[]', '1', '2021-04-01 02:31:48', '2021-04-01 02:33:17');
INSERT INTO `strapi_permission` VALUES ('78', 'plugins::content-manager.explorer.read', 'application::replan-dep.replan-dep', '[]', '[]', '1', '2021-04-01 02:31:48', '2021-04-01 02:33:17');
INSERT INTO `strapi_permission` VALUES ('79', 'plugins::content-manager.explorer.update', 'application::replan-dep.replan-dep', '[]', '[]', '1', '2021-04-01 02:31:48', '2021-04-01 02:33:17');
INSERT INTO `strapi_permission` VALUES ('80', 'plugins::content-manager.explorer.delete', 'application::replan-dep.replan-dep', null, '[]', '1', '2021-04-01 02:31:48', '2021-04-01 02:31:49');
INSERT INTO `strapi_permission` VALUES ('81', 'plugins::content-manager.explorer.publish', 'application::replan-dep.replan-dep', null, '[]', '1', '2021-04-01 02:31:48', '2021-04-01 02:31:49');
INSERT INTO `strapi_permission` VALUES ('85', 'plugins::content-manager.explorer.delete', 'application::replan-dept.replan-dept', null, '[]', '1', '2021-04-01 02:34:23', '2021-04-01 02:34:23');
INSERT INTO `strapi_permission` VALUES ('86', 'plugins::content-manager.explorer.publish', 'application::replan-dept.replan-dept', null, '[]', '1', '2021-04-01 02:34:23', '2021-04-01 02:34:23');
INSERT INTO `strapi_permission` VALUES ('87', 'plugins::content-manager.explorer.create', 'application::replan-dept.replan-dept', '[\"plan_dept_name\",\"replan\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('88', 'plugins::content-manager.explorer.create', 'application::replanlist.replanlist', '[\"plan_name\",\"plansummary\",\"plan_file\",\"replan_depts\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('89', 'plugins::content-manager.explorer.read', 'application::replan-dept.replan-dept', '[\"plan_dept_name\",\"replan\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('90', 'plugins::content-manager.explorer.read', 'application::replanlist.replanlist', '[\"plan_name\",\"plansummary\",\"plan_file\",\"replan_depts\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('91', 'plugins::content-manager.explorer.update', 'application::replan-dept.replan-dept', '[\"plan_dept_name\",\"replan\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('92', 'plugins::content-manager.explorer.update', 'application::replanlist.replanlist', '[\"plan_name\",\"plansummary\",\"plan_file\",\"replan_depts\"]', '[]', '1', '2021-04-01 02:35:32', '2021-04-01 02:35:32');
INSERT INTO `strapi_permission` VALUES ('96', 'plugins::content-manager.explorer.delete', 'application::plan.plan', null, '[]', '1', '2021-04-01 02:42:21', '2021-04-01 02:42:21');
INSERT INTO `strapi_permission` VALUES ('97', 'plugins::content-manager.explorer.publish', 'application::plan.plan', null, '[]', '1', '2021-04-01 02:42:21', '2021-04-01 02:42:21');
INSERT INTO `strapi_permission` VALUES ('101', 'plugins::content-manager.explorer.delete', 'application::plan-dep.plan-dep', null, '[]', '1', '2021-04-01 02:44:04', '2021-04-01 02:44:04');
INSERT INTO `strapi_permission` VALUES ('102', 'plugins::content-manager.explorer.publish', 'application::plan-dep.plan-dep', null, '[]', '1', '2021-04-01 02:44:04', '2021-04-01 02:44:04');
INSERT INTO `strapi_permission` VALUES ('106', 'plugins::content-manager.explorer.delete', 'application::plan-dep-user.plan-dep-user', null, '[]', '1', '2021-04-01 02:45:55', '2021-04-01 02:45:55');
INSERT INTO `strapi_permission` VALUES ('107', 'plugins::content-manager.explorer.publish', 'application::plan-dep-user.plan-dep-user', null, '[]', '1', '2021-04-01 02:45:55', '2021-04-01 02:45:55');
INSERT INTO `strapi_permission` VALUES ('111', 'plugins::content-manager.explorer.delete', 'application::plan-flow.plan-flow', null, '[]', '1', '2021-04-01 02:47:00', '2021-04-01 02:47:00');
INSERT INTO `strapi_permission` VALUES ('112', 'plugins::content-manager.explorer.publish', 'application::plan-flow.plan-flow', null, '[]', '1', '2021-04-01 02:47:00', '2021-04-01 02:47:00');
INSERT INTO `strapi_permission` VALUES ('134', 'plugins::content-manager.explorer.delete', 'application::plan-flow-user.plan-flow-user', null, '[]', '1', '2021-04-01 05:34:43', '2021-04-01 05:34:43');
INSERT INTO `strapi_permission` VALUES ('135', 'plugins::content-manager.explorer.publish', 'application::plan-flow-user.plan-flow-user', null, '[]', '1', '2021-04-01 05:34:43', '2021-04-01 05:34:43');
INSERT INTO `strapi_permission` VALUES ('149', 'plugins::content-manager.explorer.create', 'application::plan-flow-user-dep.plan-flow-user-dep', '[\"plan_dep_user\",\"dep_name\"]', '[]', '1', '2021-04-02 02:21:39', '2021-04-02 02:21:39');
INSERT INTO `strapi_permission` VALUES ('151', 'plugins::content-manager.explorer.read', 'application::plan-flow-user-dep.plan-flow-user-dep', '[\"plan_dep_user\",\"dep_name\"]', '[]', '1', '2021-04-02 02:21:39', '2021-04-02 02:21:39');
INSERT INTO `strapi_permission` VALUES ('153', 'plugins::content-manager.explorer.update', 'application::plan-flow-user-dep.plan-flow-user-dep', '[\"plan_dep_user\",\"dep_name\"]', '[]', '1', '2021-04-02 02:21:39', '2021-04-02 02:21:39');
INSERT INTO `strapi_permission` VALUES ('154', 'plugins::content-manager.explorer.delete', 'application::plan-flow-user-dep.plan-flow-user-dep', null, '[]', '1', '2021-04-02 02:21:39', '2021-04-02 02:21:39');
INSERT INTO `strapi_permission` VALUES ('155', 'plugins::content-manager.explorer.publish', 'application::plan-flow-user-dep.plan-flow-user-dep', null, '[]', '1', '2021-04-02 02:21:39', '2021-04-02 02:21:39');
INSERT INTO `strapi_permission` VALUES ('180', 'plugins::content-manager.explorer.create', 'application::plan-flow-user.plan-flow-user', '[\"flow_username\",\"plan_flow\"]', '[]', '1', '2021-04-07 07:18:06', '2021-04-07 07:18:06');
INSERT INTO `strapi_permission` VALUES ('181', 'plugins::content-manager.explorer.read', 'application::plan-flow-user.plan-flow-user', '[\"flow_username\",\"plan_flow\"]', '[]', '1', '2021-04-07 07:18:06', '2021-04-07 07:18:06');
INSERT INTO `strapi_permission` VALUES ('182', 'plugins::content-manager.explorer.update', 'application::plan-flow-user.plan-flow-user', '[\"flow_username\",\"plan_flow\"]', '[]', '1', '2021-04-07 07:18:06', '2021-04-07 07:18:06');
INSERT INTO `strapi_permission` VALUES ('183', 'plugins::content-manager.explorer.create', 'application::plan-dep-user.plan-dep-user', '[\"dep_user_name\",\"plan_flow_user_deps\",\"dd_user_id\",\"phone\",\"plan_dep\"]', '[]', '1', '2021-04-07 07:19:19', '2021-04-07 07:19:19');
INSERT INTO `strapi_permission` VALUES ('184', 'plugins::content-manager.explorer.read', 'application::plan-dep-user.plan-dep-user', '[\"dep_user_name\",\"plan_flow_user_deps\",\"dd_user_id\",\"phone\",\"plan_dep\"]', '[]', '1', '2021-04-07 07:19:19', '2021-04-07 07:19:19');
INSERT INTO `strapi_permission` VALUES ('185', 'plugins::content-manager.explorer.update', 'application::plan-dep-user.plan-dep-user', '[\"dep_user_name\",\"plan_flow_user_deps\",\"dd_user_id\",\"phone\",\"plan_dep\"]', '[]', '1', '2021-04-07 07:19:19', '2021-04-07 07:19:19');
INSERT INTO `strapi_permission` VALUES ('192', 'plugins::content-manager.explorer.create', 'application::plan-dep.plan-dep', '[\"dep_name\",\"plan_dep_users\",\"dd_sub_dep_id\",\"plan\",\"plan_flow\"]', '[]', '1', '2021-04-08 01:33:45', '2021-04-08 01:33:45');
INSERT INTO `strapi_permission` VALUES ('194', 'plugins::content-manager.explorer.read', 'application::plan-dep.plan-dep', '[\"dep_name\",\"plan_dep_users\",\"dd_sub_dep_id\",\"plan\",\"plan_flow\"]', '[]', '1', '2021-04-08 01:33:45', '2021-04-08 01:33:45');
INSERT INTO `strapi_permission` VALUES ('196', 'plugins::content-manager.explorer.update', 'application::plan-dep.plan-dep', '[\"dep_name\",\"plan_dep_users\",\"dd_sub_dep_id\",\"plan\",\"plan_flow\"]', '[]', '1', '2021-04-08 01:33:45', '2021-04-08 01:33:45');
INSERT INTO `strapi_permission` VALUES ('213', 'plugins::content-manager.explorer.delete', 'application::flow-event.flow-event', null, '[]', '1', '2021-04-24 09:32:25', '2021-04-24 09:32:25');
INSERT INTO `strapi_permission` VALUES ('214', 'plugins::content-manager.explorer.publish', 'application::flow-event.flow-event', null, '[]', '1', '2021-04-24 09:32:25', '2021-04-24 09:32:25');
INSERT INTO `strapi_permission` VALUES ('218', 'plugins::content-manager.explorer.publish', 'application::plan-event.plan-event', null, '[]', '1', '2021-04-24 09:49:16', '2021-04-24 09:49:16');
INSERT INTO `strapi_permission` VALUES ('219', 'plugins::content-manager.explorer.delete', 'application::plan-event.plan-event', null, '[]', '1', '2021-04-24 09:49:16', '2021-04-24 09:49:16');
INSERT INTO `strapi_permission` VALUES ('221', 'plugins::content-manager.explorer.create', 'application::plan.plan', '[\"plan_deps\",\"plan_flows\",\"plan_summary\",\"dd_plan_dep_id\",\"planName\",\"status\",\"count\",\"plan_events\"]', '[]', '1', '2021-04-24 09:49:40', '2021-04-24 09:49:40');
INSERT INTO `strapi_permission` VALUES ('223', 'plugins::content-manager.explorer.read', 'application::plan.plan', '[\"plan_deps\",\"plan_flows\",\"plan_summary\",\"dd_plan_dep_id\",\"planName\",\"status\",\"count\",\"plan_events\"]', '[]', '1', '2021-04-24 09:49:40', '2021-04-24 09:49:40');
INSERT INTO `strapi_permission` VALUES ('225', 'plugins::content-manager.explorer.update', 'application::plan.plan', '[\"plan_deps\",\"plan_flows\",\"plan_summary\",\"dd_plan_dep_id\",\"planName\",\"status\",\"count\",\"plan_events\"]', '[]', '1', '2021-04-24 09:49:40', '2021-04-24 09:49:40');
INSERT INTO `strapi_permission` VALUES ('228', 'plugins::content-manager.explorer.create', 'application::plan-flow.plan-flow', '[\"flow_name\",\"plan\",\"plan_flow_users\",\"flow_content\",\"plan_deps\",\"dd_dep_id_str\",\"flow_events\"]', '[]', '1', '2021-04-24 09:57:41', '2021-04-24 10:05:19');
INSERT INTO `strapi_permission` VALUES ('229', 'plugins::content-manager.explorer.read', 'application::plan-flow.plan-flow', '[\"flow_name\",\"plan\",\"plan_flow_users\",\"flow_content\",\"plan_deps\",\"dd_dep_id_str\",\"flow_events\"]', '[]', '1', '2021-04-24 09:57:41', '2021-04-24 10:05:19');
INSERT INTO `strapi_permission` VALUES ('231', 'plugins::content-manager.explorer.update', 'application::plan-flow.plan-flow', '[\"flow_name\",\"plan\",\"plan_flow_users\",\"flow_content\",\"plan_deps\",\"dd_dep_id_str\",\"flow_events\"]', '[]', '1', '2021-04-24 09:57:41', '2021-04-24 10:05:19');
INSERT INTO `strapi_permission` VALUES ('235', 'plugins::content-manager.explorer.create', 'application::flow-event.flow-event', '[\"status\",\"flow_content\",\"plan_flow\",\"plan_event\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');
INSERT INTO `strapi_permission` VALUES ('236', 'plugins::content-manager.explorer.create', 'application::plan-event.plan-event', '[\"status\",\"plan\",\"flow_events\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');
INSERT INTO `strapi_permission` VALUES ('237', 'plugins::content-manager.explorer.read', 'application::flow-event.flow-event', '[\"status\",\"flow_content\",\"plan_flow\",\"plan_event\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');
INSERT INTO `strapi_permission` VALUES ('238', 'plugins::content-manager.explorer.read', 'application::plan-event.plan-event', '[\"status\",\"plan\",\"flow_events\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');
INSERT INTO `strapi_permission` VALUES ('239', 'plugins::content-manager.explorer.update', 'application::flow-event.flow-event', '[\"status\",\"flow_content\",\"plan_flow\",\"plan_event\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');
INSERT INTO `strapi_permission` VALUES ('240', 'plugins::content-manager.explorer.update', 'application::plan-event.plan-event', '[\"status\",\"plan\",\"flow_events\"]', '[]', '1', '2021-04-24 10:05:51', '2021-04-24 10:05:51');

-- ----------------------------
-- Table structure for strapi_role
-- ----------------------------
DROP TABLE IF EXISTS `strapi_role`;
CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_role
-- ----------------------------
INSERT INTO `strapi_role` VALUES ('1', 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_role` VALUES ('2', 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-04-01 01:29:21', '2021-04-01 01:29:21');
INSERT INTO `strapi_role` VALUES ('3', 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-04-01 01:29:21', '2021-04-01 01:29:21');

-- ----------------------------
-- Table structure for strapi_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `strapi_users_roles`;
CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_users_roles
-- ----------------------------
INSERT INTO `strapi_users_roles` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for strapi_webhooks
-- ----------------------------
DROP TABLE IF EXISTS `strapi_webhooks`;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_webhooks
-- ----------------------------

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tests
-- ----------------------------
INSERT INTO `tests` VALUES ('1', '出生地发多少', '2021-04-02 02:14:07', '1', '1', '2021-04-02 02:10:21', '2021-04-02 02:14:07');

-- ----------------------------
-- Table structure for upload_file
-- ----------------------------
DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_file
-- ----------------------------

-- ----------------------------
-- Table structure for upload_file_morph
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_morph`;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_file_morph
-- ----------------------------

-- ----------------------------
-- Table structure for users-permissions_permission
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_permission`;
CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_permission
-- ----------------------------
INSERT INTO `users-permissions_permission` VALUES ('1', 'content-manager', 'collection-types', 'bulkdelete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('2', 'content-manager', 'collection-types', 'bulkdelete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('3', 'content-manager', 'collection-types', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('4', 'content-manager', 'collection-types', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('5', 'content-manager', 'collection-types', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('6', 'content-manager', 'collection-types', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('7', 'content-manager', 'collection-types', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('8', 'content-manager', 'collection-types', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('9', 'content-manager', 'collection-types', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('10', 'content-manager', 'collection-types', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('11', 'content-manager', 'collection-types', 'previewmanyrelations', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('12', 'content-manager', 'collection-types', 'previewmanyrelations', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('13', 'content-manager', 'collection-types', 'publish', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('14', 'content-manager', 'collection-types', 'publish', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('15', 'content-manager', 'collection-types', 'unpublish', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('16', 'content-manager', 'collection-types', 'unpublish', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('17', 'content-manager', 'collection-types', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('18', 'content-manager', 'collection-types', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('19', 'content-manager', 'components', 'findcomponentconfiguration', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('20', 'content-manager', 'components', 'findcomponentconfiguration', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('21', 'content-manager', 'components', 'findcomponents', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('22', 'content-manager', 'components', 'findcomponents', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('23', 'content-manager', 'components', 'updatecomponentconfiguration', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('24', 'content-manager', 'components', 'updatecomponentconfiguration', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('25', 'content-manager', 'content-types', 'findcontenttypeconfiguration', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('26', 'content-manager', 'content-types', 'findcontenttypeconfiguration', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('27', 'content-manager', 'content-types', 'updatecontenttypeconfiguration', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('28', 'content-manager', 'content-types', 'findcontenttypes', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('29', 'content-manager', 'content-types', 'updatecontenttypeconfiguration', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('30', 'content-manager', 'content-types', 'findcontenttypes', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('31', 'content-manager', 'relations', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('32', 'content-manager', 'relations', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('33', 'content-manager', 'single-types', 'createorupdate', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('34', 'content-manager', 'single-types', 'createorupdate', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('35', 'content-manager', 'single-types', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('36', 'content-manager', 'single-types', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('37', 'content-manager', 'single-types', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('38', 'content-manager', 'single-types', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('39', 'content-manager', 'single-types', 'publish', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('40', 'content-manager', 'single-types', 'publish', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('41', 'content-manager', 'single-types', 'unpublish', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('42', 'content-manager', 'single-types', 'unpublish', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('43', 'content-manager', 'uid', 'checkuidavailability', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('44', 'content-manager', 'uid', 'checkuidavailability', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('45', 'content-manager', 'uid', 'generateuid', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('46', 'content-manager', 'uid', 'generateuid', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('47', 'content-type-builder', 'builder', 'getreservednames', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('48', 'content-type-builder', 'builder', 'getreservednames', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('49', 'content-type-builder', 'componentcategories', 'deletecategory', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('50', 'content-type-builder', 'componentcategories', 'deletecategory', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('51', 'content-type-builder', 'componentcategories', 'editcategory', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('52', 'content-type-builder', 'componentcategories', 'editcategory', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('53', 'content-type-builder', 'components', 'createcomponent', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('54', 'content-type-builder', 'components', 'createcomponent', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('55', 'content-type-builder', 'components', 'deletecomponent', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('56', 'content-type-builder', 'components', 'deletecomponent', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('57', 'content-type-builder', 'components', 'getcomponent', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('58', 'content-type-builder', 'components', 'getcomponent', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('59', 'content-type-builder', 'components', 'getcomponents', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('60', 'content-type-builder', 'components', 'getcomponents', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('61', 'content-type-builder', 'components', 'updatecomponent', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('62', 'content-type-builder', 'components', 'updatecomponent', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('63', 'content-type-builder', 'connections', 'getconnections', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('64', 'content-type-builder', 'connections', 'getconnections', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('65', 'content-type-builder', 'contenttypes', 'createcontenttype', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('66', 'content-type-builder', 'contenttypes', 'createcontenttype', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('67', 'content-type-builder', 'contenttypes', 'deletecontenttype', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('68', 'content-type-builder', 'contenttypes', 'deletecontenttype', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('69', 'content-type-builder', 'contenttypes', 'getcontenttype', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('70', 'content-type-builder', 'contenttypes', 'getcontenttype', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('71', 'content-type-builder', 'contenttypes', 'getcontenttypes', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('72', 'content-type-builder', 'contenttypes', 'getcontenttypes', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('73', 'content-type-builder', 'contenttypes', 'updatecontenttype', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('74', 'content-type-builder', 'contenttypes', 'updatecontenttype', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('75', 'email', 'email', 'getsettings', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('76', 'email', 'email', 'getsettings', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('77', 'email', 'email', 'send', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('78', 'email', 'email', 'send', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('79', 'email', 'email', 'test', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('80', 'email', 'email', 'test', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('81', 'upload', 'upload', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('82', 'upload', 'upload', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('83', 'upload', 'upload', 'destroy', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('84', 'upload', 'upload', 'destroy', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('85', 'upload', 'upload', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('86', 'upload', 'upload', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('87', 'upload', 'upload', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('88', 'upload', 'upload', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('89', 'upload', 'upload', 'getsettings', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('90', 'upload', 'upload', 'getsettings', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('91', 'upload', 'upload', 'search', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('92', 'upload', 'upload', 'search', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('93', 'upload', 'upload', 'updatesettings', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('94', 'upload', 'upload', 'updatesettings', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('95', 'upload', 'upload', 'upload', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('96', 'upload', 'upload', 'upload', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('97', 'users-permissions', 'auth', 'callback', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('98', 'users-permissions', 'auth', 'callback', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('99', 'users-permissions', 'auth', 'connect', '1', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('100', 'users-permissions', 'auth', 'connect', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('101', 'users-permissions', 'auth', 'emailconfirmation', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('102', 'users-permissions', 'auth', 'emailconfirmation', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('103', 'users-permissions', 'auth', 'forgotpassword', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('104', 'users-permissions', 'auth', 'forgotpassword', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('105', 'users-permissions', 'auth', 'register', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('106', 'users-permissions', 'auth', 'register', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('107', 'users-permissions', 'auth', 'resetpassword', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('108', 'users-permissions', 'auth', 'resetpassword', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('109', 'users-permissions', 'auth', 'sendemailconfirmation', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('110', 'users-permissions', 'auth', 'sendemailconfirmation', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('111', 'users-permissions', 'user', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('112', 'users-permissions', 'user', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('113', 'users-permissions', 'user', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('114', 'users-permissions', 'user', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('115', 'users-permissions', 'user', 'destroy', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('116', 'users-permissions', 'user', 'destroy', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('117', 'users-permissions', 'user', 'destroyall', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('118', 'users-permissions', 'user', 'destroyall', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('119', 'users-permissions', 'user', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('120', 'users-permissions', 'user', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('121', 'users-permissions', 'user', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('122', 'users-permissions', 'user', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('123', 'users-permissions', 'user', 'me', '1', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('124', 'users-permissions', 'user', 'me', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('125', 'users-permissions', 'user', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('126', 'users-permissions', 'user', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('127', 'users-permissions', 'userspermissions', 'createrole', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('128', 'users-permissions', 'userspermissions', 'createrole', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('129', 'users-permissions', 'userspermissions', 'deleterole', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('130', 'users-permissions', 'userspermissions', 'deleterole', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('131', 'users-permissions', 'userspermissions', 'getadvancedsettings', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('132', 'users-permissions', 'userspermissions', 'getadvancedsettings', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('133', 'users-permissions', 'userspermissions', 'getemailtemplate', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('134', 'users-permissions', 'userspermissions', 'getemailtemplate', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('135', 'users-permissions', 'userspermissions', 'getpermissions', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('136', 'users-permissions', 'userspermissions', 'getpermissions', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('137', 'users-permissions', 'userspermissions', 'getpolicies', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('138', 'users-permissions', 'userspermissions', 'getpolicies', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('139', 'users-permissions', 'userspermissions', 'getproviders', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('140', 'users-permissions', 'userspermissions', 'getproviders', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('141', 'users-permissions', 'userspermissions', 'getrole', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('142', 'users-permissions', 'userspermissions', 'getrole', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('143', 'users-permissions', 'userspermissions', 'getroles', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('144', 'users-permissions', 'userspermissions', 'getroles', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('145', 'users-permissions', 'userspermissions', 'getroutes', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('146', 'users-permissions', 'userspermissions', 'getroutes', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('147', 'users-permissions', 'userspermissions', 'index', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('148', 'users-permissions', 'userspermissions', 'index', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('149', 'users-permissions', 'userspermissions', 'searchusers', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('150', 'users-permissions', 'userspermissions', 'searchusers', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('151', 'users-permissions', 'userspermissions', 'updateadvancedsettings', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('152', 'users-permissions', 'userspermissions', 'updateadvancedsettings', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('153', 'users-permissions', 'userspermissions', 'updateemailtemplate', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('154', 'users-permissions', 'userspermissions', 'updateemailtemplate', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('155', 'users-permissions', 'userspermissions', 'updateproviders', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('156', 'users-permissions', 'userspermissions', 'updateproviders', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('157', 'users-permissions', 'userspermissions', 'updaterole', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('158', 'users-permissions', 'userspermissions', 'updaterole', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('159', 'application', 'emergencyplan', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('160', 'application', 'emergencyplan', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('161', 'application', 'emergencyplan', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('162', 'application', 'emergencyplan', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('163', 'application', 'emergencyplan', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('164', 'application', 'emergencyplan', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('165', 'application', 'emergencyplan', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('166', 'application', 'emergencyplan', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('167', 'application', 'emergencyplan', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('168', 'application', 'emergencyplan', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('169', 'application', 'emergencyplan', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('170', 'application', 'emergencyplan', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('171', 'application', 'test', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('172', 'application', 'test', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('173', 'application', 'test', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('174', 'application', 'test', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('175', 'application', 'test', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('176', 'application', 'test', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('177', 'application', 'test', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('178', 'application', 'test', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('179', 'application', 'test', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('180', 'application', 'test', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('181', 'application', 'test', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('182', 'application', 'test', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('183', 'application', 'emergencyplandep', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('184', 'application', 'emergencyplandep', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('185', 'application', 'emergencyplandep', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('186', 'application', 'emergencyplandep', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('187', 'application', 'emergencyplandep', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('188', 'application', 'emergencyplandep', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('189', 'application', 'emergencyplandep', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('190', 'application', 'emergencyplandep', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('191', 'application', 'emergencyplandep', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('192', 'application', 'emergencyplandep', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('193', 'application', 'emergencyplandep', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('194', 'application', 'emergencyplandep', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('195', 'application', 'replanlist', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('196', 'application', 'replanlist', 'count', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('197', 'application', 'replanlist', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('198', 'application', 'replanlist', 'create', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('199', 'application', 'replanlist', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('200', 'application', 'replanlist', 'delete', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('201', 'application', 'replanlist', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('202', 'application', 'replanlist', 'find', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('203', 'application', 'replanlist', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('204', 'application', 'replanlist', 'findone', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('205', 'application', 'replanlist', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('206', 'application', 'replanlist', 'update', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('207', 'application', 'replan-dep', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('208', 'application', 'replan-dep', 'delete', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('209', 'application', 'replan-dep', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('210', 'application', 'replan-dep', 'find', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('211', 'application', 'replan-dep', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('212', 'application', 'replan-dep', 'update', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('213', 'application', 'replan-dept', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('214', 'application', 'replan-dept', 'count', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('215', 'application', 'replan-dept', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('216', 'application', 'replan-dept', 'create', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('217', 'application', 'replan-dept', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('218', 'application', 'replan-dept', 'delete', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('219', 'application', 'replan-dept', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('220', 'application', 'replan-dept', 'find', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('221', 'application', 'replan-dept', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('222', 'application', 'replan-dept', 'findone', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('223', 'application', 'replan-dept', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('224', 'application', 'replan-dept', 'update', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('225', 'application', 'plan', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('226', 'application', 'plan', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('227', 'application', 'plan', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('228', 'application', 'plan', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('229', 'application', 'plan', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('230', 'application', 'plan', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('231', 'application', 'plan', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('232', 'application', 'plan', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('233', 'application', 'plan', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('234', 'application', 'plan', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('235', 'application', 'plan', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('236', 'application', 'plan', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('237', 'application', 'plan-dep', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('238', 'application', 'plan-dep', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('239', 'application', 'plan-dep', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('240', 'application', 'plan-dep', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('241', 'application', 'plan-dep', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('242', 'application', 'plan-dep', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('243', 'application', 'plan-dep', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('244', 'application', 'plan-dep', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('245', 'application', 'plan-dep', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('246', 'application', 'plan-dep', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('247', 'application', 'plan-dep', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('248', 'application', 'plan-dep', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('249', 'application', 'plan-dep-user', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('250', 'application', 'plan-dep-user', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('251', 'application', 'plan-dep-user', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('252', 'application', 'plan-dep-user', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('253', 'application', 'plan-dep-user', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('254', 'application', 'plan-dep-user', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('255', 'application', 'plan-dep-user', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('256', 'application', 'plan-dep-user', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('257', 'application', 'plan-dep-user', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('258', 'application', 'plan-dep-user', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('259', 'application', 'plan-dep-user', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('260', 'application', 'plan-dep-user', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('261', 'application', 'plan-flow', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('262', 'application', 'plan-flow', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('263', 'application', 'plan-flow', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('264', 'application', 'plan-flow', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('265', 'application', 'plan-flow', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('266', 'application', 'plan-flow', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('267', 'application', 'plan-flow', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('268', 'application', 'plan-flow', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('269', 'application', 'plan-flow', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('270', 'application', 'plan-flow', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('271', 'application', 'plan-flow', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('272', 'application', 'plan-flow', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('273', 'application', 'plan-flow-user', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('274', 'application', 'plan-flow-user', 'count', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('275', 'application', 'plan-flow-user', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('276', 'application', 'plan-flow-user', 'create', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('277', 'application', 'plan-flow-user', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('278', 'application', 'plan-flow-user', 'delete', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('279', 'application', 'plan-flow-user', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('280', 'application', 'plan-flow-user', 'find', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('281', 'application', 'plan-flow-user', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('282', 'application', 'plan-flow-user', 'findone', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('283', 'application', 'plan-flow-user', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('284', 'application', 'plan-flow-user', 'update', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('285', 'application', 'plan-flow-user-dep', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('286', 'application', 'plan-flow-user-dep', 'count', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('287', 'application', 'plan-flow-user-dep', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('288', 'application', 'plan-flow-user-dep', 'create', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('289', 'application', 'plan-flow-user-dep', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('290', 'application', 'plan-flow-user-dep', 'delete', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('291', 'application', 'plan-flow-user-dep', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('292', 'application', 'plan-flow-user-dep', 'find', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('293', 'application', 'plan-flow-user-dep', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('294', 'application', 'plan-flow-user-dep', 'findone', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('295', 'application', 'plan-flow-user-dep', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('296', 'application', 'plan-flow-user-dep', 'update', '0', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('297', 'application', 'flow-event', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('298', 'application', 'flow-event', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('299', 'application', 'flow-event', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('300', 'application', 'flow-event', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('301', 'application', 'flow-event', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('302', 'application', 'flow-event', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('303', 'application', 'flow-event', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('304', 'application', 'flow-event', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('305', 'application', 'flow-event', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('306', 'application', 'flow-event', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('307', 'application', 'flow-event', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('308', 'application', 'flow-event', 'update', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('309', 'application', 'plan-event', 'count', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('310', 'application', 'plan-event', 'count', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('311', 'application', 'plan-event', 'create', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('312', 'application', 'plan-event', 'create', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('313', 'application', 'plan-event', 'delete', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('314', 'application', 'plan-event', 'delete', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('315', 'application', 'plan-event', 'find', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('316', 'application', 'plan-event', 'find', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('317', 'application', 'plan-event', 'findone', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('318', 'application', 'plan-event', 'findone', '1', '', '2', null, null);
INSERT INTO `users-permissions_permission` VALUES ('319', 'application', 'plan-event', 'update', '0', '', '1', null, null);
INSERT INTO `users-permissions_permission` VALUES ('320', 'application', 'plan-event', 'update', '1', '', '2', null, null);

-- ----------------------------
-- Table structure for users-permissions_role
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_role`;
CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_role
-- ----------------------------
INSERT INTO `users-permissions_role` VALUES ('1', 'Authenticated', 'Default role given to authenticated user.', 'authenticated', null, null);
INSERT INTO `users-permissions_role` VALUES ('2', 'Public', 'Default role given to unauthenticated user.', 'public', null, null);

-- ----------------------------
-- Table structure for users-permissions_user
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_user`;
CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_user
-- ----------------------------
DROP TRIGGER IF EXISTS `emergencyevent`;
DELIMITER ;;
CREATE TRIGGER `emergencyevent` BEFORE UPDATE ON `emergencyevent` FOR EACH ROW SET NEW.`start_time` = NOW()
;
;;
DELIMITER ;
