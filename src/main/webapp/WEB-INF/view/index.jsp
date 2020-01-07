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
    <jsp:param name="menuActive" value="personMenu"/>
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
            <h4 class="page-title">个人管理</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

        <!--修改个人信息 start-->
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">个人信息修改</h2>
                    <form class="js-validation-bootstrap form-horizontal" action="#"
                          method="post">
                        <%--昵称--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="nickname">昵称</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="nickname" name="nickname"
                                       placeholder="换个好听的昵称？">
                            </div>
                        </div>
                        <%--性别--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="sex">性别</label>
                            <div class="col-md-9">
                                <select class="form-control" id="sex">
                                    <option value="1" name="sex">男生</option>
                                    <option value="0" name="sex">女生</option>
                                </select>
                            </div>
                        </div>
                        <%--修改头像--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="sex">头像</label>
                            <div class="col-md-9">
                                <input type="file" class="fileupload">
                            </div>
                        </div>
                        <%--提交表单--%>
                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-3">
                                <button class="btn  btn-primary" type="submit">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--修改个人信息 end -->

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
