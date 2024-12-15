
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<!-- HEAD START -->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title><sitemesh:write property="title" /></title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.png">

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
<style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 2000px; /* Để mô phỏng một trang dài */
        }

        .sticky-button {
            position: fixed; /* Cố định vị trí nút */
            bottom: 20px; /* Cách đáy trang 20px */
            right: 20px; /* Cách phải 20px */
            background-color: #28a745; /* Màu nền nút */
            color: white; /* Màu chữ */
            text-decoration: none; /* Loại bỏ gạch chân */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng */
            transition: transform 0.2s, background-color 0.3s;
        }

        .sticky-button:hover {
            background-color: #218838; /* Đổi màu khi hover */
            transform: scale(1.1); /* Phóng to nhẹ khi hover */
        }
    
</style>
<style>
.header-search form {
    display: flex; /* Đưa input và button vào một hàng ngang */
    align-items: center; /* Canh giữa theo chiều dọc */
}
.header-search button {
    background-color: #f0f0f0; /* Màu nền nút */
    border: 1px solid #ccc; /* Viền */
    padding: 5px 8px; /* Kích thước nút */
    cursor: pointer; /* Biến chuột thành dạng nhấn */
}

.header-search input {
    border: 1px solid #ccc; /* Viền cho ô input */
    padding: 8px; /* Khoảng cách bên trong */
    flex: 1; /* Ô input mở rộng để chiếm hết không gian trống */
}
</style>
<style>
.product-image img {
    width: 100%; /* Hoặc một giá trị cụ thể, ví dụ: 300px */
    height: 250px; /* Đặt chiều cao cố định */
    object-fit: cover; /* Giữ ảnh cân đối trong khung */
    border-radius: 8px; /* Tùy chọn: bo góc cho ảnh */
}
</style>
<style>
    #toast-notification {
        animation: fadeOut 2s forwards 2.5s; /* Tự động ẩn sau 2.5 giây */
    }

    @keyframes fadeOut {
        0% {
            opacity: 1;
        }
        100% {
            opacity: 0;
        }
    }
</style>

</head>
<!-- Head END -->
<body>
	<div class="main-wrapper">
		<%@include file="/common/buyer/header.jsp"%>

		<sitemesh:write property="body" />

		<div>
			<%@include file="/common/buyer/footer.jsp"%>
		</div>
	</div>
<!-- Toast Notification -->
<div id="toast-notification" style="
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #4CAF50;
    color: white;
    padding: 15px 20px;
    border-radius: 5px;
    font-size: 16px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    z-index: 9999;
    text-align: center;">
    Thêm sản phẩm vào giỏ hàng thành công!
