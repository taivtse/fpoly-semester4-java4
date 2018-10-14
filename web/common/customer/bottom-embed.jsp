<!-- JS 
===============================================-->
<!-- jquery js -->
<script src="${customerTemplateUrl}js/vendor/jquery-1.11.3.min.js"></script>

<!-- fancybox js -->
<script src="${customerTemplateUrl}js/jquery.fancybox.js"></script>

<!-- bxslider js -->
<script src="${customerTemplateUrl}js/jquery.bxslider.min.js"></script>

<!-- meanmenu js -->
<script src="${customerTemplateUrl}js/jquery.meanmenu.js"></script>

<!-- owl carousel js -->
<script src="${customerTemplateUrl}js/owl.carousel.min.js"></script>

<!-- nivo slider js -->
<script src="${customerTemplateUrl}js/jquery.nivo.slider.js"></script>

<!-- jqueryui js -->
<script src="${customerTemplateUrl}js/jqueryui.js"></script>

<!-- bootstrap js -->
<script src="${customerTemplateUrl}js/bootstrap.min.js"></script>

<!-- wow js -->
<script src="${customerTemplateUrl}js/wow.js"></script>		
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
<script src="${customerTemplateUrl}js/main.js"></script>