<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<s:action name="findHospital" namespace="/"></s:action>
	<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
		<c:forEach var="hospital" items="${hospitals }">
			<tr align="center"  height="24px">
				<td width="100">${hospital.id}</td>
				<td width="160">${hospital.name}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>