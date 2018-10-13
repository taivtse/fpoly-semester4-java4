<%@page import="poly.core.dao.impl.RoleDaoImpl"%>
<%@page import="poly.core.persistence.entity.Role"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="poly.core.dao.impl.CategoryDaoImpl"%>
<%@page import="poly.core.persistence.entity.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidebar" class="sidebar responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- /.sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li class="">
            <a href="/admin-home.html">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> Dashboard </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-desktop"></i>
                <span class="menu-text">
                    Quản lý sản phẩm
                </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="">
                    <a href="/admin/product">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Tất cả sản phẩm
                    </a>

                    <b class="arrow"></b>
                </li>
                <%
                    List<Category> rootCategory = new CategoryDaoImpl().getRootCategory();
                %>
                <c:forEach var="root" items="<%=rootCategory%>">
                    <li class="">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>
                            ${root.name}
                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu">
                            <c:forEach var="child" items="${root.childCategories}">
                                <li class="">
                                    <a href="/admin/product?category=${child.id}">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        ${child.name}
                                    </a>
                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>  
            </ul>
        </li>
        
        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-desktop"></i>
                <span class="menu-text">
                    Quản lý người dùng
                </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="">
                    <a href="/admin/user">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Tất cả người dùng
                    </a>

                    <b class="arrow"></b>
                </li>
                <%
                    List<Role> roles = new RoleDaoImpl().getAll();
                %>
                <c:forEach var="role" items="<%=roles%>">
                    <li class="">
                        <a href="/admin/user?role=${role.id}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            ${role.name}
                        </a>
                        <b class="arrow"></b>
                    </li>
                </c:forEach>  
            </ul>
        </li>
    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>