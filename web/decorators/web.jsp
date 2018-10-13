<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><decorator:title default="Client page"></decorator:title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/template/web/img/favicon.png'/>">

        <!-- FONTS
        ============================================ -->	
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'> 
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bitter:400,700,400italic&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>

        <!-- animate CSS
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/animate.css'/>">				

        <!-- FANCYBOX CSS
        ============================================ -->			
        <link rel="stylesheet" href="<c:url value='/template/web/css/jquery.fancybox.css'/>">	

        <!-- BXSLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="<c:url value='/template/web/css/jquery.bxslider.css'/>">			

        <!-- MEANMENU CSS
        ============================================ -->			
        <link rel="stylesheet" href="<c:url value='/template/web/css/meanmenu.min.css'/>">	

        <!-- JQUERY-UI-SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="<c:url value='/template/web/css/jquery-ui-slider.css'/>">		

        <!-- NIVO SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="<c:url value='/template/web/css/nivo-slider.css'/>">

        <!-- OWL CAROUSEL CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="<c:url value='/template/web/css/owl.carousel.css'/>">

        <!-- OWL CAROUSEL THEME CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="<c:url value='/template/web/css/owl.theme.css'/>">

        <!-- BOOTSTRAP CSS 
        ============================================ -->	
        <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap.min.css'/>">

        <!-- FONT AWESOME CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/font-awesome.min.css'/>">

        <!-- NORMALIZE CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/normalize.css'/>">

        <!-- MAIN CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/main.css'/>">

        <!-- STYLE CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/style.css'/>">

        <!-- RESPONSIVE CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/responsive.css'/>">

        <!-- IE CSS 
        ============================================ -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/ie.css'/>">

        <!-- MODERNIZR JS 
        ============================================ -->
        <script src="<c:url value='/template/web/js/vendor/modernizr-2.6.2.min.js'/>"></script>
    </head>
    <body>
        <%@include file="/common/web/header.jsp" %>
    <decorator:body></decorator:body>
        <%@include file="/common/web/footer.jsp" %>
    <!-- JS 
===============================================-->
    <!-- jquery js -->
    <script src="<c:url value='/template/web/js/vendor/jquery-1.11.3.min.js'/>"></script>

    <!-- fancybox js -->
    <script src="<c:url value='/template/web/js/jquery.fancybox.js'/>"></script>

    <!-- bxslider js -->
    <script src="<c:url value='/template/web/js/jquery.bxslider.min.js'/>"></script>

    <!-- meanmenu js -->
    <script src="<c:url value='/template/web/js/jquery.meanmenu.js'/>"></script>

    <!-- owl carousel js -->
    <script src="<c:url value='/template/web/js/owl.carousel.min.js'/>"></script>

    <!-- nivo slider js -->
    <script src="<c:url value='/template/web/js/jquery.nivo.slider.js'/>"></script>

    <!-- jqueryui js -->
    <script src="<c:url value='/template/web/js/jqueryui.js'/>"></script>

    <!-- bootstrap js -->
    <script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>

    <!-- wow js -->
    <script src="<c:url value='/template/web/js/wow.js'/>"></script>		
    <script>
        new WOW().init();
    </script>

    <!-- Google Map js -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>	
    <script>
        function initialize() {
            var mapOptions = {
                zoom: 8,
                scrollwheel: false,
                center: new google.maps.LatLng(35.149868, -90.046678)
            };
            var map = new google.maps.Map(document.getElementById('googleMap'),
                    mapOptions);
            var marker = new google.maps.Marker({
                position: map.getCenter(),
                map: map
            });

        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <!-- main js -->
    <script src="<c:url value='/template/web/js/main.js'/>"></script>
</body>
</html>
