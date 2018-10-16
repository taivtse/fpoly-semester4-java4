<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.adminUser}">
    <c:redirect url = "${adminLoginFormUrl}"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User list</title>
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
                            <h3 class="header smaller lighter blue" style="display: block;">Chi tiết đơn đặt hàng</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <strong>Mã khách hàng:</strong> #${invoice.cart.user.id} - <strong>Mã đơn đặt hàng:</strong> #${invoice.id} - <strong>Ngày tạo: ${invoice.cart.createdDate}</strong>  
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-2 text-center">Hình ảnh</th>
                                                <th class="col-xs-3 text-center">Tên sản phẩm</th>
                                                <th class="col-xs-2 text-center">Giá tiền</th>
                                                <th class="col-xs-2 text-center">Số lượng mua</th>
                                                <th class="col-xs-3 text-center">Tổng cộng</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:set var="invoiceTotal" value="${0}"/>
                                            <c:forEach var="cartDetail" items="${cartDetailsInInvoice}">
                                                <tr>
                                                    <td class="text-center">
                                                        <a href="/product/detail?productId=${cartDetail.product.id}">
                                                            <img class="product-small-item" src="${imageRootUrl.concat(cartDetail.product.imageUrl)}">
                                                        </a>
                                                    </td>

                                                    <td>
                                                        <a href="/product/detail?productId=${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                    </td>

                                                    <td class="text-right">
                                                        <fmt:formatNumber value = "${cartDetail.product.price}" type = "currency"/>
                                                    </td>

                                                    <td class="text-center">
                                                        ${cartDetail.productQuantity}
                                                    </td>

                                                    <td class="text-right">
                                                        <fmt:formatNumber value = "${cartDetail.product.price * cartDetail.productQuantity}" type = "currency"/>
                                                    </td>
                                                    <c:set var="invoiceTotal" value="${invoiceTotal + (cartDetail.product.price * cartDetail.productQuantity)}" />
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- /.span -->
                            </div><!-- /.row -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12 text-right">
                                    <h3 class="smaller lighter blue" style="font-size: 17px;">
                                        Tổng cộng: <fmt:formatNumber value = "${invoiceTotal}" type = "currency"/>
                                    </h3>
                                </div>
                            </div>
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