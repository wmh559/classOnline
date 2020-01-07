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

        <!--修改密码 start-->
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h2 class="header-title">个人信息修改</h2>
                    <form class="js-validation-bootstrap form-horizontal" action="" accept-charset="UTF-8"
                          method="post" id="changeForm">
                        <%--旧密码--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="oldPassword">原始密码<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <input class="form-control" type="password" id="oldPassword"
                                       placeholder="输入你的旧密码">
                            </div>
                        </div>
                        <%--新密码--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="newPassword">新密码<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <input class="form-control" type="password" id="newPassword" name="newPassword"
                                       placeholder="输入你的新密码">
                            </div>
                        </div>
                        <%--确认密码--%>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="confirmPassword">确认密码<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-9">
                                <input class="form-control" type="password" id="confirmPassword"
                                       placeholder="再输入一遍">
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
        <!--修改密码 end -->

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
<script src="/resources/plugins/sweetalert/sweet-alert.js"></script>
<script src="/resources/pages/jquery.sweet-alert.custom.js"></script>
<!--End Page Level Plugin-->

<script type="text/javascript">
    $(function () {
        !function ($) {
            "use strict";

            var SweetAlert = function () {
            };

            //examples
            SweetAlert.prototype.init = function () {

                // 检查两个新密码是否一致
                $('#newPassword').blur(function () {
                    var newPassword = $('#newPassword').val().trim();
                    var confirmPassword = $('#confirmPassword').val().trim();
                    if (newPassword != confirmPassword) {
                        colorChange($('#newPassword'), 'error');
                        colorChange($('#confirmPassword'), 'error');
                        return;
                    } else {
                        colorChange($('#newPassword'), 'success');
                        colorChange($('#confirmPassword'), 'success');
                    }
                });
                $('#confirmPassword').blur(function () {
                    var newPassword = $('#newPassword').val().trim();
                    var confirmPassword = $('#confirmPassword').val().trim();
                    if (newPassword != confirmPassword) {
                        colorChange($('#newPassword'), 'error');
                        colorChange($('#confirmPassword'), 'error');
                        return;
                    } else {
                        colorChange($('#newPassword'), 'success');
                        colorChange($('#confirmPassword'), 'success');
                    }
                });
                /**
                 * 检验密码一致
                 */
                $('#submit_btn').click(function () {
                    var oldPassword = $('#oldPassword').val().trim();
                    var newPassword = $('#newPassword').val().trim();
                    var confirmPassword = $('#confirmPassword').val().trim();
                    if (newPassword != confirmPassword) {
                        swal("新密码不一致");
                        return;
                    }

                    $.ajax({
                        type:"POST",
                        url:"/manage/reply/validatePassword.do",
                        data:{"oldPassword":oldPassword},
                        success:function (data) {
                            console.log(data);
                            if (data.status) {
                                colorChange($('#oldPassword'), 'success');

                                $.ajax({
                                    type:"POST",
                                    url:"/manage/changeInformation.do",
                                    data:JSON.stringify({"password":newPassword}),
                                    dataType:"json",
                                    contentType:"application/json",
                                    success:function (data) {
                                        if (data.successed) {
                                            swal({
                                                title: "搞定了!",
                                                text: "修改成功",
                                                type: "success",
                                                showCancelButton: false,
                                                confirmButtonColor: "#DD6B55",
                                                confirmButtonText: "OK",
                                                closeOnConfirm: false
                                            }, function(){
                                                window.location = "/manage/toChangePassword.do";
                                                return;
                                            });
                                        }
                                        if (data.status == 1) {
                                            swal("修改失败");
                                        }
                                    }
                                })

                            } else {
                                colorChange($('#oldPassword'),'error');
                                return;
                            }
                        }
                    })

                });


                function colorChange(node,color) {
                    if (color == 'success') {
                        node[0].parentNode.parentNode.classList.remove('has-error');
                        node[0].parentNode.parentNode.classList.add('has-success');
                    } else {
                        node[0].parentNode.parentNode.classList.remove('has-success')
                        node[0].parentNode.parentNode.classList.add('has-error');
                    }

                }


            },
                //init
                $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
        }(window.jQuery),

            //initializing
            function ($) {
                "use strict";
                $.SweetAlert.init()
            }(window.jQuery);

    })



</script>

</body>

</html>
