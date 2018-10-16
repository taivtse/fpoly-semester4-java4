<%@include file="/common/taglib.jsp"%>
<!doctype html>
<head>
    <title>Trang chủ</title>
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
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <!-- PRODUCT-LEFT-SIDEBAR START -->
                    <div class="product-left-sidebar">
                        <h2 class="left-title pro-g-page-title">Catalog</h2>
                        <!-- SINGLE SIDEBAR ENABLED FILTERS START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">ENABLED FILTERS:</span>
                            <ul class="filtering-menu">
                                <li>
                                    Categories: Dresses 
                                    <a href="#"><i class="fa fa-remove"></i></a>
                                </li>
                                <li>
                                    Avaiale: In stock 
                                    <a href="#"><i class="fa fa-remove"></i></a>
                                </li>
                                <li>
                                    Categories: Dresses 
                                    <a href="#"><i class="fa fa-remove"></i></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR ENABLED FILTERS END -->
                        <!-- SINGLE SIDEBAR CATEGORIES START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Categories</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="categories">
                                        <span></span>
                                    </label>
                                    <a href="#">Tops<span> (12)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="categories">
                                        <span></span>
                                    </label>
                                    <a href="#">Dresses<span> (13)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR CATEGORIES END -->
                        <!-- SINGLE SIDEBAR AVAILABILITY START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Availability</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="availability">
                                        <span></span>
                                    </label>
                                    <a href="#">In stock<span> (13)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR AVAILABILITY END -->
                        <!-- SINGLE SIDEBAR CONDITION START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Condition</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="condition">
                                        <span></span>
                                    </label>
                                    <a href="#">new<span> (13)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR CONDITION END -->
                        <!-- SINGLE SIDEBAR MANUFACTURER START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Manufacturer</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="manufacturer">
                                        <span></span>
                                    </label>
                                    <a href="#">Fashion Manufacturer<span> (13)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR MANUFACTURER END -->
                        <!-- SINGLE SIDEBAR PRICE START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Price</span>
                            <ul>
                                <li> 
                                    <label><strong>Range:</strong><input type="text" id="slidevalue"></label>
                                </li>
                                <li>
                                    <div id="price-range" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 9.09091%; width: 80.8081%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 9.09091%;"></a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 89.899%;"></a></div>	
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR PRICE END -->
                    </div>
                    <!-- PRODUCT-LEFT-SIDEBAR END -->
                    <!-- SINGLE SIDEBAR TAG START -->
                    <div class="product-left-sidebar">
                        <h2 class="left-title">Tags </h2>
                        <div class="category-tag">
                            <a href="#">fashion</a>
                            <a href="#">handbags</a>
                            <a href="#">women</a>
                            <a href="#">men</a>
                            <a href="#">kids</a>
                            <a href="#">New</a>
                            <a href="#">Accessories</a>
                            <a href="#">clothing</a>
                            <a href="#">New</a>
                        </div>
                    </div>
                    <!-- SINGLE SIDEBAR TAG END -->
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <!-- ALL GATEGORY-PRODUCT START -->
                    <div class="all-gategory-product">
                        <div class="row">
                            <ul class="gategory-product">
                                <!-- SINGLE ITEM START -->
                                <c:forEach var="product" items="${productList}">
                                    <li class="cat-product-list">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <div class="single-product-item">
                                                <div class="product-image">
                                                    <a href="/product/detail?productId=${product.id}"><img src="${imageRootUrl.concat(product.imageUrl)}" alt="product-image"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                            <div class="list-view-content">
                                                <div class="single-product-item">
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <a href="/product/detail?productId=${product.id}">${product.name}</a>
                                                        </div>
                                                        <div class="product-datails">
                                                            <p>${product.description}</p>
                                                        </div>
                                                        <div class="price-box">
                                                            <span class="price"><fmt:formatNumber value = "${product.price}" type = "currency"/></span>
                                                        </div>
                                                    </div>
                                                    <div class="overlay-content-list">
                                                        <ul>
                                                            <li><a href="${customerCartInsertFormUrl}?productId=${product.id}" class="add-cart-text">Thêm vào giỏ hàng</a></li>
                                                        </ul>
                                                    </div>												
                                                </div>														
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                                <!-- SINGLE ITEM END -->
                            </ul>
                        </div>
                    </div>
                    <!-- ALL GATEGORY-PRODUCT END -->
                </div>
            </div>
        </div>
    </section>
    <%@include file="/common/customer/footer.jsp" %>
    <%@include file="/common/customer/bottom-embed.jsp" %>
</body>
</html>