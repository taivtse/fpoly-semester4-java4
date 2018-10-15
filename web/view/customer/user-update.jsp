<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.customerUser}">
    <c:redirect url = "${customerLoginFormUrl}"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật thông tin</title>
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
                    <div class="col-xs-3"></div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- PERSONAL-INFOMATION START -->
                        <div class="personal-infomation">
                            <form action="${customerUpdateInfoFormUrl}" class="primari-box personal-info-box" id="personalinfo" method="post">
                                <h3 class="box-subheading">Cập nhật thông tin cá nhân</h3>
                                <div class="personal-info-content">
                                    <c:if test="${not empty messageResponse}">
                                        <div class="alert alert-${alert}" role="alert">
                                            ${messageResponse}
                                        </div>
                                    </c:if>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label for="firstname">Tài khoản<sup>*</sup></label>
                                        <input required type="text" value="${sessionScope.customerUser.username}" name="username" readonly  class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label for="password">Mật khẩu <sup>*</sup></label>
                                        <input required type="password" value="${sessionScope.customerUser.password}" name="password" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Họ và tên <sup>*</sup></label>
                                        <input required type="text" value="${sessionScope.customerUser.fullname}" name="fullname" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Email<sup>*</sup></label>
                                        <input required type="email" value="${sessionScope.customerUser.email}" name="email" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Số điện thoại <sup>*</sup></label>
                                        <input required type="tel"  pattern="^0\d{9,13}" value="${sessionScope.customerUser.phone}" name="phone" class="form-control input-feild">
                                    </div>
                                    <div class="form-group primary-form-group p-info-group">
                                        <label >Địa chỉ <sup>*</sup></label>
                                        <input required type="text" value="${sessionScope.customerUser.address}" name="address" class="form-control input-feild">
                                    </div>
                                    <div class="submit-button p-info-submit-button">
                                        <button type="submit" name="action" value="register" class="btn main-btn padding-2">
                                            <span>
                                                Cập nhật
                                                <i class="fa fa-chevron-right"></i>
                                            </span>											
                                        </button>
                                        <span class="required-field"><sup>*</sup>Bắt buộc</span>
                                    </div>
                                </div>
                            </form>							
                        </div>
                        <!-- PERSONAL-INFOMATION END -->
                    </div>
                    <div class="col-xs-3"></div>
                </div>
            </div>
        </section>
        <%@include file="/common/customer/footer.jsp" %>
        <%@include file="/common/customer/bottom-embed.jsp" %>
    </body>
</html>
