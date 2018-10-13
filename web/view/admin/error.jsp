<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Error</title>
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
                            <!-- PAGE CONTENT BEGINS -->

                            <div class="error-container">
                                <div class="well">
                                    <h1 class="grey lighter smaller">
                                        <span class="blue bigger-125">
                                            <i class="ace-icon fa fa-sitemap"></i>
                                            Đã xảy ra lỗi
                                        </span>
                                    </h1>

                                    <hr />
                                    <h3 class="lighter smaller">${requestScope.messageError}</h3>
                                    <hr />
                                    <div class="space"></div>

                                    <div class="center">
                                        <a href="javascript:history.back()" class="btn btn-grey">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            Go Back
                                        </a>

                                        <a href="/admin/home" class="btn btn-primary">
                                            <i class="ace-icon fa fa-tachometer"></i>
                                            Dashboard
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- PAGE CONTENT ENDS -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <%@include file="/common/admin/footer.jsp" %>
        <%@include file="/common/admin/bottom-embed.jsp" %>
    </body>
</html>
