<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="hospital" items="${hospitals }">
<c:if test="${hospital.id == param.abc}">
	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
			<tr align="center"  height="24px">
				<td width="100">${hospital.id}</td>
				<td width="160">${hospital.name}</td>
				<td width="160">${hospital.describe}</td>
				<td width="160">${hospital.level}</td>
				<td width="160">${hospital.region}</td>
			</tr>
	</table>
</c:if>
</c:forEach>

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
</body>
</html>