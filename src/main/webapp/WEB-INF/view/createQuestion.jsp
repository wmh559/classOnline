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
    <jsp:param name="menuActive" value="questionMenu"/>
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
            <h4 class="page-title">问题管理</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

        <!--创建问题 start-->
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">创建问题</h2>
                    <form class="js-validation-bootstrap form-horizontal" action="#"
                          method="post">
                        <%--发起人id--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="uid">发起人id<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="uid" name="uid" value="${sessionScope.user.id}" readonly>
                            </div>
                        </div>
                        <%--问题标题--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="title">标题<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="title" name="title"
                                       placeholder="简要的写个问题？">
                            </div>
                        </div>
                        <%--问题描述--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="description">问题描述<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <textarea id="description" name="description" class="form-control" placeholder="再详细的描述一下问题？"></textarea>
                            </div>
                        </div>
                        <%--提交表单--%>
                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-3">
                                <button class="btn  btn-primary" type="button" id="submit_btn">创建</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--创建问题 end -->

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
                var uid = $('#uid').val().trim();
                var title = $('#title').val().trim();
                var description = $('#description').val().trim();
                $.ajax({
                    type:"POST",
                    url:"/manage/createQuestion.do",
                    data:JSON.stringify({"uid":uid,"title":title,"description":description}),
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
                                window.location="/manage/toCreateQuestion.do";
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
