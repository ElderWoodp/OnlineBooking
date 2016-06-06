<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
			<a class="navbar-brand" href="#">J2EE</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
				<li><a href="search_hospital.jsp" target="_blank">找医院</a></li>
				<li><a href="#">找科室</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">选择城市 <span class="caret"></span></a>
					<ul class="dropdown-menu city">
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

			<!-- user login state logic-->
			<ul class="nav navbar-nav navbar-right nav-login">
				<c:choose>
					<c:when test="${not empty user}">
						<!-- Single dropdown for user setting -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><s:property value="#session.user.email" />
								<span class="caret"></span></a>
							<ul class="dropdown-menu user-setting">
								<li ><a href="userinfo.jsp">个人信息</a></li>
								<li ><a href="#">退出登录</a></li>
							</ul></li>						
					</c:when>
					<c:otherwise>
						<li><a href="login.jsp">登录</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>