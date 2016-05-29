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

	<nav class="navbar navbar-default " role="navigation"
		style="margin-bottom: 5px">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">找医院</a></li>
					<li><a href="#">找科室</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">选择城市 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">广州</a></li>
							<li><a href="#">佛山</a></li>
							<li><a href="#">肇庆</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">其他</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left " role="search">
					<div class="form-group ">
						<input type="text" class="form-control " placeholder="搜索医院/科室">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">登录</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<c:forEach var="hospital" items="${hospitals }">
		<c:if test="${hospital.id == param.id}">

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
								oncontextmenu="return(false);"
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
		</c:if>
	</c:forEach>
	</li>
	</ul>
	</div>

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
		<ul class="list-group col-md-12 ">
			<li class="list-group-item"><a href="#">Cras justo odio</a></li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
			<li class="list-group-item">Cras justo odio</li>
		</ul>
	</div>
</body>
</html>