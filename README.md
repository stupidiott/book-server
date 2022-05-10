# edu-book
## 介绍
用于管理图书信息的一个系统，主要涉及的模块：登录、退出、图书管理、借阅图书、借阅图书列表、还书、系统账号管理。

## 软件架构
#### 前端技术
Vue Webpack Axios Element-UI Vuex
#### 后端技术
Springboot MybatisPlus PageHelper Hutool Redis Mysql
## 其他需求
1. 需要把chrome设置为disable-web-security才能正常使用ISBN功能，[教程](https://blog.51cto.com/u_11990719/3107769
)
2. 使用支付功能前需要运行`.\res\pk_java_demo`中的服务器来生成支付页面
3. 配置payking时需要使用`.\res\ngrok`来配置公网地址作为回调地址

