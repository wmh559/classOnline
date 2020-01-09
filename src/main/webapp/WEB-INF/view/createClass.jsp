<%--
  Created by IntelliJ IDEA.
  User: wmh
  Date: 2020/1/7
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
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
    <jsp:param name="menuActive" value="classMenu"/>
</jsp:include>
<!--Begin core plugin -->


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
            <h4 class="page-title">班级管理</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

<%--创建班级--%>

<div class="row">
    <div class="col-md-12">
        <div class="white-box">
            <h2 class="header-title">班级创建</h2>
            <form class="js-validation-bootstrap form-horizontal" action="#"
                  method="post">
                <%--创建人id--%>
                <input type="hidden" id="createUid" value="${sessionScope.user.id}" />
                <%--班级名称--%>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="classname">班级名称<span
                            class="text-danger">*</span></label>
                    <div class="col-md-9">
                        <input class="form-control" type="text" id="classname" name="name"
                               placeholder="请输入班级名称" required>
                    </div>
                </div>
                <%--上传班级头像--%>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="picture">班徽<span
                            class="text-danger">*</span></label>
                    <div class="col-md-9">
                        <input type="file" class="fileupload" name="picture" id="picture">
                    </div>
                </div>
                <%--提交表单--%>
                <div class="form-group">
                    <div class="col-md-8 col-md-offset-3">
                        <button class="btn  btn-primary" type="button" id="submit_btn">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
        <%--创建班级--%>
    </div>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/plugins/moment/moment.js"></script>
<script src="/resources/js/jquery.slimscroll.js "></script>
<script src="/resources/js/jquery.nicescroll.js"></script>
<script src="/resources/js/functions.js"></script>
<!-- End core plugin -->

<!--Begin Page Level Plugin-->
<script src="/resources/plugins/sweetalert/sweet-alert.js"></script>
<script src="/resources/pages/jquery.sweet-alert.custom.js"></script>
<!--End Page Level Plugin-->

<!--Begin page level js-->
<script type="text/javascript">

    !function ($) {
        "use strict";

        var SweetAlert = function () {
        };

        //examples
        SweetAlert.prototype.init = function () {


            /*登陆前检验数据*/
            $('#submit_btn').click(function () {
                var classname = $('#classname').val().trim();
                var createUid = $('#createUid').val().trim();
                $.ajax({
                    type:"POST",
                    url:"/manage/createClass.do",
                    data:JSON.stringify({"createUid":createUid,"name":classname}),
                    dataType:"json",
                    contentType:"application/json",
                    success:function (data) {
                        if (data.successed) {
                            swal({
                                title: "搞定了!",
                                text: "创建成功",
                                type: "success",
                                showCancelButton: false,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "OK",
                                closeOnConfirm: false
                            }, function(){
                                window.location="/manage/toCreateClass.do";
                                return;
                            });

                            return;
                        }else {
                            swal("创建失败");
                            return;
                        }
                    }
                })
            })


        },
            //init
            $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
    }(window.jQuery),

        //initializing
        function ($) {
            "use strict";
            $.SweetAlert.init()
        }(window.jQuery);


</script>
<!--end page level js-->
</body>

</html>

