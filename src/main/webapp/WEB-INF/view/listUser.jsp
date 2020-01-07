<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/favicon.png" type="image/png">
    <title>Home</title>

    <!--Begin  Page Level  CSS -->
    <link href="/resources/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"/>
    <!--End  Page Level  CSS -->
    <link href="/resources/css/icons.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="sticky-header">

<jsp:include page="leftSideMenu.jsp">
    <jsp:param name="menuActive" value="userMenu"/>
</jsp:include>


<!-- main content start-->
<div class="main-content">

    <!-- header section start-->
    <div class="header-section">
        <!-- 导航栏折叠开关 -->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>

        <!--个人信息栏 start -->
        <jsp:include page="menuRight.jsp"/>
        <!--个人信息栏 end -->


    </div>
    <!-- header section end-->


    <!--body wrapper start-->
    <div class="wrapper">

        <!--Start Page Title-->
        <div class="page-title-box">
            <h4 class="page-title">用户管理</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->


        <!--用户列表-->
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">用户列表</h2>
                    <div class="table-wrap">
                        <table class="table table table-hover m-0">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>用户名称</th>
                                <th>用户密码</th>
                                <th>用户昵称</th>
                                <th>性别</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>wmhwmh</td>
                                <td>123</td>
                                <td>Mark</td>
                                <td>男</td>
                                <td><a href="#">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>asdasd</td>
                                <td>456</td>
                                <td>Karis</td>
                                <td>女</td>
                                <td><a href="#">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>zxczxc</td>
                                <td>789</td>
                                <td>Sara</td>
                                <td>女</td>
                                <td><a href="#">修改</a>/<a href="#">删除</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--用户列表 end -->

    </div>
    <!-- End Wrapper-->


</div>
<!--End main content -->


<!--Begin core plugin -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/plugins/moment/moment.js"></script>
<script src="/resources/js/jquery.slimscroll.js "></script>
<script src="/resources/js/jquery.nicescroll.js"></script>
<script src="/resources/js/functions.js"></script>
<!-- End core plugin -->

<!--Begin Page Level Plugin-->
<script src="/resources/plugins/morris-chart/raphael-min.js"></script>
<script src="/resources/plugins/jquery-sparkline/jquery.charts-sparkline.js"></script>
<!--End Page Level Plugin-->


</body>

</html>
