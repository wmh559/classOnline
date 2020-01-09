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
            <h4 class="page-title">课堂</h4>
            <div class="clearfix"></div>
        </div>
        <!--End Page Title-->

        <div class="row">

            <!-- Start inbox widget-->
            <div class="col-md-4">
                <div class="white-box">
                    <h2 class="header-title">在线列表</h2>
                    <div class="inbox-widget inbox-scroll-list">

                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-1.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-2.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>


                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-3.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>


                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-4.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>


                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-5.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>


                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <div class="inbox-inner">
                            <a href="#">
                                <div class="inbox-item">
                                    <div class="inbox-img">
                                        <img src="/resources/images/users/avatar-3.jpg" alt=""/>
                                    </div>

                                    <div class="inbox-item-info">
                                        <p class="author">John Doe</p>
                                        <p class="inbox-message">Lorem Ipsum which looks....</p>
                                        <p class="inbox-date">13:34 PM</p>
                                    </div>
                                </div>
                            </a>
                        </div>


                    </div>
                </div>
            </div>
            <!-- End inbox widget-->

            <!--Start chat widget-->
            <div class="col-md-8">
                <div class="white-box">
                    <h2 class="header-title">聊天窗口</h2>
                    <input type="hidden" id="user_id" value="${sessionScope.user.id}">
                    <input type="hidden" id="user_nickname" value="${sessionScope.user.nickname}">
                    <input type="hidden" id="user_classId" value="${sessionScope.user.classId}">
                    <div class="chat-widget">
                        <ul class="chat-scroll-list" id="chat_content">
                            <li class="left">
                                <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                                <div class="chat-info">
                                    <a class="name" href="#">Jone Doe</a>
                                    <span class="datetime">6:12</span>
                                    <span class="message">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit
                                    </span>
                                </div>
                            </li>

                            <li class="right">
                                <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                                <div class="chat-info">
                                    <a class="name" href="#">Jone Doe</a>
                                    <span class="datetime">6:12</span>
                                    <span class="message">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit
                                        </span>
                                </div>
                            </li>

                            <li class="left">
                                <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                                <div class="chat-info">
                                    <a class="name" href="#">Jone Doe</a>
                                    <span class="datetime">6:12</span>
                                    <span class="message">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit
                                        </span>
                                </div>
                            </li>

                            <li class="right">
                                <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                                <div class="chat-info">
                                    <a class="name" href="#">Jone Doe</a>
                                    <span class="datetime">6:12</span>
                                    <span class="message">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit
                                        </span>
                                </div>
                            </li>

                        </ul>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="input-group">
                                <input class="form-control" placeholder="Say something" type="text" id="input_content">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button" id="btn_send">发送</button>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--End chat widget-->

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
    <!--websocket start-->
    <script src="/resources/js/sockjs.min.js"></script>
    <script src="/resources/js/stomp.min.js"></script>

    <script src="/resources/js/chat.js"></script>
    <!--websocket end-->

</body>

</html>


