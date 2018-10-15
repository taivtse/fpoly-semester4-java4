<%@page import="poly.core.persistence.entity.User"%>
<%@page import="poly.core.dao.impl.CategoryDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="poly.core.persistence.entity.Category"%>
<%@page import="poly.core.persistence.entity.Category"%>
<div class="header-top">
    <div class="container">
        <div class="row">
            <!-- HEADER-LEFT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-left-menu">
                    <div class="currenty-converter">
                        <form method="post" action="#" id="currency-set">
                            <div class="current-currency">
                                <span class="cur-label">Currency : </span><strong>USD</strong>
                            </div>
                            <ul class="currency-list currency-toogle">
                                <li>
                                    <a title="Dollar (USD)" href="#">Dollar (USD)</a>
                                </li>
                                <li>
                                    <a title="Euro (EUR)" href="#">Euro (EUR)</a>
                                </li>
                            </ul>
                        </form>									
                    </div>
                    <div class="selected-language">
                        <div class="current-lang">
                            <span class="current-lang-label">Language : </span><strong>English</strong>
                        </div>
                        <ul class="languages-choose language-toogle">
                            <li>
                                <a href="#" title="English">
                                    <span>English</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" title="Français (French)">
                                    <span>Français</span>
                                </a>
                            </li>
                        </ul>										
                    </div>
                </div>
            </div>
            <!-- HEADER-LEFT-MENU END -->
            <!-- HEADER-RIGHT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-right-menu">
                    <nav>
                        <ul class="list-inline">
                            <li>Xin chào</li>
                            <c:choose>
                                <c:when test="${empty sessionScope.customerUser}">
                                    <li><a href="/login">Đăng nhập</a></li>
                                    <li><a href="/register">Đăng ký</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="">${sessionScope.customerUser.fullname}</a></li>
                                    <li><a href="/logout">Đăng xuất</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>									
                    </nav>
                </div>
            </div>
            <!-- HEADER-RIGHT-MENU END -->
        </div>
    </div>
</div>
<section class="header-middle">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- LOGO START -->
                <div class="logo">
                    <a href="index.html"><img src="${customerTemplateUrl}img/logo.png" alt="bstore logo"></a>
                </div>
                <!-- LOGO END -->
                <!-- HEADER-RIGHT-CALLUS START -->
                <div class="header-right-callus">
                    <h3>call us free</h3>
                    <span>0123-456-789</span>
                </div>
                <!-- HEADER-RIGHT-CALLUS END -->
                <!-- CATEGORYS-PRODUCT-SEARCH START -->
                <div class="categorys-product-search">
                    <form action="#" method="get" class="search-form-cat">
                        <div class="search-product form-group">
                            <select name="catsearch" class="cat-search">
                                <option value="">Categories</option>
                                <option value="2">--Women</option>									
                            </select>
                            <input type="text" class="form-control search-form" name="s" placeholder="Enter your search key ... ">
                            <button class="search-button" value="Search" name="s" type="submit">
                                <i class="fa fa-search"></i>
                            </button>									 
                        </div>
                    </form>
                </div>
                <!-- CATEGORYS-PRODUCT-SEARCH END -->
            </div>
        </div>
    </div>
