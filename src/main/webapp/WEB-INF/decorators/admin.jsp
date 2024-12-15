<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<!--<![endif]-->


<!-- Mirrored from themesflat.co/html/remos/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Nov 2024 14:31:56 GMT -->
<head>
<style>
.product-item {
    display: flex;
    justify-content: space-between;  /* Căn đều các cột */
    align-items: center;  /* Căn giữa theo chiều dọc */
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.product-item .flex-grow {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.product-item .name {
    width: 20%;  /* Đặt chiều rộng cho từng cột */
}

.product-item .body-text {
    width: 15%;  /* Đặt chiều rộng cho từng cột */
    text-align: center;  /* Căn giữa văn bản */
}

.product-item select {
    width: 80%;  /* Chiều rộng cho dropdown */
    padding: 5px;
}

.product-item .list-icon-function {
    display: flex;
    gap: 10px;
}

.product-item .item {
    cursor: pointer;
}
</style>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>Remos eCommerce Admin Dashboard HTML Template</title>

    <meta name="author" content="themesflat.com">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="css/animation.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">



    <!-- Font -->
    <link rel="stylesheet" href="font/fonts.css">

    <!-- Icon -->
    <link rel="stylesheet" href="icon/style.css">

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="images/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="images/favicon.png">


</head>

<body class="body">

    <!-- #wrapper -->
    <div id="wrapper">
        <!-- #page -->
        <div id="page" class="">
            <!-- layout-wrap -->
           <div class="layout-wrap">
                <!-- preload -->
                <div class="section-content-right">
<%--                 <%@include file="/common/admin/header.jsp"%> --%>
		<%@include file ="/common/admin/left-section.jsp"%>
		<sitemesh:write property="body" />
			</div>
		
	</div>
	</div>
	
		
	</div>
	
	
	
 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/zoom.js"></script>
    <script src="js/apexcharts/apexcharts.js"></script>
    <script src="js/apexcharts/line-chart-1.js"></script>
    <script src="js/apexcharts/line-chart-2.js"></script>
    <script src="js/apexcharts/line-chart-3.js"></script>
    <script src="js/apexcharts/line-chart-4.js"></script>
    <script src="js/apexcharts/line-chart-5.js"></script>
    <script src="js/apexcharts/line-chart-6.js"></script>
    <script src="js/switcher.js"></script>
    <script src="js/theme-settings.js"></script>
    <script src="js/main.js"></script>
   
    
</body>

