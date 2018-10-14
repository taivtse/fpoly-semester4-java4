<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
    </head>
    <body>
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="index.html">HOMe</a>
                            <span><i class="fa fa-caret-right	"></i></span>
                            <span>Authentication</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h2 class="page-title">Create an account</h2>
                    </div>	
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- PERSONAL-INFOMATION START -->
                        <div class="personal-infomation">
                            <form class="primari-box personal-info-box" id="personalinfo" method="post" action="/client/register">
                                <h3 class="box-subheading">Your personal information</h3>
                                <div class="personal-info-content">
                                    <div class="form-group primary-form-group p-info-group">
                                        <label for="firstname">Username<sup>*</sup></label>
                                        <input type="text" value="" name="username"  class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label for="password">Password <sup>*</sup></label>
                                        <input type="password" value="" name="password" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Fullname <sup>*</sup></label>
                                        <input type="text" value="" name="fullname" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Email<sup>*</sup></label>
                                        <input type="text" value="" name="email" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Phone number <sup>*</sup></label>
                                        <input type="text" value="" name="phone" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Address <sup>*</sup></label>
                                        <input type="text" value="" name="address" class="form-control input-feild">
                                    </div>
                                    <div class="submit-button p-info-submit-button">
                                        <button type="submit" name="action" value="register" class="btn main-btn padding-2" style="display: inline-block; padding: 8px 15px">
                                            <span>
                                                Register
                                                <i class="fa fa-chevron-right"></i>
                                            </span>											
                                        </button>
                                        <span class="required-field"><sup>*</sup>Required field</span>
                                    </div>
                                </div>
                            </form>							
                        </div>
                        <!-- PERSONAL-INFOMATION END -->
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
