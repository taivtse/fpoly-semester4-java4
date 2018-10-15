<%@include file="/common/taglib.jsp" %>
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
                        <h2 class="page-title">Shopping-cart summary <span class="shop-pro-item">Your shopping cart contains: 2 products</span></h2>
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
                                        <th class="cart-product">Product</th>
                                        <th class="cart-description">Description</th>
                                        <th class="cart-avail text-center">Availability</th>
                                        <th class="cart-unit text-right">Unit price</th>
                                        <th class="cart_quantity text-center">Qty</th>
                                        <th class="cart-delete">&nbsp;</th>
                                        <th class="cart-total text-right">Total</th>
                                    </tr>
                                </thead>
                                <!-- TABLE HEADER END -->
                                <!-- TABLE BODY START -->
                                <tbody>	
                                    <!-- SINGLE CART_ITEM START -->
                                    <tr>
                                        <td class="cart-product">
                                            <a href="#"><img alt="Blouse" src="img/product/cart-image1.jpg"></a>
                                        </td>
                                        <td class="cart-description">
                                            <p class="product-name"><a href="#">Faded Short Sleeves T-shirt</a></p>
                                            <small>SKU : demo_1</small>
                                            <small><a href="#">Size : S, Color : Orange</a></small>
                                        </td>
                                        <td class="cart-avail"><span class="label label-success">In stock</span></td>
                                        <td class="cart-unit">
                                            <ul class="price text-right">
                                                <li class="price">$16.51</li>
                                            </ul>
                                        </td>
                                        <td class="cart_quantity text-center">
                                            <div class="cart-plus-minus-button">
                                                <input class="cart-plus-minus" type="text" name="qtybutton" value="0">
                                                <div class="dec qtybutton">-</div><div class="inc qtybutton">+</div></div>
                                        </td>
                                        <td class="cart-delete text-center">
                                            <span>
                                                <a href="#" class="cart_quantity_delete" title="Delete"><i class="fa fa-trash-o"></i></a>
                                            </span>
                                        </td>
                                        <td class="cart-total">
                                            <span class="price">$16.51</span>
                                        </td>
                                    </tr>
                                    <!-- SINGLE CART_ITEM END -->
                                    <!-- SINGLE CART_ITEM START -->

                                    <!-- SINGLE CART_ITEM END -->
                                    <!-- SINGLE CART_ITEM START -->

                                    <!-- SINGLE CART_ITEM END -->
                                </tbody>
                                <!-- TABLE BODY END -->
                                <!-- TABLE FOOTER START -->
                                <tfoot>										



                                    <tr>
                                        <td class="cart_voucher" colspan="3" rowspan="4"></td><td class="total-price-container text-right" colspan="3">
                                            <span>Total</span>
                                        </td>
                                        <td id="total-price-container" class="price" colspan="1">
                                            <span id="total-price">$76.46</span>
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
                            <a href="index.html" class="continueshoping"><i class="fa fa-chevron-left"></i>Continue shopping</a>
                            <a href="checkout-signin.html" class="procedtocheckout">Proceed to checkout<i class="fa fa-chevron-right"></i></a>
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
