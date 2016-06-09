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
	<!--  
	<form action="confirmOrder" method="get">
		<input id="userId" name="userId" type="text"> 
		<input id="docId" name="docId" type="text"> 
		<input id="visitTime" name="visitTime" type="text"> 
		<input type="submit">
	</form>
	-->
	
	<!-- test findOrdersAction -->
	<form action="findOrders" method="get">
		<input id="userId" name="userId" type="text">
		<input type="submit">
	</form>
	<c:forEach var="order" items="${orders }">
		<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
			<tr align="center"  height="24px">
				<td width="100">${order.bookingId}</td>
				<td width="100">${order.visitTime}</td>
				<td width="100">${order.isOverdue}</td>
				<td width="100">${order.number}</td>
				<td width="100">${order.userName}</td>
				<td width="100">${order.doctorName}</td>
				<td width="100">${order.fee}</td>
				<td width="100">${order.hospitalName}</td>
				<td width="100">${order.hospitalAddress}</td>
				<td width="100">${order.departmentName}</td>
			</tr>
		</table>
	</c:forEach>
	
</body>
</html>