<%@page import="poly.core.dao.impl.CategoryDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="poly.core.persistence.entity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.user}">
    <c:redirect url = "/view/admin/login.jsp"/>
</c:if>
<c:url var="udpateFormUrl" value="/admin/product/update"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title><fmt:message key="label.admin.title" bundle="${lang}"/></title>
        <style>
            .product-small-item{
                width: 80px!important;
            }

            .table > tbody > tr > td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
                        try {
                            ace.settings.check('breadcrumbs', 'fixed')
                        } catch (e) {
                        }
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                        </li>

                        <li>
                            <a href="#">Sản phẩm</a>
                        </li>
                        <li class="active">Thêm mới</li>
                    </ul><!-- /.breadcrumb -->

                    <div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off">
                                <i class="ace-icon fa fa-search nav-search-icon"></i>
                            </span>
                        </form>
                    </div><!-- /.nav-search -->
                </div>

                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue" style="display: block;">Cập nhật sản phẩm</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <form class="form-horizontal" role="form" action="${udpateFormUrl}" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="${product.id}" />
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Tên sản phẩm</label>
                                            <div class="col-sm-6">
                                                <input type="text" name="name" value="${product.name}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Giá bán</label>
                                            <div class="col-sm-6">
                                                <input type="number" name="price" value="${product.price}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Số lượng</label>
                                            <div class="col-sm-6">
                                                <input type="number" name="quantity" value="${product.quantity}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Danh mục</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="category">
                                                    <%
                                                        List<Category> categorys = new CategoryDaoImpl().getAllChildCategory();
                                                    %>
                                                    <c:forEach var="category" items="<%=categorys%>">
                                                        <option value="${category.id}" ${category.id eq product.category.id ? "selected" : ""}>${category.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Mô tả</label>
                                            <div class="col-sm-6">
                                                <textarea name="description" class="form-control" style="overflow: hidden; overflow-wrap: break-word; resize: horizontal; height: 100px;">${product.description}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Hình ảnh</label>
                                            <div class="col-sm-6">
                                                <img src="/resources/image/${product.imageUrl}" style="width: 150px; height: 150px; background-color: #ffffff" id="product-image">
                                                <input type="file" name="image" id="image_url"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>
                                            <div class="col-sm-6 text-right">
                                                <button name="action" value="insert" type="submit" class="btn btn-sm btn-primary">Cập nhật</button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /.span -->
                            </div><!-- /.row -->
                            <div class="hr hr-18 dotted hr-double"></div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.page-content -->
            </div>
        </div>
    <content tag="bottom_javascript">
        <script type='text/javascript'>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('#image_url').onchange = changeImageFile;
            }, false);
            function changeImageFile(event) {
                var imageshow = document.querySelector('#product-image');
                imageshow.src = URL.createObjectURL(event.target.files[0])
            }
        </script>
    </content>                      
</body>
</html>