<%--
  Created by IntelliJ IDEA.
  User: wmh
  Date: 2020/1/7
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/images/favicon.png" type="image/png">
    <%--修改页面css样式--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <%--修改页面css样式--%>
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
    <script src="/resources/js/html5shiv.min.js"></script>
    <script src="/resources/js/respond.min.js"></script>
    <![endif]-->

    <style>
        .card-profile3:hover {
            transform: scale(1.05, 1.05);
            cursor: pointer;
        }
    </style>

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
            <h4 class="page-title">班级列表</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

        <%--班级列表--%>
        <input type="hidden" id="classid" value="">
        <div class="row">
            <div class="col-md-12">
                <c:if test="${classroomList!=null}">
                    <c:forEach var="c" items="${classroomList}">
                        <div class="col-md-4">
                            <div class="card-profile3" classid="${c.id}">
                                <div class="p-header">
<%--                                    <img src="/resources/images/profile-picture3.png" alt="">--%>
                                    <small style="color: whitesmoke">课程编号</small>
                                    <h1>${c.id}</h1>
                                </div>
                                <div class="p-info">
                                    <div class="row">
                                        <div class="col-md-6 co-sm-6 col-xs-6">
                                            <div class="p-stats">
                                                <small>课程</small>
                                                <p>${c.name}</p>
                                            </div>
                                        </div>

                                        <div class="col-md-6 co-sm-6 col-xs-6">
                                            <div class="p-stats last">
                                                <small>教师</small>
                                                <p>${c.user.nickname}</p>
                                            </div>
                                        </div>
                                    </div>

                                </div> <!--/.p-info-->

                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <%--班级列表--%>

    </div>
</div>


<%--修改班级信息--%>
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

<script type="text/javascript">
    $(function () {
        !function ($) {
            "use strict";

            var SweetAlert = function () {
            };

            //examples
            SweetAlert.prototype.init = function () {

                $('.card-profile3').click(function () {
                    var classid = $(this).attr('classid');
                    console.log(classid)
                    swal({
                        title: "确定要加入班级？",
                        text: "加入班级后无法退出，请谨慎选择!",
                        type: "warning",
                        showCancelButton: true,
                        cancelButtonText:"取消",
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "我要加入",
                        closeOnConfirm: false
                    }, function () {
                        $.ajax({
                            type:"POST",
                            data:{"classid":classid},
                            url: "/manage/validateClass/" + classid + ".do",
                            success:function (data) {
                                if (data.successed) {
                                    swal({
                                        title:"加入成功!",
                                        text:"恭喜你入了贼船.",
                                        type:"success",
                                    },function () {
                                        window.location = "/chat/" + classid + ".do";
                                    });
                                }else if (data.status == 3) {  //不存在该班级
                                    swal("加入失败","不存在该班级","error");
                                } else if (data.status == 5){
                                    swal("加入失败","加入班级异常","error");
                                }

                            },
                            error:function () {
                                swal("加入失败","服务器出现异常","error");
                            }
                        })
                    });
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

    });


</script>


</body>
</html>


