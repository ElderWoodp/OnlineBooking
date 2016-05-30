<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1><s:property value="#session.user.email"/></h1>
<h2>登陆成功，3秒后自动返回主页</h2>
<p><a href="index.jsp">点击立即返回主页</a></p>
<% response.setHeader("refresh", "3;URL=index.jsp");%>
</body>
</html>