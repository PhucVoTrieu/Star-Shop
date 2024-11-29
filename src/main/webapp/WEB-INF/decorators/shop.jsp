 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<!-- HEAD START -->
<head>
	 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<title><sitemesh:write property="title"/></title>
	 <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png">

    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css"> -->

    <!-- Icon Font CSS -->
    <!-- <link rel="stylesheet" href="assets/css/vendor/plazaicon.css">
    <link rel="stylesheet" href="assets/css/vendor/themify-icons.css">
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css"> -->

    <!-- Plugins CSS -->
    <!-- <link rel="stylesheet" href="assets/css/plugins/animate.css">
    <link rel="stylesheet" href="assets/css/plugins/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/plugins/select2.min.css"> -->

    <!-- Helper CSS -->
    <!-- <link rel="stylesheet" href="assets/css/helper.css"> -->

    <!-- Main Style CSS -->
    <!-- <link rel="stylesheet" href="assets/css/style.css"> -->


    <!--====== Use the minified version files listed below for better performance and remove the files listed above ======-->
    <link rel="stylesheet" href="assets/css/plugins-min/plugins.min.css">
    <link rel="stylesheet" href="assets/css/style.min.css">

</head>
<!-- Head END -->
<body class="ecommerce">
	
    <%@include file="/common/header.jsp"%>
    
	<sitemesh:write property="body" />
	
	<div>
		<%@include file="/common/footer.jsp"%>
	</div>
	
	<script src="/frontend/pages/scripts/checkout.js" type="text/javascript"></script>

	
	<script>
    function updateQuantity(cartItemId, newQuantity) {
        fetch('cart/updateQuantity', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                cartItemId: cartItemId,
                quantity: newQuantity
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                //alert('Quantity updated successfully!');
                // Optionally, update the total price dynamically
                location.reload(); // Reload to reflect new total
            } else {
                alert('Failed to update quantity: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Something went wrong! Please try again.');
        });
    }
    document.addEventListener('DOMContentLoaded', function () {
        console.log("DOM fully loaded and parsed");
    });

    function decrement(id) {
        let input = document.getElementById("product-quantity-" + id);

        if (input && input.value > 1) {
            input.value--; // Giảm số lượng
            updateQuantity(id, input.value); // Cập nhật số lượng
        }
    }


    function increment(id) {
    	let input = document.getElementById("product-quantity-" + id);
        input.value++;
        updateQuantity(id, input.value);
    }
</script>

	

	<script src="/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
    <script src="/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>pop up
    <script src="/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
    <script src='/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
    <script src="/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

    <script src="/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        jQuery(document).ready(function() {
            /* Layout.init(); */    
            Layout.initOWL();
            Layout.initTwitter();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initUniform();
            Layout.initSliderRange();
        });
    </script>
</body>
</html>