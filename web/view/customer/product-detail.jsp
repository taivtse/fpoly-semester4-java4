<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiết sản phẩm</title>
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
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                                <div class="single-product-view">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="thumbnail_1">
                                            <div class="single-product-image">
                                                <img src="${imageRootUrl.concat(product.imageUrl)}" alt="single-product-image" />
                                                <a class="fancybox" href="${imageRootUrl.concat(product.imageUrl)}" data-fancybox-group="gallery"><span class="btn large-btn">Phóng to <i class="fa fa-search-plus"></i></span></a>
                                            </div>	
                                        </div>
                                    </div>										
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                                <div class="single-product-descirption">
                                    <h2>${product.name}</h2>
                                    <div class="single-product-social-share">
                                        <ul>
                                            <li><a href="#" class="twi-link"><i class="fa fa-twitter"></i>Tweet</a></li>
                                            <li><a href="#" class="fb-link"><i class="fa fa-facebook"></i>Share</a></li>
                                            <li><a href="#" class="g-plus-link"><i class="fa fa-google-plus"></i>Google+</a></li>
                                            <li><a href="#" class="pin-link"><i class="fa fa-pinterest"></i>Pinterest</a></li>
                                        </ul>
                                    </div>
                                    <div class="single-product-price">
                                        <h2><fmt:formatNumber value = "${product.price}" type = "currency"/></h2>
                                    </div>
                                    <div class="single-product-desc">
                                        <p>${product.description}</p>
                                        <div class="product-in-stock">
                                            <p>Số lượng trong kho<span>${product.quantity} sản phẩm</span></p>
                                        </div>
                                    </div>

                                    <div class="single-product-add-cart">
                                        <a class="add-cart-text" title="Add to cart" href="${customerCartInsertFormUrl}?productId=${product.id}">Thêm vào giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT-DESCRIPTION END -->
                        <!-- SINGLE-PRODUCT INFO TAB START -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="product-more-info-tab">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs more-info-tab padding-2">
                                        <li class="active"><a href="#moreinfo" data-toggle="tab">Thông tin chi tiết</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="moreinfo">
                                            <div class="tab-description">
                                                <p>${product.description}</p>
                                            </div>
                                        </div>
                                    </div>									
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT INFO TAB END -->
                    </div>
                    <!-- RIGHT SIDE BAR START -->
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <!-- SINGLE SIDE BAR START -->
                        <div class="single-product-right-sidebar">
                            <h2 class="left-title">Sản phẩm liên quan</h2>
                            <ul>
                                <c:forEach var="product" items="${requestScope.relatedProducts}">
                                <li>
                                    <a href="/product/detail?productId=${product.id}"><img src="${imageRootUrl.concat(product.imageUrl)}" alt="" /></a>
                                    <div class="r-sidebar-pro-content">
                                        <h5><a href="/product/detail?productId=${product.id}">${product.name}</a></h5>
                                        <!--<p>Faded short sleeves t-shirt with high...</p>-->
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>	
                        <!-- SINGLE SIDE BAR END -->
                    </div>
                    <!-- SINGLE SIDE BAR END -->				
                </div>
            </div>
        </section>
        <%@include file="/common/customer/footer.jsp" %>
        <%@include file="/common/customer/bottom-embed.jsp" %>
    </body>
</html>
