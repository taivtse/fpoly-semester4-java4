<%@page import="poly.core.dao.impl.CategoryDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="poly.core.persistence.entity.Category"%>
<%@include file="/common/taglib.jsp" %>
<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.adminUser}">
    <c:redirect url = "${adminLoginFormUrl}"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Update Product</title>
        <%@include file="/common/admin/top-embed.jsp" %>
    </head>
    <body class="no-skin">
        <%@include file="/common/admin/navbar.jsp" %>
        <%@include file="/common/admin/sidebar.jsp" %>
        <div class="main-content">
            <div class="main-content-inner">
                <%@include file="/common/admin/breadcrumb.jsp" %>
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue" style="display: block;">Cập nhật thông tin sản phẩm</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <form class="form-horizontal" role="form" action="${productUpdateFormUrl}" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="productId" value="${product.id}" />
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Tên sản phẩm</label>
                                            <div class="col-sm-6">
                                                <input required type="text" name="name" value="${product.name}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Giá bán</label>
                                            <div class="col-sm-6">
                                                <input required type="number" name="price" value="${product.price}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Số lượng</label>
                                            <div class="col-sm-6">
                                                <input required type="number" name="quantity" value="${product.quantity}" class="col-xs-12">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Danh mục</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="categoryId">
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
                                                <textarea required name="description" class="form-control" style="overflow: hidden; overflow-wrap: break-word; resize: horizontal; height: 100px;">${product.description}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Hình ảnh</label>
                                            <div class="col-sm-6">
                                                <img src="${imageRootUrl.concat(product.imageUrl)}" style="width: 150px; height: 150px; background-color: #ffffff" id="product-image">
                                                <input type="file" name="image" id="image_url"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>
                                            <div class="col-sm-6 text-right">
                                                <button type="submit" class="btn btn-sm btn-primary">Cập nhật</button>
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
        <%@include file="/common/admin/footer.jsp" %>
        <%@include file="/common/admin/bottom-embed.jsp" %>
        <script type='text/javascript'>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('#image_url').onchange = changeImageFile;
            }, false);
            function changeImageFile(event) {
                var imageshow = document.querySelector('#product-image');
                imageshow.src = URL.createObjectURL(event.target.files[0])
            }
        </script>                  
    </body>
</html>