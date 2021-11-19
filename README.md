# 应急预案自动执行钉钉小程序

#### 介绍
快速启动预案，根据预设任务、实际火情信息，自动发送到相关责任部门、其主管或成员，保证扑救工作迅速、有序展开
本文首先介绍了相关背景，分析了功能需求、性能需求给出了基于钉钉小程序的设计方案、数据库设计、界面设计方案、系统设计方案， 重点介绍了功能实现，最后给出了测试结果。基于钉钉小程序系统主要实现 。 

#### 软件架构
软件架构说明
1.前端采用钉钉小程序，运用钉钉官方提供的小程序语法实现小程序前端
2.后端采用strapi框架，快速搭建RESTful风格的接口
3.数据库采用mysql来实现

### 界面展示
小程序首页
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232624_4e96cb06_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232658_f9694979_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232713_0266461d_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232724_7260308e_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232733_1123423a_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232742_89f24a0e_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232757_bc6038c8_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232809_d01a81f4_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232818_59d2245c_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232828_d2f8a577_5477733.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1119/232604_8ed078ff_5477733.png "屏幕截图.png")

#### 安装教程
安装环境：

1. python3.7.9
2. npm 6.14.8（node中带有该模块）
3. node v14.15.1
4. 申请钉钉小程序管理员，申请创建钉钉小程序
5.安装小程序开发者工具：官网下载路径：https://developers.dingtalk.com/document/resourcedownload/miniapp-tool?pnamespace=app
6.mysql 5.7
7.安装strapi框架：

```
npm install strapi@alpha -g
```
或 安装最新版 3.3.1

```
npm install strapi -g
```
安装完成后检查版本

```
strapi -v

```
输出
3.1.0-alpha.5安装成功
 


 

#### 使用说明

1.  导入epdb.sql
2.  启动数据库
3.  启动后端strapiNew项目，cd到strapiNew目录下npm run develop
4.  在http://localhost:1337/admin下就能访问
5.  在钉钉小程序开发后台中配置好小程序，和服务器访问白名单
6.  打开钉钉小程序前端项目front项目 

 

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