</div>

	<script>
	function updateQuantity(cartItemId, newQuantity) {
	    // Kiểm tra nếu quantity <= 0
	    if (newQuantity <= 0) {
	        alert('Quantity must be at least 1.');
	        return; // Dừng hàm nếu quantity không hợp lệ
	    }

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



	<!-- Modernizer JS -->
	<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
	<!-- jQuery JS -->
	<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Bootstrap JS -->
	<!-- <script src="assets/js/vendor/popper.min.js"></script>
    <script src="assets/js/vendor/bootstrap.min.js"></script> -->

	<!-- Plugins JS -->
	<!-- <script src="assets/js/plugins/swiper-bundle.min.js"></script>
    <script src="assets/js/plugins/jquery.countdown.min.js"></script>
    <script src="assets/js/plugins/jquery.elevateZoom.min.js"></script>
    <script src="assets/js/plugins/select2.min.js"></script>
    <script src="assets/js/plugins/ajax-contact.js"></script> -->


	<!--====== Use the minified version files listed below for better performance and remove the files listed above ======-->
	<script src="assets/js/plugins.min.js"></script>

	<!-- Main JS -->
	<script src="assets/js/main.js"></script>

<script>

$(document).ready(function () {
    $('.add-to-compare-btn').click(function (e) {
        e.preventDefault(); // Ngăn chặn reload trang
        
        let productId = $(this).data('product-id'); // Lấy productID
        
        $.ajax({
            url: "/buyer/product-compare/addCompareItem", // URL gọi API
            method: "GET",
            data: { productID: productId },
            success: function (response) {
                if (response.success) {
                    // Hiển thị toast notification
                    showToast("Thêm sản phẩm vào danh sách so sánh thành công!");
                } else {
                    // Hiển thị thông báo lỗi
                    showToast("Thêm sản phẩm vào danh sách so sánh thành công!");
                }
            },
            error: function () {
                // Hiển thị lỗi hệ thống
                showToast("Có lỗi xảy ra khi thêm sản phẩm vào danh sách so sánh!", "error");
            }
        });
    });
    
    // Hàm hiển thị Toast Notification
    function showToast(message, type = "success") {
        let toast = $('#toast-notification');
        toast.text(message); // Cập nhật nội dung thông báo

        if (type === "error") {
            toast.css("background-color", "#f44336"); // Màu đỏ cho lỗi
        } else {
            toast.css("background-color", "#4CAF50"); // Màu xanh cho thành công
        }

        toast.fadeIn(); // Hiển thị thông báo
        setTimeout(() => {
            toast.fadeOut(); // Tự động ẩn sau 2.5 giây
        }, 2500);
    }
});


</script>
<script>
$(document).ready(function () {
    $('.add-to-cart-btn-product-detail').click(function (e) {
        e.preventDefault(); // Ngăn chặn reload trang
        
        let productId = $(this).data('product-id'); // Lấy productID
        let quantity = $(this).closest('.product-action').siblings('.product-quantity').find('.quantity-input').val(); // Lấy quantity

        $.ajax({
            url: "/buyer/cart/addMultiCartItem", // Đường dẫn đúng
            method: "GET",
            data: { 
                productID: productId, 
                productQuantity: quantity // Gửi quantity
            },
            success: function (response) {
                if (response.success) {
                    // Hiển thị toast notification
                    alert("thanh cong");
                    console.log("Event triggered for .add-to-cart-btn-product-detail");
                    showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                } else {
                    // Hiển thị lỗi (tùy chọn)
                	showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                }
            },
            error: function () {
                // Hiển thị lỗi hệ thống
                   alert("thanh cong");
                   console.log("Event triggered for .add-to-cart-btn-product-detail");
                showToast("Có lỗi xảy ra khi thêm sản phẩm!", "error");
            }
        });
    });
    function showToast(message, type = "success") {
        let toast = $('#toast-notification');
        toast.text(message); // Cập nhật nội dung thông báo

        if (type === "error") {
            toast.css("background-color", "#f44336"); // Màu đỏ cho lỗi
        } else {
            toast.css("background-color", "#4CAF50"); // Màu xanh cho thành công
        }

        toast.fadeIn(); // Hiển thị thông báo
        setTimeout(() => {
            toast.fadeOut(); // Tự động ẩn sau 2.5 giây
        }, 2500);
    }
});




$(document).ready(function () {
    $('.add-to-cart-btn').click(function (e) {
        e.preventDefault(); // Ngăn chặn reload trang
        
        let productId = $(this).data('product-id'); // Lấy productID
        
        $.ajax({
            url: "/buyer/cart/addCartItem",
            method: "GET",
            data: { productID: productId },
            success: function (response) {
                if (response.success) {
                    // Hiển thị toast notification
                    showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                } else {
                    // Hiển thị lỗi (tùy chọn)
                    showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                }
            },
            error: function () {
                // Hiển thị lỗi hệ thống
                showToast("Có lỗi xảy ra khi thêm sản phẩm!", "error");
            }
        });
    });
    
    // Hàm hiển thị Toast Notification
    function showToast(message, type = "success") {
        let toast = $('#toast-notification');
        toast.text(message); // Cập nhật nội dung thông báo

        if (type === "error") {
            toast.css("background-color", "#f44336"); // Màu đỏ cho lỗi
        } else {
            toast.css("background-color", "#4CAF50"); // Màu xanh cho thành công
        }

        toast.fadeIn(); // Hiển thị thông báo
        setTimeout(() => {
            toast.fadeOut(); // Tự động ẩn sau 2.5 giây
        }, 2500);
    }
});

</script>

<script>
$(document).ready(function () {
    $('.add-to-cart-btn-product-compare').click(function (e) {
        e.preventDefault(); // Ngăn chặn reload trang
        
        let productId = $(this).data('product-id'); // Lấy productID
        
        $.ajax({
            url: "/buyer/cart/addCartItem",
            method: "GET",
            data: { productID: productId },
            success: function (response) {
                if (response.success) {
                    // Hiển thị toast notification
                    showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                } else {
                    // Hiển thị lỗi (tùy chọn)
                    showToast("Thêm sản phẩm vào giỏ hàng thành công!");
                }
            },
            error: function () {
                // Hiển thị lỗi hệ thống
                showToast("Có lỗi xảy ra khi thêm sản phẩm!", "error");
            }
        });
    });
    
    // Hàm hiển thị Toast Notification
    function showToast(message, type = "success") {
        let toast = $('#toast-notification');
        toast.text(message); // Cập nhật nội dung thông báo

        if (type === "error") {
            toast.css("background-color", "#f44336"); // Màu đỏ cho lỗi
        } else {
            toast.css("background-color", "#4CAF50"); // Màu xanh cho thành công
        }

        toast.fadeIn(); // Hiển thị thông báo
        setTimeout(() => {
            toast.fadeOut(); // Tự động ẩn sau 2.5 giây
        }, 2500);
    }
});


</script>

<script>
    $(document).ready(function () {
        $('.delete-cart-item-btn').click(function () {
            const url = $(this).data('href'); // Lấy URL từ data-href
            window.location.href = url; // Chuyển hướng trình duyệt
        });
    });
</script>

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
    
          <script>
    document.getElementById("logoutLink").addEventListener("click", async function (e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

        try {
            const response = await fetch(`${pageContext.request.contextPath}/auth/logout`, {
                method: 'POST',
                credentials: 'include', // Gửi cookie JWT kèm theo request
            });

            if (response.ok) {
                // Xóa JWT token khỏi trình duyệt (nếu cần)
                document.cookie = "jwtToken=; path=/; max-age=0";

                // Chuyển hướng về trang đăng nhập
                window.location.href = `${pageContext.request.contextPath}/login`;
            } else {
                alert("Logout failed!");
            }
        } catch (error) {
            console.error("Error during logout:", error);
            alert("An error occurred during logout. Please try again.");
        }
    });
</script>
          
    
</body>
</html>