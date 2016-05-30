<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

	<%@include file="top-navigation.jsp"%>

	<c:forEach var="hospital" items="${hospitals }">
		<c:if test="${hospital.id == param.hid}">

			<!--hospital title-->
			<div class="container ">
				<div class="page-header">
					<h1>
						${hospital.name}<small>${hospital.level}</small>
					</h1>
				</div>
			</div>		

			<!--hospital details-->
			<div class="container">
				<ul class="list-group-item">
					<!--for each output-->
					<li class="container">
						<div class="left_img_big col-md-7"
							style="width: 250px; height: 230px">
							<a href="http://www.91160.com/unit/show/uid-318.html"> <img
								src="http://www.91160.com/static/v4/style/global/hospital_default.jpg"></a>
						</div>
						<div style="float: left; margin-left: 40px">
							<div class="h_info layout" style="width: 700px">
								<p>地址：${hospital.address}</p>

								<p>电话：${hospital.telephone}</p>

								<p>简介：${hospital.describe}</p>

								<p>服务：网上支付</p>

							</div>
						</div>
					</li>
				</ul>
			</div>
		</c:if>
	</c:forEach>

	<!--department details-->
	<div class="container">
		<h2>门诊科室</h2>
		<hr />
		<div class="panel panel-default">
			<div class="panel-body">预约规则</div>
			<div class="panel-footer">
				1、预约挂号放号时间：每天晚上9时开始放号。<br> 2、预约需提供就诊人本人身份证号、诊疗卡卡号，及有效手机号码。<br>
				3、就诊当天，请按预约时间段提前15分钟取号，凭预约流水号到医院挂号窗口或自助机报到取号，过时系统将不再保留预约号。<br>
				4、现场预约已交费取号者，就诊当天按预约时间段提前15分钟直接到诊区候诊。<br>
				5、医生因故停诊，医院会提前电话通知，请预约者提供准确的联系电话。已交费者可在当天或下次就诊时退挂号费。<br>
				6、预约因故取消时请提前1天16时前通知。<br>
				7、医生门诊资源有限，如预约成功后因故确定不能按时就诊，请务必于就诊日前一天20：00前及时取消预约，否则按违约处理，累计三次，您将无法进行预约。<br>
				8、预约挂号时段已改为30分钟为一时段，请您在......
			</div>
		</div>
		<hr />
	</div>

	<!--nav-sort-->
	<div class="container">
		<s:action name="findDepartmentByHospital" namespace="/">
			<s:param name="hid" value="#{param.hid}"></s:param>
		</s:action>
		<table>
			<c:forEach var="department" items="${departments }">
				<ul class="list-group col-md-3 ">
					<!-- TODO:add href -->
					<li class="list-group-item"><a href="department.jsp?hid=${param.hid}&depId=${department.id}">
					${department.name}</a></li>
				</ul>
			</c:forEach>
		</table>
	</div>
</body>
</html>