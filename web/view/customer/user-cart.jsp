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
                        <h2 class="page-title">Thông tin giỏ hàng 
                            <c:if test="${not empty cartDetailItems}">
                                <span class="shop-pro-item">Mã giỏ hàng: #${cartId}</span>
                            </c:if>
                            <!-- SHOPPING-CART SUMMARY END -->
                    </div>	

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <c:choose>
                            <c:when test="${not empty cartDetailItems}">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="returne-continue-shop">
                                            <a href="/customer/cart/drop?cartId=${cartId}" class="procedtocheckout" style="padding: 0 10px;
                                               font-size: 14px;
                                               height: 35px;
                                               align-items: center;
                                               display: inline-flex;">Xoá toàn bộ giỏ hàng<i class="fa fa-times-circle"></i></a>
                                        </div>
                                    </div>
                                </div>
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
                                            <c:set var="cartTotal" value="${0}"/>
                                            <c:forEach var="cartDetail" items="${cartDetailItems}">
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
                                                    <td class="cart_quantity">
                                                        <ul class="price text-right">
                                                            <li class="price"><fmt:formatNumber value = "${cartDetail.product.price}" type = "currency"/></li>
                                                        </ul>
                                                    </td>
                                                    <td class="cart_quantity text-center">
                                                        <div class="cart-plus-minus-button">
                                                            <input class="cart-plus-minus" type="text" name="qtybutton" value="${cartDetail.productQuantity}">
                                                        </div>
                                                    </td>
                                                    <td class="cart-delete text-center">
                                                        <span>
                                                            <a href="/customer/cart/delete?productId=${cartDetail.product.id}" class="cart_quantity_delete" title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        </span>
                                                    </td>
                                                    <td class="cart-total">
                                                        <span class="price"><fmt:formatNumber value = "${cartDetail.product.price * cartDetail.productQuantity}" type = "currency"/></span>
                                                    </td>
                                                    <c:set var="cartTotal" value="${cartTotal + (cartDetail.product.price * cartDetail.productQuantity)}" />
                                                </tr>
                                                <!-- SINGLE CART_ITEM END -->
                                            </c:forEach>
                                        </tbody>
                                        <!-- TABLE BODY END -->
                                        <!-- TABLE FOOTER START -->
                                        <tfoot>
                                            <tr>
                                                <td class="cart_voucher" colspan="3" rowspan="4"></td><td class="total-price-container text-right" colspan="3">
                                                    <span>Tổng cộng</span>
                                                </td>
                                                <td id="total-price-container" class="price" colspan="1">
                                                    <span id="total-price"><fmt:formatNumber value = "${cartTotal}" type = "currency"/></span>
                                                </td>
                                            </tr>
                                        </tfoot>		
                                        <!-- TABLE FOOTER END -->									
                                    </table>
                                    <!-- TABLE END -->
                                </div>
                                <!-- CART TABLE_BLOCK END -->
                            </c:when>
                            <c:otherwise>
                                <h2 class="text-center">Giỏ hàng của bạn đang rỗng.</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- RETURNE-CONTINUE-SHOP START -->
                        <div class="returne-continue-shop">
                            <a href="/" class="continueshoping"><i class="fa fa-chevron-left"></i>Tiếp tục mua hàng</a>
                            <c:if test="${not empty cartDetailItems}">
                                <a href="/customer/invoice/create?cartId=${cartId}" class="procedtocheckout">Đặt hàng<i class="fa fa-chevron-right"></i></a>
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
