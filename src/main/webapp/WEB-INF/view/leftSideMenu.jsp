<%--
  Created by IntelliJ IDEA.
  User: Atom
  Date: 2020/1/6
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <c:if test="${sessionScope.user.menuList != null}">
                <c:forEach var="m0" items="${sessionScope.user.menuList}">
                    <c:if test="${m0.id == 1}">
                        <li class="menu-list" id="personMenu"><a href="index.jsp"><i class="${m0.iconUrl}"></i> <span>${m0.title}</span></a>
                            <ul class="sub-menu-list">
                                <c:forEach var="m1" items="${sessionScope.user.menuList}">
                                    <c:if test="${m1.parentId == 1}">
                                        <li><a href="${m1.url}">${m1.title}</a></li>
                                    </c:if>
                                </c:forEach>

<%--                                <li><a href="/manage/toChangePassword.do">修改密码</a></li>--%>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.user.menuList != null}">
                <c:forEach var="m0" items="${sessionScope.user.menuList}">
                    <c:if test="${m0.id == 2}">
                        <li class="menu-list" id="classMenu"><a href="index.jsp"><i class="${m0.iconUrl}"></i> <span>${m0.title}</span></a>
                            <ul class="sub-menu-list">
                                <c:forEach var="m1" items="${sessionScope.user.menuList}">
                                    <c:if test="${m1.parentId == 2}">
                                        <li><a href="${m1.url}">${m1.title}</a></li>
                                    </c:if>
                                </c:forEach>

                                    <%--                                <li><a href="/manage/toChangePassword.do">修改密码</a></li>--%>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.user.menuList != null}">
                <c:forEach var="m0" items="${sessionScope.user.menuList}">
                    <c:if test="${m0.id == 3}">
                        <li class="menu-list" id="questionMenu"><a href="index.jsp"><i class="${m0.iconUrl}"></i> <span>${m0.title}</span></a>
                            <ul class="sub-menu-list">
                                <c:forEach var="m1" items="${sessionScope.user.menuList}">
                                    <c:if test="${m1.parentId == 3}">
                                        <li><a href="${m1.url}">${m1.title}</a></li>
                                    </c:if>
                                </c:forEach>

                                    <%--                                <li><a href="/manage/toChangePassword.do">修改密码</a></li>--%>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.user.menuList != null}">
                <c:forEach var="m0" items="${sessionScope.user.menuList}">
                    <c:if test="${m0.id == 4}">
                        <li class="menu-list" id="roleMenu"><a href="index.jsp"><i class="${m0.iconUrl}"></i> <span>${m0.title}</span></a>
                            <ul class="sub-menu-list">
                                <c:forEach var="m1" items="${sessionScope.user.menuList}">
                                    <c:if test="${m1.parentId == 4}">
                                        <li><a href="${m1.url}">${m1.title}</a></li>
                                    </c:if>
                                </c:forEach>

                                    <%--                                <li><a href="/manage/toChangePassword.do">修改密码</a></li>--%>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.user.menuList != null}">
                <c:forEach var="m0" items="${sessionScope.user.menuList}">
                    <c:if test="${m0.id == 5}">
                        <li class="menu-list" id="userMenu"><a href="index.jsp"><i class="${m0.iconUrl}"></i> <span>${m0.title}</span></a>
                            <ul class="sub-menu-list">
                                <c:forEach var="m1" items="${sessionScope.user.menuList}">
                                    <c:if test="${m1.parentId == 5}">
                                        <li><a href="${m1.url}">${m1.title}</a></li>
                                    </c:if>
                                </c:forEach>

                                    <%--                                <li><a href="/manage/toChangePassword.do">修改密码</a></li>--%>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
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
