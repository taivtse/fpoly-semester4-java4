<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body>
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="index.html">HOMe</a>
                            <span><i class="fa fa-caret-right"></i></span>
                            <span>Sign in / Register</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h2 class="page-title">Sign in / Register</h2>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- CREATE-NEW-ACCOUNT START -->
                        <div class="create-new-account">
                            <form class="new-account-box primari-box" id="create-new-account" method="post" action="#">
                                <h3 class="box-subheading">Create an account</h3>
                                <div class="form-content">
                                    <div class="submit-button">
                                        <a href="/client/register" id="SubmitCreate" class="btn main-btn">
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
                            <form class="new-account-box" id="accountLogin" method="post" action="/client/login">
                                <h3 class="box-subheading">Already registered?</h3>
                                <div class="form-content">
                                    <div class="form-group primary-form-group">
                                        <label for="loginemail">Username</label>
                                        <input type="text" value="" name="username" id="loginemail" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group">
                                        <label for="password">Password</label>
                                        <input type="password" value="" name="password" id="password" class="form-control input-feild">
                                    </div>
                                    <div class="forget-password">
                                        <p><a href="#">Forgot your password?</a></p>
                                    </div>
                                    <div class="submit-button">
                                        <button type="submit" name="action" value="login" class="btn main-btn padding-2" style="display: inline-block; padding: 8px 15px">Sign in</button>
                                    </div>
                                </div>
                            </form>							
                        </div>
                        <!-- REGISTERED-ACCOUNT END -->
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
