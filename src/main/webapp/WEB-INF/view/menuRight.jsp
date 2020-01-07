<%--
  Created by IntelliJ IDEA.
  User: Atom
  Date: 2020/1/7
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<!--个人信息栏 start -->
<div class="menu-right">
    <ul class="notification-menu">
        <li>
            <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="/resources/images/users/avatar-6.jpg" alt=""/>
                ${sessionScope.user.nickname}
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"> <i class="fa fa-wrench"></i> Settings </a></li>
                <li><a href="#"> <i class="fa fa-user"></i> Profile </a></li>
                <li><a href="#"> <i class="fa fa-info"></i> Help </a></li>
                <li><a href="/manage/logout.do"> <i class="fa fa-lock"></i> Logout </a></li>
            </ul>
        </li>
    </ul>
</div>
<!--个人信息栏 end -->
</body>
</html>
