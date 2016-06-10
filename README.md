# Introduction
OnlineBooking是基于Struts2 + Hibernate + Spring的在线预约系统

# PreView
主页
<img src="/art/index.PNG" alt="index.PNG"/>
医院
<img src="/art/hospital.PNG" alt="hospital.PNG"/>
科室
<img src="/art/department.PNG" alt="department.PNG"/>
确认订单
<img src="/art/confirm_order.PNG" alt="confirm_order.PNG"/>
用户信息
<img src="/art/userinfo.PNG" alt="userinfo.PNG"/>
更多截图在``art文件夹``
# Dev Tools and Technologies
- IDE: Eclipse MAR2.0 + MySQL Workbench
- Framework:Struts2.1 + Hibernate3.0 + Spring3.0 + JQuery1.11.3 + Bootstrap3.0 + Ajax
- Database:MySQL5.7
- Web Server:Apache Tomcat8.0
- Eclipse plugins:JBOSS(for Hibernate reverse tools)+XulRunner(for preview jsp files)

# How to Start
### 1.直接下载该仓库全部文件或者使用git clone
```
git clone https://github.com/wdpm/OnlineBooking
```

### 2.导入项目到eclipse IDE.
```
File->Import->Existing Projects into Workspace->set root diretory->browser->...
```

### 3.在MySQL新建onlinebooking数据库
导入onlinebooking_final.sql执行,确保数据准备成功

### 4.配置Apache Tomcat服务器
建议使用Tomcat8.0+版本

### 5.配置SMTP邮箱服务器
在src/com.util.SendEmail.java文件中配置发送邮件服务，推荐使用163或者126邮箱
``` java
    public static final String HOST = "smtp.XXXX.com";
    ...
    public static final String FROM = "";//your email
    public static final String PWD = "";//your email password
```
同时，在上述你所填的邮箱中，请自行到设置中开启SMTP。
如果不进行这一步，那么无法进行用户注册激活，只能使用数据库已存在的测试帐号登陆这个在线预约系统，测试账号如下：
> 帐号名:1234@qq.com
  密码：111111
  
### 6.部署运行
请务必保证联网环境,否则项目无法启动。
正常预约流程：``主页``->``用户登陆``->``找医院``->``选择某医院``->``在某医院中选择某科室``->``在科室列表点击某医生预约按钮``->``选择预约时间段``->``付费成功``->``跳转到个人信息界面``：

>- 未过期预约：可以退订
- 已过期预约：可以删除
- 我的信息：可以完善或者修改个人信息
- 我的钱包：查看余额

  
# TODO
- [功能]用户退出登录
- [功能]找科室
- [功能]搜索查找医院、科室
- [功能]用户信息修改
- [完善]将主页->找医院->找科室关于Action部分的前端逻辑重写,使用findHospitalById和 findDepartmentById减少数据请求量

# Issue
- #1[隐患]hospistal数据库表使用了describe保留字段，写操作会报错(虽然暂时没有写操作)
- #2[缺陷]医生如果在当天有排班，即使预约时间已过期，仍然可以进行预约
- #3断网情况下该项目无法部署运行，原因是：applicationContext.xml中spring版本http://www.springframework.org/schema/beans/spring-beans-3.0.xsd 与jar包版本spring2.+不对应，必须联网更新schema
