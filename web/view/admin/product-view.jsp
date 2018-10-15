<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.adminUser}">
    <c:redirect url = "${adminLoginFormUrl}"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product list</title>
        <%@include file="/common/admin/top-embed.jsp" %>
        <style>
            .product-small-item{
                width: 80px!important;
            }

            .table > tbody > tr > td {
                vertical-align: middle;
            }
        </style>
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
                            <h3 class="header smaller lighter blue" style="display: block;">Danh sách sản phẩm</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="row">
                                <div class="col-xs-12 text-right">
                                    <a href="/admin/product/insert" class="btn btn-sm btn-success">
                                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                                        Thêm sản phẩm</a>
                                </div>
                            </div>

                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="center col-xs-1">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace">
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th class="col-xs-3">Name</th>
                                                <th class="col-xs-2">Price</th>
                                                <th class="col-xs-1">Quantity</th>
                                                <th class="col-xs-2">Image</th>
                                                <th class="col-xs-2">Category</th>
                                                <th class="col-xs-1">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="product" items="${productList}">
                                                <tr>
                                                    <td class="center middle">
                                                        <label class="pos-rel">
                                                            <input type="checkbox" class="ace">
                                                            <span class="lbl"></span>
                                                        </label>
                                                    </td>

                                                    <td>
                                                        <a href="#">${product.name}</a>
                                                    </td>

                                                    <td>${product.price}</td>

                                                    <td>${product.quantity}</td>

                                                    <td class="center">
                                                        <img class="product-small-item" src="${imageRootUrl.concat(product.imageUrl)}" />
                                                    </td>

                                                    <td>
                                                        ${product.category.name}
                                                    </td>

                                                    <td class="center">
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <a class="btn btn-xs btn-info" href="/admin/product/update?productId=${product.id}">
                                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                            </a>

                                                            <a class="btn btn-xs btn-danger" href="/admin/product/delete?productId=${product.id}">
                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
    </body>
</html>