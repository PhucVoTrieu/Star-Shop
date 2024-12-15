<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

  <div class="checkout-page section-padding-5">
            <div class="container">
<div class="col-lg-6">
	<div class="checkout-review-order mt-30">
		<div class="checkout-title">
			<h4 class="title">Your Order</h4>
		</div>

		<div class="checkout-review-order-table table-responsive mt-15">
		
			<table class="table">
				<thead>
					<tr>
						<th class="Product-name">Product</th>
						<th class="Product-quantity" style="text-align: center;">Quantity</th>
						<th class="Product-price">Total</th>
					</tr>
				</thead>
				<tbody>
					<!-- Duyệt qua danh sách cartItemList -->


					<c:forEach var="item" items="${orderItemList}">
						<tr>
							<td class="Product-name">
								<p>${item.product.name}</p> <!-- Tên sản phẩm -->

							</td>
							<td class="Product-quantity" style="text-align: center;">
								<p>${item.quantity}</p> <!-- Số lượng -->
							</td>
							<td class="Product-price">
								<p>${item.product.price * item.quantity}</p> <!-- Tổng giá -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>

					<tr>
						<td class="Product-name Product-quantity" colspan="3">
							<p id="selectedAddress">${order.shippingAddress }</p>
						</td>
						<td><input type="hidden" value=${cartID } name="cartID">
							<input type="hidden" id="shippingAddress" name="shippingAddress">
							<input type="hidden" name="buyerID" value="${buyerID}"></td>
						<td class="Product-price"></td>
					</tr>

					<tr>
						<td class="Product-name"><p>Subtotal</p></td>
						<td></td>
						<td class="Product-price">
							<p>
								<!-- Tính tổng giá trị giỏ hàng -->
								<c:set var="subtotal" value="0" />
								<c:forEach var="item" items="${cartItemList}">
									<c:set var="subtotal"
										value="${subtotal + (item.product.price * item.quantity)}" />
								</c:forEach>
								£${order.totalPrice}
							</p>
						</td>
					</tr>

					<tr>
						<td class="Product-name"><p>Total</p></td>
						<td></td>
						<td class="total-price">
							<p>
								£
								<c:set var="total" value="${order.totalPrice}" />${total}</p>
						</td>
						<td><input type="hidden" name="totalPrice"
							value="${subtotal}"></td>
					</tr>
					<tr>
						<td colspan="3"><div class="single-form checkout-note">
								<label>Order notes</label>
								<p>${order.orderNote}</p>
							</div></td>
					</tr>
				</tfoot>
			</table>
			<div>
			
			  <a class="btn btn-primary"  href="${pageContext.request.contextPath}/buyer/account" style="margin-top:25px; width:300px;">
                                    Return</a>
			
			</div>
		</div>

	</div>
</div>
</div>



</div>
