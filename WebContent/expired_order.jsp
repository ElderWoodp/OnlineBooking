<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title></title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery_1.11.3_jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<body>

	<!--expired order-->
	<div class="container " style="margin: 0px; padding-bottom: 5px">
		<div class="page-header" style="margin: 0px;">
			<h3 class="text-left" style="font-weight: 600; font-size: 22px">已过期预约
			</h3>
		</div>
	</div>

	<!-- findOrdersAction -->
	<s:action name="findOrders" namespace="/">
		<s:param name="userId" value="#{user.userid}"></s:param>
	</s:action>
	
	<div class="container-fluid">
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th class="hidden" id="booking_id"></th>
					<th>流水号</th>
					<th>用户名</th>
					<th>医院地址</th>
					<th>科室</th>
					<th>医生名</th>
					<th>预约时间</th>
					<th>是否过期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			   <!-- session also have ${order.hospitalName},here don't show it-->
			   <c:forEach var="order" items="${orders }">
			   <c:if test="${order.isOverdue}">
				<tr>
					<th class="hidden" id="${order.bookingId}"></th>
					<th>${order.number}</th>
					<th>${order.userName}</th>
					<th>${order.hospitalAddress}</th>
					<th>${order.departmentName}</th>
					<th>${order.doctorName}</th>
					<th>${order.visitTime}</th>
					<th>${order.isOverdue}</th>
					<th><a href="deleteOrder?bookingId=${order.bookingId}"><button class="btn btn-warning btn-xs">删除</button></a></th>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
