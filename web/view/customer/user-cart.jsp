<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.customerUser}">
    <c:redirect url = "${customerLoginFormUrl}"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Giỏ hàng</title>
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
                        <h2 class="page-title">Thông tin giỏ hàng:  <span class="shop-pro-item">Giỏ hàng của bạn có: 2 sản phẩm</span></h2>
                        <!-- SHOPPING-CART SUMMARY END -->
                    </div>	

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- SHOPING-CART-MENU START -->

                        <!-- SHOPING-CART-MENU END -->
                        <!-- CART TABLE_BLOCK START -->
                        <div class="table-responsive">
                            <!-- TABLE START -->
                            <table class="table table-bordered" id="cart-summary">
                                <!-- TABLE HEADER START -->
                                <thead>
                                    <tr>
                                        <th class="cart-product text-center">Hình ảnh</th>
                                        <th class="cart-description text-center">Tên sản phẩm</th>
                                        <th class="cart-avail text-center">Số lượng trong kho</th>
                                        <th class="cart-unit text-center">Giá tiền</th>
                                        <th class="cart_quantity text-center">Số lượng mua</th>
                                        <th class="cart-delete text-center">Xoá</th>
                                        <th class="cart-total text-center">Tổng cộng</th>
                                    </tr>
                                </thead>
                                <!-- TABLE HEADER END -->
                                <!-- TABLE BODY START -->
                                <tbody>	
                                    <c:if test="${not empty cart}">
                                        <c:forEach var="cartDetail" items="${cart.cartDetails}">
                                            <!-- SINGLE CART_ITEM START -->
                                            <tr>
                                                <td class="cart-product">
                                                    <a href="/product/detail?productId=${cartDetail.product.id}">
                                                        <img src="${imageRootUrl.concat(cartDetail.product.imageUrl)}">
                                                    </a>
                                                </td>
                                                <td class="cart-description">
                                                    <p class="product-name">
                                                        <a href="/product/detail?productId=${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                    </p>
                                                </td>
                                                <td class="cart-avail"><span class="label label-success">${cartDetail.product.quantity} sản phẩm</span></td>
                                                <td class="cart-unit">
                                                    <ul class="price text-right">
                                                        <li class="price"><fmt:formatNumber value = "${cartDetail.product.price}" type = "currency"/></li>
                                                    </ul>
                                                </td>
                                                <td class="cart_quantity text-center">
                                                    <div class="cart-plus-minus-button">
                                                        <input class="cart-plus-minus" type="text" name="qtybutton" value="${cartDetail.productQuantity}">
                                                        </td>
                                                        <td class="cart-delete text-center">
                                                            <span>
                                                                <a href="#" class="cart_quantity_delete" title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            </span>
                                                        </td>
                                                        <td class="cart-total">
                                                            <span class="price"><fmt:formatNumber value = "${cartDetail.product.price * cartDetail.productQuantity}" type = "currency"/></span>
                                                        </td>
                                            </tr>
                                            <!-- SINGLE CART_ITEM END -->
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                                <!-- TABLE BODY END -->
                                <!-- TABLE FOOTER START -->
                                <tfoot>
                                    <tr>
                                        <td class="cart_voucher" colspan="3" rowspan="4"></td><td class="total-price-container text-right" colspan="3">
                                            <span>Total</span>
                                        </td>
                                        <td id="total-price-container" class="price" colspan="1">
                                            <span id="total-price">9798</span>
                                        </td>
                                    </tr>
                                </tfoot>		
                                <!-- TABLE FOOTER END -->									
                            </table>
                            <!-- TABLE END -->
                        </div>
                        <!-- CART TABLE_BLOCK END -->
                    </div>


                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- RETURNE-CONTINUE-SHOP START -->
                        <div class="returne-continue-shop">
                            <a href="/" class="continueshoping"><i class="fa fa-chevron-left"></i>Tiếp tục mua hàng</a>
                            <c:if test="${not empty cart}">
                                <a href="checkout-signin.html" class="procedtocheckout">Đặt hàng<i class="fa fa-chevron-right"></i></a>
                                </c:if>
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
