<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
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

</head>
<body>
	<!--header-->
	<%@include file="top-navigation.jsp"%>

	<!--nav-sort-->
	<div class="container">
		<table class="table table-striped table-bordered "
			style="table-layout: fixed">
			<thead>
			<colgroup>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
				<col width='10%'>
			</colgroup>
			</thead>
			<tbody>
				<tr>
					<th class="">性质：</th>
					<th class="">公立医院</th>
					<th class="">私立医院</th>
				</tr>
				<tr>
					<th>区域：</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th>级别:</th>
					<th>特等医院</th>
					<th>三甲医院</th>
					<th>三级医院</th>
					<th>二级医院</th>
					<th>一级医院</th>
					<th>其他</th>
				</tr>

				<tr>
					<th>类型：</th>
					<th>血管瘤专科医院</th>
					<th>中医医院</th>
					<th
						style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">耳鼻咽喉专科医院</th>
					<th>精神心理科医院</th>
					<th>胃肠专科医院</th>
					<th>职业病防治医院</th>
					<th>慢性病防治医院</th>
					<th>更多</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<ul class="list-group">
			<!--for each output-->
			<li class="search_item" id="search_item"><s:action
					name="findHospital" namespace="/"></s:action> <c:forEach
					var="hospital" items="${hospitals }" begin="0" end="9"
					varStatus="status" >
<%-- 					<c:if test="${status.last}"> --%>
<%--                     ${status.count} --%>
<%--                     </c:if> --%>
					<div class="left_img_big col-md-2">
						<a href="http://www.91160.com/unit/show/uid-318.html"> <img
							oncontextmenu="return(false);"
							src="http://images.91160.com/cache/20151125/142x100/upload/2918/unit/3/unit_318.jpg"></a>
					</div>
					<div style="float: left;">
						<h2 style="margin-top: 0px">
							<a href="hospital.jsp?hid=${hospital.id}">${hospital.name}</a><span>[${hospital.level}]
							</span>
						</h2>

						<div class="hospital_info layout">

							<p>地址：${hospital.address}</p>

							<p>电话： ${hospital.telephone}</p>
						</div>
					</div>
					<hr style="width: 100%" />
				</c:forEach></li>
		</ul>
	</div>
	<div class="container">
		<nav>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li id="page2"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	<!-- TODO:pagination -->
	<script type="text/javascript">
	</script>
</body>
</html>