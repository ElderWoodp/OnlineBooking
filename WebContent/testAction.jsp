<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- test confirmOrderAction -->
	<form action="confirmOrder" method="get">
		<input id="userId" name="userId" type="text"> 
		<input id="docId" name="docId" type="text"> 
		<input id="visitTime" name="visitTime" type="text"> 
		<input type="submit">
	</form>
</body>
</html>