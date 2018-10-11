<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title><decorator:title default="Admin page"></decorator:title></title>

            <meta name="description" content="" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

            <!-- Favicon -->
            <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/template/admin/favicon.ico'/>">

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css'/>" />
        <link rel="stylesheet" href="<c:url value='/template/admin/assets/font-awesome/4.2.0/css/font-awesome.min.css'/>" />

        <!-- text fonts -->
        <link rel="stylesheet" href="<c:url value='/template/admin/assets/fonts/fonts.googleapis.com.css'/>" />

        <!-- ace styles -->
        <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style'/>" />

        <!-- ace settings handler -->
        <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js'/>"></script>
        <decorator:head></decorator:head>
        </head>
        <body class="no-skin">
        <%@include file="/common/admin/navbar.jsp" %>
        <div class="main-container" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.check('main-container', 'fixed')
                } catch (e) {
                }
            </script>
            <%@include file="/common/admin/sidebar.jsp" %>
            <decorator:body></decorator:body>
            <%@include file="/common/admin/footer.jsp" %>
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>

        <!-- basic scripts -->
        <script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>

        <!-- ace scripts -->
        <script src="<c:url value='/template/admin/assets/js/ace-elements.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/ace.min.js'/>"></script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
                jQuery(function ($) {
                    $(document).on('click', '.toolbar a[data-target]', function (e) {
                        e.preventDefault();
                        var target = $(this).data('target');
                        $('.widget-box.visible').removeClass('visible');//hide others
                        $(target).addClass('visible');//show target
                    });
                });
        </script>
        <decorator:getProperty property="page.bottom_javascript"></decorator:getProperty>
</body>
</html>
