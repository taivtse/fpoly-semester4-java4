<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
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
                        <h2 class="page-title">Đăng nhập / Đăng ký</h2>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- CREATE-NEW-ACCOUNT START -->
                        <div class="create-new-account">
                            <form class="new-account-box primari-box" id="create-new-account" method="post" action="#">
                                <h3 class="box-subheading">Create an account</h3>
                                <div class="form-content">
                                    <div class="submit-button">
                                        <a href="/register" id="SubmitCreate" class="btn main-btn">
                                            <span>
                                                <i class="fa fa-user submit-icon"></i>
                                                Create an account
                                            </span>											
                                        </a>
                                    </div>
                                </div>
                            </form>							
                        </div>
                        <!-- CREATE-NEW-ACCOUNT END -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- REGISTERED-ACCOUNT START -->
                        <div class="primari-box registered-account">
                            <form action="${customerLoginFormUrl}" class="new-account-box" id="accountLogin" method="post">
                                <h3 class="box-subheading">Đăng nhập</h3>
                                <div class="form-content">
                                    <c:if test="${not empty messageResponse}">
                                        <div class="alert alert-${alert}" role="alert">
                                            ${messageResponse}
                                        </div>
                                    </c:if>
                                    <div class="form-group primary-form-group">
                                        <label for="loginemail">Tài khoản</label>
                                        <input type="text" value="" name="username" id="loginemail" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" value="" name="password" id="password" class="form-control input-feild">
                                    </div>
                                    <div class="forget-password">
                                        <p><a href="#">Quên mật khẩu?</a></p>
                                    </div>
                                    <div class="submit-button">
                                        <button type="submit" class="btn main-btn padding-2">
                                            <span>
                                                <i class="fa fa-lock submit-icon"></i>
                                                Đăng nhập
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </form>							
                        </div>
                        <!-- REGISTERED-ACCOUNT END -->
                    </div>
                </div>
            </div>
        </section>
        <%@include file="/common/customer/footer.jsp" %>
        <%@include file="/common/customer/bottom-embed.jsp" %>
    </body>
</html>
