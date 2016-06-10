<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib uri="/struts-tags"
prefix="s"%>
<%session.setAttribute("user.userid", "#{user.userid}"); %>
<!DOCTYPE html>
<html>
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
<link href="css/userinfo.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- top nav -->
	<jsp:include page="top-navigation.jsp" />

	<!--title-->
	<div class="container ">
		<div class="page-header" style="margin: 0px auto">
			<h2 style="font-weight: bold">个人信息</h2>
		</div>
	</div>
	<!--end title-->

	<!--content-->
	<div class="container">
		<div class="row">
			<!-- left menu-->
			<div class="sidebar-menu col-md-3"
				style="padding-left: 0px; padding-right: 0px">
				<div class="user-info-layout"
					style="height: 100px; background-color: #2aabd2;">
					<div class="user-img fl">
						<img src="img/icon/default_icon.jpg">
					</div>
					<div class="user-name fl">
						<h3>188141XXXXX</h3>
					</div>
				</div>
				<a class="nav-header menu-first collapsed" data-toggle="collapse"><i
					class="glyphicon glyphicon-shopping-cart"></i> 我的预约</a>
				<ul id="orederMenu" class="nav nav-list menu-second "
					style="height: auto;">
					<li id="not-expired-order"><a href="#"><i class=""></i>
							未过期预约</a></li>
					<li id="expired-order"><a href="#"><i class=""></i> 已过期预约</a></li>
				</ul>
				<hr />
				<a class="nav-header menu-first collapsed" data-toggle="collapse"><i
					class="glyphicon glyphicon-user gly"></i> 我的账户</a>
				<ul id="userInfoMenu" class="nav nav-list menu-second "
					style="height: auto;">
					<li id="account-setting"><a href="#"><i class=""></i>
							账户设置</a></li>
					<li id="wallet"><a href="#"><i class=""></i> 我的钱包</a></li>
				</ul>
			</div>
			<!-- end left menu-->

			<!-- right area-->
			<div class="right-area col-md-9"
				style="background-color: whitesmoke;">
				<!-- 16:9 aspect ratio -->
				<div class="embed-responsive embed-responsive-16by9">
					<iframe id="iframe" class="embed-responsive-item"
						src="not_expired_order.jsp"></iframe>
				</div>
			</div>
			<!-- end right area-->
		</div>
	</div>
	<!--end content-->

	<!--account-->
	<script>
    <!-- click listener about right area-->
    $("#not-expired-order").click(function (e) {
        e.preventDefault();
        $("#iframe").attr('src',"not_expired_order.jsp");
    });
    $("#expired-order").click(function (e) {
        e.preventDefault();
        $("#iframe").attr('src',"expired_order.jsp");
    });
    $("#account-setting").click(function (e) {
        e.preventDefault();
        $("#iframe").attr('src',"account.html");
    });
    $("#wallet").click(function (e) {
        e.preventDefault();
        $("#iframe").attr('src',"wallet.jsp");
    });
</script>
</body>
</html>