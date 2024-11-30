<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!--Empty Cart Start-->
        <div class="empty-cart-page section-padding-5">
            <div class="container">
                <div class="empty-cart-content text-center">
                    <h2 class="empty-cart-title">Shopping Cart</h2>
                    <div class="empty-cart-img">
                        <img src="assets/images/cart.png" alt="">
                    </div>
                    <p>Your cart is currently empty!</p>
                    <a href="${pageContext.request.contextPath}/buyer/products" class="btn btn-primary"><i class="fa fa-angle-left"></i> Continue browsing</a>
                </div>
            </div>
        </div>
        <!--Empty Cart End-->