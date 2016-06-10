<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
</head>
<body>

    <!-- findAccountAction -->
	<s:action name="findAccount" namespace="/">
		<s:param name="userId" value="#session.user.userid"></s:param>
	</s:action>

	<!--title-->
	<div class="container " style="margin: 0px; padding-bottom: 5px;">
		<div class="page-header" style="margin: 0px auto">
			<h2 style="font-weight: 600; font-size: 22px;">
				你的余额是： <small class="text-primary" style="font-size: 20px">${account}</small>
				元
			</h2>
			<button class="btn btn-warning ">充值</button>
			<button class="btn btn-success ">提现</button>
		</div>
	</div>
</body>
</html>