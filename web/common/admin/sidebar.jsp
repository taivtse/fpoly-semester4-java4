<%@page import="poly.core.dao.impl.RoleDaoImpl"%>
<%@page import="poly.core.persistence.entity.Role"%>
<%@page import="poly.core.dao.impl.CategoryDaoImpl"%>
<%@page import="poly.core.persistence.entity.Category"%>
<%@page import="java.util.List"%>
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
            <a href="/admin/home">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> Dashboard </span>
            </a>

            <b class="arrow"></b>
        </li>
        <c:set var = "servletUrl" value = "${requestScope['javax.servlet.forward.request_uri']}"/>
        <li class="${servletUrl eq '/admin/product' ? "open active" : ""}">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list-alt" aria-hidden="true"></i>
                <span class="menu-text">
                    Quản lý sản phẩm
                </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="${servletUrl eq "/admin/product" and empty param.categoryId ? "active" : ""}">
                    <a href="/admin/product">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Tất cả sản phẩm
                    </a>

                    <b class="arrow"></b>
                </li>
                <%
                    List<Category> rootCategory = new CategoryDaoImpl().getRootCategory();
                    for (Category root : rootCategory) {
                        List<Category> childCategory = new CategoryDaoImpl().getChildCategory(root);
                %>
                <c:set var = "childCategory" value = "<%=childCategory%>"/>
                <c:set var = "isExist" value = "${false}"/>
                <c:forEach var = "child" items="${childCategory}">
                    <c:if test = "${child.id eq param.categoryId}">
                        <c:set var = "isExist" value = "${true}"/>
                    </c:if>
                </c:forEach>
                <li class="${servletUrl eq "/admin/product" and isExist ? "open" : ""}">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-caret-right"></i>
                        <%=root.getName()%>
                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu ${servletUrl eq "/admin/product" and isExist ? "nav-show\" style=\"display:block;\"" : ""}">
                        <%
                            for (Category child : childCategory) {%>
                            <c:set var = "id" value = "<%=child.getId()%>"/>
                        <li class="${servletUrl eq "/admin/product" and param.categoryId eq id ? "active" : ""}">
                            <a href="/admin/product?categoryId=<%=child.getId()%>">
                                <i class="menu-icon fa fa-caret-right"></i>
                                <%=child.getName()%>
                            </a>
                            <b class="arrow"></b>
                        </li>
                        <%}%>
                    </ul>
                </li>
                <%}%>
            </ul>
        </li>

        <li class="${servletUrl eq '/admin/user' ? "open active" : ""}">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-users"></i>
                <span class="menu-text">
                    Quản lý người dùng
                </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="${servletUrl eq "/admin/user" and empty param.roleId ? "active" : ""}">
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
                    <li class="${servletUrl eq "/admin/user" and param.roleId eq role.id ? "active" : ""}">
                        <a href="/admin/user?roleId=${role.id}">
                            <i class="menu-icon fa fa-caret-right"></i>
                            ${role.name}
                        </a>
                        <b class="arrow"></b>
                    </li>
                </c:forEach>  
            </ul>
        </li>
        <li class="${servletUrl eq "/admin/invoice" ? "active" : ""}">
            <a href="/admin/invoice">
                <i class="menu-icon fa fa-money"></i>
                <span class="menu-text">Quản lý đơn đặt hàng</span>
            </a>
            <b class="arrow"></b>
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