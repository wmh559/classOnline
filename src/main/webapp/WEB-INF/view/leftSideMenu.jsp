<%--
  Created by IntelliJ IDEA.
  User: Atom
  Date: 2020/1/6
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<!--Start left side Menu-->
<div class="left-side sticky-left-side">

    <!--logo-->
    <div class="logo">
        <a href="index.jsp"><img src="/resources/images/logo.png" alt=""></a>
    </div>

    <div class="logo-icon text-center">
        <a href="index.jsp"><img src="/resources/images/logo-icon.png" alt=""></a>
    </div>
    <!--logo-->

    <div class="left-side-inner">
        <!--Sidebar nav-->
        <ul class="nav nav-pills nav-stacked custom-nav">
            <li class="menu-list" id="personMenu"><a href="index.jsp"><i class="icon-home"></i> <span>个人</span></a>
                <ul class="sub-menu-list">
                    <li><a href="/manage/toIndex.do">修改个人信息</a></li>
                    <li><a href="/manage/toChangePassword.do">修改密码</a></li>
                </ul>
            </li>

            <li class="menu-list" id="classMenu"><a href="#"><i class="ion-android-people"></i> <span>班级管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="/manage/toCreateClass.do">创建班级</a></li>
                    <li><a href="/manage/toListClass.do">班级列表</a></li>
                </ul>
            </li>

            <li class="menu-list" id="questionMenu"><a href="#"><i class="ion-android-textsms"></i> <span>问题管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="/manage/toCreateQuestion.do">创建问题</a></li>
                    <li><a href="/manage/toListQuestion.do">问题列表</a></li>
                </ul>
            </li>

            <li class="menu-list" id="roleMenu"><a href="#"><i class="ion-android-hand"></i> <span>权限管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="/manage/toListRole.do">修改用户权限</a></li>
                </ul>
            </li>


            <li class="menu-list" id="userMenu"><a href="#"><i class="ion-android-person"></i> <span>用户管理</span></a>
                <ul class="sub-menu-list">
                    <li><a href="/manage/toListUser.do">用户列表</a></li>
                </ul>
            </li>
        </ul>
        <!--End sidebar nav-->

    </div>
</div>
<!--End left side menu-->

<%--隐藏的表单，用来激活当前显示的菜单--%>
<input type="hidden" id="menuActive" value="${param.menuActive}">

<script type="text/javascript">
    /*获取当前激活的表单名称*/
    var menuActive = document.getElementById("menuActive").value;
    /*为相应的菜单添加激活状态*/
    document.getElementById(menuActive).classList.add('nav-active');
</script>
</body>
</html>
