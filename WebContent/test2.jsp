<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<!-- test getOrderState -->
	<%-- 
	<form action="getOrderState" method="get">
		<input id="docId" name="docId" type="text">
		<input id="dayPart" name="dayPart" type="text">
		<input id="dayOfWeek" name="dayOfWeek" type="text">
		<input type="submit">
	</form>
	<c:forEach var="map" items="${maps }">
		<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
			<tr align="center"  height="24px">
				<td width="100">${map.key}</td>
				<td width="160">${map.value}</td>
			</tr>
		</table>
	</c:forEach> 
	--%>
	<%-- 
	<s:action name="findDoctor" namespace="/">
		<s:param name="hid" value="1"></s:param>
		<s:param name="depId" value="4"></s:param>
	</s:action> 
	--%>

	<!-- test findHospitalById -->
	<%-- 
	<form action="findHospitalById">
		<input name="id" type="text">
		<input type="submit">
	</form>
	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
		<tr align="center"  height="24px">
			<td width="100">${hospital.id}</td>
			<td width="160">${hospital.name}</td>
			<td width="160">${hospital.region}</td>
			<td width="160">${hospital.name}</td>
			<td width="160">${hospital.level}</td>
			<td width="160">${hospital.telephone}</td>
		</tr>
	</table> 
	--%>

	<!-- test findDepartmentById -->
	<form action="findDepartmentById">
		<input name="id" type="text"> <input type="submit">
	</form>
	<table align="center" border="1" cellpadding="0" cellspacing="0"
		bordercolor="#3366cc">
		<tr align="center" height="24px">
			<td width="100">${department.id}</td>
			<td width="160">${department.name}</td>
		</tr>
	</table>

</body>
</html>