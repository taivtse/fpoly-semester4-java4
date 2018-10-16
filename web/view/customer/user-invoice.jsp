<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.customerUser}">
    <c:redirect url = "${customerLoginFormUrl}"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Đơn đặt hàng</title>
        <%@include file="/common/customer/top-embed.jsp" %>
    </head>
    <body>
        <%@include file="/common/customer/header.jsp" %>
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%@include file="/common/customer/breadcrumb.jsp" %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- SHOPPING-CART SUMMARY START -->
                        <h2 class="page-title">Thông tin đơn đặt hàng
                            <!-- SHOPPING-CART SUMMARY END -->
                    </div>	

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <c:choose>
                            <c:when test="${not empty invoiceList}">
                                <!-- CART TABLE_BLOCK START -->
                                <div class="table-responsive">
                                    <!-- TABLE START -->
                                    <table class="table table-bordered" id="cart-summary">
                                        <!-- TABLE HEADER START -->
                                        <thead>
                                            <tr>
                                                <th class="cart-product text-center" style="width: 16%">Mã đơn đặt hàng</th>
                                                <th class="cart-description text-center">Ngày tạo</th>
                                                <th class="cart-avail text-center" style="width: 16%">Trạng thái</th>
                                                <th class="cart-avail text-center" style="width: 16%">Tổng số mặt hàng</th>
                                                <th class="cart-avail text-center" style="width: 16%">Tổng số sản phẩm</th>
                                                <th class="cart-total text-center" style="width: 16%">Tống cộng</th>
                                            </tr>
                                        </thead>
                                        <!-- TABLE HEADER END -->
                                        <!-- TABLE BODY START -->
                                        <tbody>	
                                            <c:forEach var="invoice" items="${invoiceList}">
                                                <!-- SINGLE CART_ITEM START -->
                                                <tr>
                                                    <td class="cart-product">
                                                        <a href="/customer/invoice/detail?invoiceId=${invoice.id}">#${invoice.id}</a>
                                                    </td>
                                                    <td class="cart-description">
                                                        <p class="product-name">
                                                            <a href="/customer/invoice/detail?invoiceId=${invoice.id}"><fmt:formatDate pattern="dd-MM-yyyy" value = "${invoice.createdDate}" /></a>
                                                        </p>
                                                    </td>
                                                    <td class="cart-avail">
                                                        <span class="label label-success">${invoice.status eq 0 ? "Đang xử lý" : "Đã thanh toán"}</span>
                                                    </td>
                                                    <td class="cart-avail">
                                                        <ul class="price text-right">
                                                            <li class="price">${fn:length(invoice.cart.cartDetails)}</li>
                                                        </ul>
                                                    </td>
                                                    <c:set var="productCountTotal" value="${0}"/>
                                                    <c:forEach var="item" items="${invoice.cart.cartDetails}">
                                                        <c:set var="productCountTotal" value="${ productCountTotal + item.productQuantity}" />
                                                    </c:forEach>
                                                    <td class="cart-avail">
                                                        <ul class="price text-right">
                                                            <li class="price">${productCountTotal}</li>
                                                        </ul>
                                                    </td>
                                                    <c:set var="invoiceTotal" value="${0}"/>
                                                    <c:forEach var="item" items="${invoice.cart.cartDetails}">
                                                        <c:set var="invoiceTotal" value="${ invoiceTotal + (item.productQuantity * item.product.price)}" />
                                                    </c:forEach>
                                                    <td class="cart-total">
                                                        <span class="price"><fmt:formatNumber value = "${invoiceTotal}" type = "currency"/></span>
                                                    </td>
                                                </tr>
                                                <!-- SINGLE CART_ITEM END -->
                                            </c:forEach>
                                        </tbody>
                                        <!-- TABLE BODY END -->									
                                    </table>
                                    <!-- TABLE END -->
                                </div>
                                <!-- CART TABLE_BLOCK END -->
                            </c:when>
                            <c:otherwise>
                                <h2 class="text-center">Bạn chưa có đơn đặt hàng nào.</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- RETURNE-CONTINUE-SHOP START -->
                        <div class="returne-continue-shop">
                            <a href="/" class="continueshoping"><i class="fa fa-chevron-left"></i>Tiếp tục mua hàng</a>
                        </div>	
                        <!-- RETURNE-CONTINUE-SHOP END -->				
                    </div>
                </div>
            </div>
        </section>
        <%@include file="/common/customer/footer.jsp" %>
        <%@include file="/common/customer/bottom-embed.jsp" %>
    </body>
</html>
