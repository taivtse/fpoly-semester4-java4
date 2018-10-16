<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.adminUser}">
    <c:redirect url = "${adminLoginFormUrl}"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Invoice list</title>
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
                            <h3 class="header smaller lighter blue" style="display: block;">Danh sách đơn đặt hàng</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%" class="text-center">Mã hoá đơn</th>
                                                <th style="width: 10%" class="text-center">Mã khách hàng</th>
                                                <th style="width: 15%" class="text-center">Ngày tạo</th>
                                                <th style="width: 10%" class="text-center">Trạng thái</th>
                                                <th style="width: 15%" class="text-center">Tổng số mặt hàng</th>
                                                <th style="width: 15%" class="text-center">Tổng số sản phẩm</th>
                                                <th style="width: 15%" class="text-center">Tống cộng</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="invoice" items="${invoiceList}">
                                                <tr>
                                                    <td>
                                                        <a href="/admin/invoice/detail?invoiceId=${invoice.id}">#${invoice.id}</a>
                                                    </td>

                                                    <td>${invoice.cart.user.id}</td>

                                                    <td>
                                                        <a href="/admin/invoice/detail?invoiceId=${invoice.id}">
                                                        <fmt:formatDate pattern="dd-MM-yyyy" value = "${invoice.createdDate}" />
                                                        </a>
                                                    </td>

                                                    <td class="text-center">
                                                        <span class="label label-sm label-success">
                                                            ${invoice.status eq 0 ? "Đang xử lý" : "Đã thanh toán"}
                                                        </span>
                                                    </td>

                                                    <td class="text-center">${fn:length(invoice.cart.cartDetails)}</td>
                                                    
                                                    <c:set var="productCountTotal" value="${0}"/>
                                                    <c:forEach var="item" items="${invoice.cart.cartDetails}">
                                                        <c:set var="productCountTotal" value="${ productCountTotal + item.productQuantity}" />
                                                    </c:forEach>
                                                    
                                                    <td class="text-center">${productCountTotal}</td>
                                                    
                                                    <c:set var="invoiceTotal" value="${0}"/>
                                                    <c:forEach var="item" items="${invoice.cart.cartDetails}">
                                                        <c:set var="invoiceTotal" value="${ invoiceTotal + (item.productQuantity * item.product.price)}" />
                                                    </c:forEach>
                                                    <td class="text-right"><fmt:formatNumber value = "${invoiceTotal}" type = "currency"/></td>
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