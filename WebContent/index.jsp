<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title></title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-default " role="navigation" style="margin-bottom: 5px">
    <div class="container" >
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">找医院</a></li>
                <li><a href="#">找科室</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">选择城市 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">广州</a></li>
                        <li><a href="#">佛山</a></li>
                        <li><a href="#">肇庆</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">其他</a></li>
                    </ul>
                </li>
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
<div class="jumbotron" style="padding: 0;background-color:#c7ddef;">
    <div class="container" style="float: left;padding-left: 180px;max-width: 700px">
        <div id="carousel-example-generic" class="carousel slide " data-ride="carousel" style="max-width: 500px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner " role="listbox">
                <div class="item active">
                    <img src="img/1429070197235174.jpg" width="500px" height="300px" alt="...">

                    <div class="carousel-caption">
                        123
                    </div>
                </div>
                <div class="item">
                    <img src="img/20140810202653_ytjLB.png" width="500px" height="300px" alt="...">

                    <div class="carousel-caption">
                        456
                    </div>
                </div>
                <div class="item">
                    <img src="img/20140810211102_8aC8w.png" width="500px" height="300px" alt="...">

                    <div class="carousel-caption">
                        789
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="container" style="background-color:#DBDBDB;width: 500px ;height:280px;float: left;">
        <h1>在线预约</h1>

        <p>...</p>

        <p><a class="btn btn-primary btn-lg" href="#" role="button">马上预约</a></p>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-12">

            <h2>找医院</h2>
            <ol class="breadcrumb">
                <li class="active"><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a class="btn btn-default btn-xs bottom-right" role="link" href="#">更多 &raquo;</a></li>
            </ol>
            <ul class="list-group col-md-4 ">
                <li class="list-group-item"><span class="badge">三甲</span><a href="#">Cras justo odio></a></li>
                <li class="list-group-item"><span class="badge">14</span>Dapibus ac facilisis in</li>
                <li class="list-group-item"><span class="badge">14</span>Morbi leo risus</li>
                <li class="list-group-item"><span class="badge">14</span>Porta ac consectetur ac</li>
                <li class="list-group-item"><span class="badge">14</span>Vestibulum at eros</li>
            </ul>
            <ul class="list-group col-md-4 ">
                <li class="list-group-item"><span class="badge">14</span>Cras justo odio</li>
                <li class="list-group-item"><span class="badge">14</span>Dapibus ac facilisis in</li>
                <li class="list-group-item"><span class="badge">14</span>Morbi leo risus</li>
                <li class="list-group-item"><span class="badge">14</span>Porta ac consectetur ac</li>
                <li class="list-group-item"><span class="badge">14</span>Vestibulum at eros</li>
            </ul>
            <ul class="list-group col-md-4 ">
                <li class="list-group-item"><span class="badge">14</span>Cras justo odio</li>
                <li class="list-group-item"><span class="badge">14</span>Dapibus ac facilisis in</li>
                <li class="list-group-item"><span class="badge">14</span>Morbi leo risus</li>
                <li class="list-group-item"><span class="badge">14</span>Porta ac consectetur ac</li>
                <li class="list-group-item"><span class="badge">14</span>Vestibulum at eros</li>
            </ul>

        </div>
        <ul>
        </ul>
        <div class="col-lg-12">
            <h2>找科室</h2>
            <ol class="breadcrumb">
                <li class="active"><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a href="#">城市A</a></li>
                <li><a class="btn btn-default btn-xs" role="button">更多 &raquo;</a></li>
            </ol>
            <ul class="list-group col-md-4">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Morbi leo risus</li>
                <li class="list-group-item">Porta ac consectetur ac</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>
            <ul class="list-group col-md-4 ">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Morbi leo risus</li>
                <li class="list-group-item">Porta ac consectetur ac</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>
            <ul class="list-group col-md-4 ">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Morbi leo risus</li>
                <li class="list-group-item">Porta ac consectetur ac</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>

        </div>
    </div>
    <hr/>
</div>

<footer>
    <div class="text-center">
        <p>&copy;Company 2014</p>
    </div>
</footer>
<script src="js/__cdn.bootcss.com_jquery_1.11.3_jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>