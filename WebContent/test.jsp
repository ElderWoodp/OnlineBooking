<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>test</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<%-- <s:action name="findDepartmentByHospital" namespace="/">
		<s:param name="hid" value="1"></s:param>
	<s:action name="findHospitalByRegion" namespace="/">
		<s:param name="region" value="上海市"></s:param>
	</s:action> --%>
	<!-- <form action="findDepartmentByHospital" method="get" >
	<input id="hid" name="hid" type="text">
	<input type="submit">
	</form> -->
<%-- 	</s:action> --%>

	fdfdsfaf
<!-- 	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"> -->
<%-- 		<c:forEach var="hospital" items="${hospitals }"> --%>
<!-- 			<tr align="center" height="24px"> -->
<%-- 				<td width="100">${hospital.id}</td> --%>
<%-- 				<td width="160"><a href="test2.jsp?abc=${hospital.id}">${hospital.name}</a></td> --%>
<%-- 				<td width="100">${hospital.region}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table>  -->
<!-- 	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"> -->
<%-- 		<c:forEach var="department" items="${departments }"> --%>
<!-- 			<tr align="center" height="24px"> -->
<%-- 				<td width="100">${department.id}</td> --%>
<%-- 				<td width="100">${department.name}</td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table>  -->
	
	<form action="findDoctor" method="get" >
	<input id="hid" name="hid" type="text">
	<input id="depId" name="depId" type="text">
	<input type="submit">
	</form>
	<%-- <s:action name="findDoctor" namespace="/">
		<s:param name="hid" value="1"></s:param>
		<s:param name="depId" value="4"></s:param>
	</s:action> --%>
	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
		<c:forEach var="doctor" items="${doctors }">
			<tr align="center" height="24px">
				<td width="100">${doctor.id}</td>
				<td width="100">${doctor.name}</td>
				<td width="100">${doctor.describe}</td>
				<td width="100">${doctor.hid}</td>
				<td width="100">${doctor.depId}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>