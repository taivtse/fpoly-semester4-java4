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
                        <!-- SINGLE SIDEBAR SIZE START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Size</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="Size">
                                        <span></span>
                                    </label>
                                    <a href="#">S<span> (10)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="Size">
                                        <span></span>
                                    </label>
                                    <a href="#">m<span> (10)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="Size">
                                        <span></span>
                                    </label>
                                    <a href="#">l<span> (10)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR SIZE END -->
                        <!-- SINGLE SIDEBAR COLOR START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Color</span>
                            <ul class="product-color-var">
                                <li>
                                    <i class="fa fa-square color-beige"></i>
                                    <a href="#">Beige<span> (1)</span></a>
                                </li>
                                <li>
                                    <i class="fa fa-square color-white"></i>
                                    <a href="#">white<span> (2)</span></a>
                                </li>	
                                <li>
                                    <i class="fa fa-square color-black"></i>
                                    <a href="#">black<span> (2)</span></a>
                                </li>									
                                <li>
                                    <i class="fa fa-square color-orange"></i>
                                    <a href="#">orange<span> (5)</span></a>
                                </li>
                                <li>
                                    <i class="fa fa-square color-blue"></i>
                                    <a href="#">blue<span> (8)</span></a>
                                </li>
                                <li>
                                    <i class="fa fa-square color-green"></i>
                                    <a href="#">green<span> (3)</span></a>
                                </li>
                                <li>
                                    <i class="fa fa-square color-yellow"></i>
                                    <a href="#">yellow<span> (4)</span></a>
                                </li>
                                <li>
                                    <i class="fa fa-square color-pink"></i>
                                    <a href="#">pink<span> (6)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR COLOR END -->
                        <!-- SINGLE SIDEBAR COMPOSITIONS START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Compositions</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="compositions">
                                        <span></span>
                                    </label>
                                    <a href="#">Cotton<span>(8)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="compositions">
                                        <span></span>
                                    </label>
                                    <a href="#"> Polyester<span>(3)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="compositions">
                                        <span></span>
                                    </label>
                                    <a href="#"> Viscose<span>(2)</span></a>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDEBAR COMPOSITIONS END -->
                        <!-- SINGLE SIDEBAR STYLES START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Styles</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="styles">
                                        <span></span>
                                    </label>
                                    <a href="#">Casual<span>(5)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="styles">
                                        <span></span>
                                    </label>
                                    <a href="#">Dressy<span>(1)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="styles">
                                        <span></span>
                                    </label>
                                    <a href="#">Girly<span>(7)</span></a>
                                </li>
                            </ul>
                        </div>	
                        <!-- SINGLE SIDEBAR STYLES END -->
                        <!-- SINGLE SIDEBAR PROPERTIES START -->
                        <div class="product-single-sidebar">
                            <span class="sidebar-title">Properties</span>
                            <ul>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="properties">
                                        <span></span>
                                    </label>
                                    <a href="#">Colorful Dress<span>(4)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="properties">
                                        <span></span>
                                    </label>
                                    <a href="#">Maxi Dress <span>(1)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="properties">
                                        <span></span>
                                    </label>
                                    <a href="#">Midi Dress<span>(2)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="properties">
                                        <span></span>
                                    </label>
                                    <a href="#">Short Dress<span>(2)</span></a>
                                </li>
                                <li>
                                    <label class="cheker">
                                        <input type="checkbox" name="properties">
                                        <span></span>
                                    </label>
                                    <a href="#"> Short Sleeve<span>(4)</span></a>
                                </li>
                            </ul>
                        </div>	
                        <!-- SINGLE SIDEBAR PROPERTIES END -->
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
                                                    <a href=""><img src="${imageRootUrl.concat(product.imageUrl)}" alt="product-image"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                            <div class="list-view-content">
                                                <div class="single-product-item">
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <a href="">${product.name}</a>
                                                        </div>
                                                        <div class="product-datails">
                                                            <p>${product.description}</p>
                                                        </div>
                                                        <div class="price-box">
                                                            <span class="price">${product.price}</span>
                                                        </div>
                                                    </div>
                                                    <div class="overlay-content-list">
                                                        <ul>
                                                            <li><a href="#" class="add-cart-text">Thêm vào giỏ hàng</a></li>
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