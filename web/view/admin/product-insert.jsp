<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:if test="${empty sessionScope.user}">
    <c:redirect url = "/view/admin/login.jsp"/>
</c:if>
<c:url var="insertFormUrl" value="/admin/product/insert"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title><fmt:message key="label.admin.title" bundle="${lang}"/></title>
        <style>
            .product-small-item{
                width: 80px!important;
            }

            .table > tbody > tr > td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
                        try {
                            ace.settings.check('breadcrumbs', 'fixed')
                        } catch (e) {
                        }
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                        </li>

                        <li>
                            <a href="#">Sản phẩm</a>
                        </li>
                        <li class="active">Thêm mới</li>
                    </ul><!-- /.breadcrumb -->

                    <div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off">
                                <i class="ace-icon fa fa-search nav-search-icon"></i>
                            </span>
                        </form>
                    </div><!-- /.nav-search -->
                </div>

                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="header smaller lighter blue" style="display: block;">Thêm mới sản phẩm</h3>
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="hr hr-18 dotted hr-double"></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <form class="form-horizontal" role="form" action="insertFormUrl" method="POST">
                                        <div class="row">
                                            <div class="col-xs-6 text-left">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Tên sản phẩm</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" name="name" class="col-xs-12">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Giá bán</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" name="price" class="col-xs-12">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Số lượng</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" name="quantity" class="col-xs-12">
                                                    </div>
                                                </div>

                                                <div>
                                                    <label for="form-field-select-3">Chosen</label>

                                                    <br>
                                                    <select class="chosen-select form-control" id="form-field-select-3" data-placeholder="Choose a State..." style="display: none;">
                                                        <option value="">  </option>
                                                        <option value="AL">Alabama</option>
                                                    </select>
                                                    <div class="chosen-container chosen-container-single" style="width: 308px;" title="" id="form_field_select_3_chosen">
                                                        <a class="chosen-single chosen-default" tabindex="-1">
                                                            <span>Choose a State...</span>
                                                            <div><b></b></div>
                                                        </a>
                                                        <div class="chosen-drop">
                                                            <div class="chosen-search"><input type="text" autocomplete="off"></div>
                                                            <ul class="chosen-results">
                                                                <li class="active-result" data-option-array-index="1" style="">Alabama</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <input type="hidden" name="description">
                                                <div class="wysiwyg-editor" id="editor" contenteditable="true"></div>
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
    <content tag="bottom_javascript">
        <!-- page specific plugin scripts -->
        <script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/markdown.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/bootstrap-markdown.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/jquery.hotkeys.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/bootstrap-wysiwyg.min.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/js/bootbox.min.js'/>"></script>

        <script type="text/javascript">
                        jQuery(function ($) {

                            function showErrorAlert(reason, detail) {
                                var msg = '';
                                if (reason === 'unsupported-file-type') {
                                    msg = "Unsupported format " + detail;
                                } else {
                                    //console.log("error uploading file", reason, detail);
                                }
                                $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                        '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
                            }

                            //$('#editor').ace_wysiwyg();//this will create the default editor will all buttons

                            //but we want to change a few buttons colors for the third style
                            $('#editor').ace_wysiwyg({
                                toolbar:
                                        [
                                            'font',
                                            null,
                                            'fontSize',
                                            null,
                                            {name: 'bold', className: 'btn-info'},
                                            {name: 'italic', className: 'btn-info'},
                                            {name: 'strikethrough', className: 'btn-info'},
                                            {name: 'underline', className: 'btn-info'},
                                            null,
                                            {name: 'insertunorderedlist', className: 'btn-success'},
                                            {name: 'insertorderedlist', className: 'btn-success'},
                                            {name: 'outdent', className: 'btn-purple'},
                                            {name: 'indent', className: 'btn-purple'},
                                            null,
                                            {name: 'justifyleft', className: 'btn-primary'},
                                            {name: 'justifycenter', className: 'btn-primary'},
                                            {name: 'justifyright', className: 'btn-primary'},
                                            {name: 'justifyfull', className: 'btn-inverse'},
                                            null,
                                            {name: 'createLink', className: 'btn-pink'},
                                            {name: 'unlink', className: 'btn-pink'},
                                            null,
                                            {name: 'insertImage', className: 'btn-success'},
                                            null,
                                            'foreColor',
                                            null,
                                            {name: 'undo', className: 'btn-grey'},
                                            {name: 'redo', className: 'btn-grey'}
                                        ],
                                'wysiwyg': {
                                    fileUploadError: showErrorAlert
                                }
                            }).prev().addClass('wysiwyg-style2');


                            /**
                             //make the editor have all the available height
                             $(window).on('resize.editor', function() {
                             var offset = $('#editor').parent().offset();
                             var winHeight =  $(this).height();
                             
                             $('#editor').css({'height':winHeight - offset.top - 10, 'max-height': 'none'});
                             }).triggerHandler('resize.editor');
                             */

                            //RESIZE IMAGE

                            //Add Image Resize Functionality to Chrome and Safari
                            //webkit browsers don't have image resize functionality when content is editable
                            //so let's add something using jQuery UI resizable
                            //another option would be opening a dialog for user to enter dimensions.
                            if (typeof jQuery.ui !== 'undefined' && ace.vars['webkit']) {

                                var lastResizableImg = null;
                                function destroyResizable() {
                                    if (lastResizableImg == null)
                                        return;
                                    lastResizableImg.resizable("destroy");
                                    lastResizableImg.removeData('resizable');
                                    lastResizableImg = null;
                                }

                                var enableImageResize = function () {
                                    $('.wysiwyg-editor')
                                            .on('mousedown', function (e) {
                                                var target = $(e.target);
                                                if (e.target instanceof HTMLImageElement) {
                                                    if (!target.data('resizable')) {
                                                        target.resizable({
                                                            aspectRatio: e.target.width / e.target.height,
                                                        });
                                                        target.data('resizable', true);

                                                        if (lastResizableImg != null) {
                                                            //disable previous resizable image
                                                            lastResizableImg.resizable("destroy");
                                                            lastResizableImg.removeData('resizable');
                                                        }
                                                        lastResizableImg = target;
                                                    }
                                                }
                                            })
                                            .on('click', function (e) {
                                                if (lastResizableImg != null && !(e.target instanceof HTMLImageElement)) {
                                                    destroyResizable();
                                                }
                                            })
                                            .on('keydown', function () {
                                                destroyResizable();
                                            });
                                }

                                enableImageResize();

                                /**
                                 //or we can load the jQuery UI dynamically only if needed
                                 if (typeof jQuery.ui !== 'undefined') enableImageResize();
                                 else {//load jQuery UI if not loaded
                                 //in Ace demo dist will be replaced by correct assets path
                                 $.getScript("assets/js/jquery-ui.custom.min.js", function(data, textStatus, jqxhr) {
                                 enableImageResize()
                                 });
                                 }
                                 */
                            }


                        });
        </script>
    </content>
</body>
</html>