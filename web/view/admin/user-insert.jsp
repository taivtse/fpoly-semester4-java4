<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.adminUser}">
    <c:redirect url = "${adminLoginFormUrl}"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Insert user</title>
        <%@include file="/common/admin/top-embed.jsp" %>
    </head>
    <body class="no-skin">
        <%@include file="/common/admin/navbar.jsp" %>
        <%@include file="/common/admin/sidebar.jsp" %>
        <div class="main-content">
            <div class="main-content-inner">
                <%@include file="/common/admin/breadcrumb.jsp" %>
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue" style="display: block;">Thêm mới người dùng</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <form class="form-horizontal" role="form" action="${userInsertFormUrl}" method="POST">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Tài khoản</label>
                                            <div class="col-sm-6">
                                                <input required type="text" name="username" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Mật khẩu</label>
                                            <div class="col-sm-6">
                                                <input required type="password" name="password" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Họ và tên</label>
                                            <div class="col-sm-6">
                                                <input required type="text" name="fullname" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Email</label>
                                            <div class="col-sm-6">
                                                <input required type="email" name="email" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Số điện thoại</label>
                                            <div class="col-sm-6">
                                                <input required type="tel" name="phone" pattern="^0\d{9,13}" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Địa chỉ</label>
                                            <div class="col-sm-6">
                                                <input required type="text" name="address" class="col-xs-12">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Vai trò</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="roleId" required>
                                                    <c:forEach var="role" items="<%=roles%>">
                                                        <option value="${role.id}">${role.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"></label>
                                            <div class="col-sm-6 text-right">
                                                <button type="submit" class="btn btn-sm btn-primary">Thêm người dùng</button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!-- /.span -->
                            </div><!-- /.row -->
                            <div class="hr hr-18 dotted hr-double"></div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.page-content -->
            </div>
        </div>
        <%@include file="/common/admin/footer.jsp" %>
        <%@include file="/common/admin/bottom-embed.jsp" %>
        <script type='text/javascript'>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('#image_url').onchange = changeImageFile;
            }, false);
            function changeImageFile(event) {
                var imageshow = document.querySelector('#product-image');
                imageshow.src = URL.createObjectURL(event.target.files[0])
            }
        </script>
    </body>
</html>