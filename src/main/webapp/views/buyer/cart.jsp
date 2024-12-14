<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!--Cart Start-->
        <div class="cart-page section-padding-5">
            <div class="container">
                <div class="cart-table table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="image">Image</th>
                                <th class="product">Product</th>
                                <th class="price">Price</th>
                                <th class="quantity">Quantity</th>
                                <th class="total">Total</th>
                                <th class="remove">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                         <c:set var="subTotal" value="0.0" />
                            <c:forEach var="cartItem" items="${listCartItem}">
            <tr>
                <!-- Product Image -->
                <td class="image">
                    <img src="${cartItem.product.imageUrl}" alt="${cartItem.product.name}">
                </td>
                <!-- Product Name -->
                <td class="product">
                    <a href="shop-single.html">${cartItem.product.name}</a>
                </td>
                <!-- Product Price -->
                <td class="price">
                    <span class="amount">${cartItem.product.price}</span>
                </td>
                <!-- Quantity -->
                <td class="quantity">
                    <form action="#">
                        <div class="quantity d-inline-flex">
                            <button type="button" class="sub" onclick="updateQuantity(${cartItem.id}, ${cartItem.quantity}-1)"><i class="ti-minus"></i></button>
                            <input type="text" value="${cartItem.quantity}" />
                            <button type="button" class="add" onclick="updateQuantity(${cartItem.id}, ${cartItem.quantity}+1)"><i class="ti-plus"></i></button>
                        </div>
                    </form>
                </td>
                <!-- Total Price -->
                <td class="total">
                    <span class="total-amount">${cartItem.product.price * cartItem.quantity}</span>
                </td>
                <!-- Remove Item -->
                <td class="remove">
             
                    <button class="delete-cart-item-btn" 
        data-href="${pageContext.request.contextPath}/buyer/cart/deleteCartItem?cartItemID=${cartItem.id}">
    <i class="ti-close"></i>
</button>

                </td>
            </tr>
             <c:set var="subTotal" value="${subTotal + cartItem.product.price * cartItem.quantity}" />
           
        </c:forEach>
                            
                        </tbody>
                    </table>
                </div>
                <div class="cart-btn">
                    <div class="cart-btn-left">
                         <a href="${pageContext.request.contextPath}/buyer/products" class="btn btn-primary">Continue Shopping</a>
                    </div>
                    <div class="cart-btn-right">
                        <a href="${pageContext.request.contextPath}/buyer/cart/deleteAllCartItems?cartID=${cartID}" class="btn">Clear Cart</a>
                         <a href="${pageContext.request.contextPath}/buyer/cart?cartID=1" class="btn">Update Cart</a>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-8">
                        <div class="cart-coupon">
                            <div class="cart-title">
                                <h4 class="title">Coupon Code</h4>
                                <p>Enter your coupon code if you have one.</p>
                            </div>
                            <div class="cart-form mt-25">
                                <form action="#">
                                    <div class="single-form">
                                        <input type="text" placeholder="Enter your coupon code..">
                                    </div>
                                    <div class="cart-form-btn">
                                        <button class="btn btn-primary">Apply Coupon</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-totals">
                            <div class="cart-title">
                                <h4 class="title">Cart totals</h4>
                            </div>
                            <div class="cart-total-table mt-25">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <p class="value">Subtotal</p>
                                            </td>
                                            <td>
                                                <p class="price">£${subTotal}</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="value">Discount</p>
                                            </td>
                                             <td>
                                                <p class="price">- £600.00</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="value">Total</p>
                                            </td>
                                            <td>
                                                <p class="price">£${subTotal-600}</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="cart-total-btn">
                                <a href="${pageContext.request.contextPath}/buyer/checkout/${cartID}" class="btn btn-primary btn-block" >Proceed To Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Cart End-->
		<!-- END SIDEBAR & CONTENT -->