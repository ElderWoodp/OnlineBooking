<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>在线预约系统</title>
<link href="css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="nav_content">
			<div class="status_login_div">
				<a href="login.jsp" class=""> 登录 </a> <a href="#" class=""> 注册 </a>
			</div>
		</div>
		<div class="wrapper">
			<div class="heading">
				<div class="heading_nav">
					<div class="heading_title">在线预约系统</div>
					<div class="heading_nav_bar">
						<ul>
							<li><a href="#">首页</a></li>
							<li><a href="#">找医院</a></li>
							<li><a href="#">找科室</a></li>
						</ul>
					</div>
					<div class="header_search fr">
						<input type="text" name="search_key" id="search_key"
							value="输入医院名称/医生姓名/科室名称" class="search_input fl"
							placeholder="请输入您想搜索的医院、医生、或疾病名称" autocomplete="off"
							placeholders="请输入您想搜索的医院、医生、或疾病名称"
							style="color: rgb(153, 153, 153);"> <input type="submit"
							value="搜 索" id="btn_search" name="btnSearch"
							class="btn_border fl btn_search">
					</div>
				</div>
			</div>
			<div class="find-hospital w650 fl" style="overflow: visible">
				<div class="lord_hd layout">
					<a href="#" onclick="" style="float: left; height: 30px"> <b
						class="lord_title">找医院</b>
					</a>
					<ul class="lord_tab" id="find-hopt">
						<li><a onclick="" href="">A城市</a></li>
						<li><a onclick="" href="">B城市</a></li>
						<li><a onclick="" href="">C城市</a></li>
					</ul>
					<span class="more_links fs12 fr"><a onclick=""
						target="_blank" href="#">更多</a></span>

				</div>
				<div class="f_h_bd">
					<ul class="hospital_list">
						<li class="layout">
							<dl>医院A
							</dl>
							<dl>医院B
							</dl>
							<dl>医院C
							</dl>
						</li>
						<li class="layout">
							<dl>医院A
							</dl>
							<dl>医院B
							</dl>
							<dl>医院C
							</dl>
						</li>
						<li class="layout">
							<dl>医院A
							</dl>
							<dl>医院B
							</dl>
							<dl>医院C
							</dl>
						</li>
						<li class="layout">
							<dl>医院A
							</dl>
							<dl>医院B
							</dl>
							<dl>医院C
							</dl>
						</li>

					</ul>
				</div>

			</div>
			<div class="find-department w650 fl" style="overflow: visible">
				<div class="lord_hd layout">
					<a href="#" onclick="" style="float: left; height: 30px"> <b
						class="lord_title">找科室</b>
					</a>
					<ul class="lord_tab" id="">
						<li><a onclick="" href="">A城市</a></li>
						<li><a onclick="" href="">B城市</a></li>
						<li><a onclick="" href="">C城市</a></li>
					</ul>
					<span class="more_links fs12 fr"><a onclick=""
						target="_blank" href="#">更多</a></span>

				</div>
				<div class="f_h_bd">
					<ul class="department_list">
						<li class="layout">
							<dl>科室A
							</dl>
							<dl>科室B
							</dl>
							<dl>科室C
							</dl>
						</li>
						<li class="layout">
							<dl>科室A
							</dl>
							<dl>科室B
							</dl>
							<dl>科室C
							</dl>
						</li>
						<li class="layout">
							<dl>科室A
							</dl>
							<dl>科室B
							</dl>
							<dl>科室C
							</dl>
						</li>
						<li class="layout">
							<dl>科室A
							</dl>
							<dl>科室B
							</dl>
							<dl>科室C
							</dl>
						</li>
					</ul>
				</div>

			</div>
		</div>
		<div class="footing" style="color: #000; font-weight: 800">
			@Copyright Reserved</div>
	</div>
</body>
</html>