</section>
<header class="main-menu-area">
    <div class="container">
        <div class="row">
            <!-- SHOPPING-CART START -->
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 pull-right shopingcartarea">
                <div class="shopping-cart-out pull-right">
                    <div class="shopping-cart">
                        <a class="shop-link" href="cart.html" title="View my shopping cart">
                            <i class="fa fa-shopping-cart cart-icon"></i>
                            <b>My Cart</b>
                            <span class="ajax-cart-quantity">2</span>
                        </a>
                        <div class="shipping-cart-overly">
                            <div class="shipping-item">
                                <span class="cross-icon"><i class="fa fa-times-circle"></i></span>
                                <div class="shipping-item-image">
                                    <a href="#"><img src="${customerTemplateUrl}img/shopping-image.jpg" alt="shopping image"></a>
                                </div>
                                <div class="shipping-item-text">
                                    <span>2 <span class="pro-quan-x">x</span> <a href="#" class="pro-cat">Watch</a></span>
                                    <span class="pro-quality"><a href="#">S,Black</a></span>
                                    <p>$22.95</p>
                                </div>
                            </div>
                            <div class="shipping-item">
                                <span class="cross-icon"><i class="fa fa-times-circle"></i></span>
                                <div class="shipping-item-image">
                                    <a href="#"><img src="${customerTemplateUrl}img/shopping-image2.jpg" alt="shopping image"></a>
                                </div>
                                <div class="shipping-item-text">
                                    <span>2 <span class="pro-quan-x">x</span> <a href="#" class="pro-cat">Women Bag</a></span>
                                    <span class="pro-quality"><a href="#">S,Gary</a></span>
                                    <p>$19.95</p>
                                </div>
                            </div>
                            <div class="shipping-total-bill">
                                <div class="cart-prices">
                                    <span class="shipping-cost">$2.00</span>
                                    <span>Shipping</span>
                                </div>
                                <div class="total-shipping-prices">
                                    <span class="shipping-total">$24.95</span>
                                    <span>Total</span>
                                </div>										
                            </div>
                            <div class="shipping-checkout-btn">
                                <a href="checkout.html">Check out <i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
            <!-- SHOPPING-CART END -->
            <!-- MAINMENU START -->
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 no-padding-right menuarea">
                <div class="mainmenu">
                    <nav>
                        <ul class="list-inline mega-menu">
                            <li><a href="/">Trang chủ</a></li>
                            <%
                                List<Category> rootCategory = new CategoryDaoImpl().getRootCategory();
                                for (Category root : rootCategory) {%>
                            <li>
                                <a href=""><%=root.getName()%></a>
                                <!-- DRODOWN-MEGA-MENU START -->
                                <div class="drodown-mega-menu">
                                    <%
                                        List<Category> childCategory = new CategoryDaoImpl().getChildCategory(root);
                                    %>
                                    <div class="left-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <%
                                                for (int i = 0; i < childCategory.size() / 2; i ++) {%>
                                            <ul>
                                                <li><a href="/product?categoryId=<%=childCategory.get(i).getId()%>"><%=childCategory.get(i).getName()%></a></li>
                                            </ul>
                                            <%}%>
                                        </div>
                                    </div>

                                    <div class="right-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <%
                                                for (int i = childCategory.size() / 2; i < childCategory.size(); i ++) {%>
                                            <ul>
                                                <li><a href="/product?categoryId=<%=childCategory.get(i).getId()%>"><%=childCategory.get(i).getName()%></a></li>
                                            </ul>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- DRODOWN-MEGA-MENU END -->
                            </li>
                            <%}%>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- MAINMENU END -->
        </div>
        <div class="row">
            <!-- MOBILE MENU START -->
            <div class="col-sm-12 mobile-menu-area">
                <div class="mobile-menu hidden-md hidden-lg" id="mob-menu" style="display: block;">
                    <span class="mobile-menu-title">MENU</span>
                    <nav>
                        <ul>
                            <li><a href="index.html">Home</a>
                                <ul>
                                    <li><a href="index.html">Home variation 1</a></li>
                                    <li><a href="index-2.html">Home variation 2</a></li>
                                </ul>														
                            </li>								
                            <li><a href="shop-gird.html">Women</a>
                                <ul>
                                    <li><a href="shop-gird.html">Tops</a>
                                        <ul>
                                            <li><a href="shop-gird.html">T-Shirts</a></li>
                                            <li><a href="shop-gird.html">Blouses</a></li>
                                        </ul>													
                                    </li>
                                    <li><a href="shop-gird.html">Dresses</a>
                                        <ul>
                                            <li><a href="shop-gird.html">Casual Dresses</a></li>
                                            <li><a href="shop-gird.html">Summer Dresses</a></li>
                                            <li><a href="shop-gird.html">Evening Dresses</a></li>	
                                        </ul>	
                                    </li>

                                </ul>
                            </li>
                            <li><a href="shop-gird.html">men</a>
                                <ul>											
                                    <li><a href="shop-gird.html">Tops</a>
                                        <ul>
                                            <li><a href="shop-gird.html">Sports</a></li>
                                            <li><a href="shop-gird.html">Day</a></li>
                                            <li><a href="shop-gird.html">Evening</a></li>
                                        </ul>														
                                    </li>
                                    <li><a href="shop-gird.html">Blouses</a>
                                        <ul>
                                            <li><a href="shop-gird.html">Handbag</a></li>
                                            <li><a href="shop-gird.html">Headphone</a></li>
                                            <li><a href="shop-gird.html">Houseware</a></li>
                                        </ul>														
                                    </li>
                                    <li><a href="shop-gird.html">Accessories</a>
                                        <ul>
                                            <li><a href="shop-gird.html">Houseware</a></li>
                                            <li><a href="shop-gird.html">Home</a></li>
                                            <li><a href="shop-gird.html">Health &amp; Beauty</a></li>
                                        </ul>														
                                    </li>
                                </ul>										
                            </li>
                            <li><a href="shop-gird.html">clothing</a></li>
                            <li><a href="shop-gird.html">tops</a></li>
                            <li><a href="shop-gird.html">T-shirts</a></li>
                            <li><a href="#">Delivery</a></li>
                            <li><a href="about-us.html">About us</a></li>
                        </ul>
                    </nav>
                </div>						
            </div>
            <!-- MOBILE MENU END -->
        </div>			
    </div>
</header>