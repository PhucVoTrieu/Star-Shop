<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>


<!-- main-content -->
<div class="main-content">
	<!-- main-content-wrap -->
	<div class="main-content-inner">
		<!-- main-content-wrap -->
		<div class="main-content-wrap">
			<div class="flex items-center flex-wrap justify-between gap20 mb-27">
				<h3>Order List</h3>
				<ul
					class="breadcrumbs flex items-center flex-wrap justify-start gap10">
					<li><a href="index.html"><div class="text-tiny">Dashboard</div></a>
					</li>
					<li><i class="icon-chevron-right"></i></li>
					<li><a href="#"><div class="text-tiny">Order</div></a></li>
					<li><i class="icon-chevron-right"></i></li>
					<li>
						<div class="text-tiny">Order List</div>
					</li>
				</ul>
			</div>
			<!-- order-list -->
			<div class="wg-box">
				<div class="flex items-center justify-between gap10 flex-wrap">
					<div class="wg-filter flex-grow">
						<form class="form-search">
							<fieldset class="name">
								<input type="text" placeholder="Search here..." class=""
									name="name" tabindex="2" value="" aria-required="true"
									required="">
							</fieldset>
							<div class="button-submit">
								<button class="" type="submit">
									<i class="icon-search"></i>
								</button>
							</div>
						</form>
					</div>
					<a class="tf-button style-1 w208" href="oder-detail.html"><i
						class="icon-file-text"></i>Export all order</a>
				</div>
				
				
				<div class="wg-table table-all-category">
					<ul class="table-title flex gap20 mb-14">
						<li>
							<div class="body-title">Product</div>
						</li>
						<li>
							<div class="body-title">Order ID</div>
						</li>
						<li>
							<div class="body-title">Price</div>
						</li>
						<li>
							<div class="body-title">Quantity</div>
						</li>
						<li>
							<div class="body-title">Order Note</div>
						</li>
						<li>
							<div class="body-title">Status</div>
						</li>
						<li>
							<div class="body-title"></div>
						</li>
					</ul>
					<ul class="flex flex-column">
    <c:forEach var="order" items="${orderPage.content}">
        <li class="product-item gap14">
            <input type="hidden" class="orderID" value="${order.orderID}">
            <div class="flex items-center justify-between gap20 flex-grow">
                <div class="name">
                    <a href="product-detail.html" class="body-title-2">${order.buyer.fullName}</a>
                </div>
                <div class="body-text">#${order.orderID}</div>
                <div class="body-text">
                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$" />
                </div>
                <div class="body-text">${order.orderItems.size()}</div>
                <div class="body-text">${order.orderNote}</div>
                
                 <div>
           <form action="${pageContext.request.contextPath}/admin/orders/updateStatus" method="POST">
    <input type="hidden" name="orderID" value="${order.orderID}">
    <select name="newStatus" onchange="this.form.submit()">
        <option value="Success" ${order.status == 'Success' ? 'selected' : ''}>Success</option>
        <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
        <option value="Cancel" ${order.status == 'Cancel' ? 'selected' : ''}>Cancel</option>
    </select>
</form>

            </div>
            
<!--                 <div> -->
<!--                     <div class="block-tracking">Tracking</div> -->
<!--                 </div> -->
               <div class="list-icon-function">
    <!-- Nút cập nhật trạng thái -->
   

    <!-- Nút xóa -->
   
</div>

            </div>
        </li>
    </c:forEach>
</ul>				</div>











<!-- 				<div class="wg-table table-all-category"> -->
<%--     <c:forEach var="order" items="${orderPage.content}"> --%>
<!--         <ul class="table-title flex gap20 mb-14"> -->
<!--             <li> -->
<%--                 <div class="body-title">Order ID: ${order.orderID}</div> --%>
<!--             </li> -->
<!--             <li> -->
<%--                 <div class="body-title">Total Price: ${order.totalPrice}</div> --%>
<!--             </li> -->
<!--             <li> -->
<%--                 <div class="body-title">Status: ${order.status}</div> --%>
<!--             </li> -->
<!--         </ul> -->
<!--         <ul class="flex flex-column"> -->
<%--             <c:forEach var="item" items="${order.orderItems}"> --%>
<!--                 <li class="product-item gap14"> -->
<!--                     <div class="image no-bg"> -->
<%--                         <img src="${item.product.imageUrl}" alt="${item.product.name}"> --%>
<!--                     </div> -->
<!--                     <div class="flex items-center justify-between gap20 flex-grow"> -->
<!--                         <div class="name"> -->
<%--                             <a href="product-list.html" class="body-title-2">${item.product.name}</a> --%>
<!--                         </div> -->
<%--                         <div class="body-text">Price: ${item.price}</div> --%>
<%--                         <div class="body-text">Quantity: ${item.quantity}</div> --%>
<!--                     </div> -->
<!--                 </li> -->
<%--             </c:forEach> --%>
<!--         </ul> -->
<%--     </c:forEach> --%>
<!-- </div> -->

<!-- <div class="pagination"> -->
<%--     <c:forEach begin="0" end="${orderPage.totalPages - 1}" var="i"> --%>
<%--         <a href="?page=${i}&size=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i + 1}</a> --%>
<%--     </c:forEach> --%>
<!-- </div> -->
				
				
				
				<div class="divider"></div>
<div class="flex items-center justify-between flex-wrap gap10">
    <!-- Hiển thị số lượng kết quả -->
    <div class="text-tiny">
        Showing ${totalItems} entries of ${orderPage.size}
    </div>

    <!-- Pagination -->
    <ul class="wg-pagination">
        <!-- Nút Previous -->
        <li>
            <a href="/orders?page=${currentPage - 1}&size=${pageSize}" 
               class="${currentPage == 0 ? 'disabled' : ''}">
                <i class="icon-chevron-left"></i>
            </a>
        </li>

        <!-- Các số trang -->
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <li class="${currentPage == i ? 'active' : ''}">
                <a href="/orders?page=${i}&size=${pageSize}">${i + 1}</a>
            </li>
        </c:forEach>

        <!-- Nút Next -->
        <li>
            <a href="/orders?page=${currentPage + 1}&size=${pageSize}" 
               class="${currentPage == totalPages - 1 ? 'disabled' : ''}">
                <i class="icon-chevron-right"></i>
            </a>
        </li>
    </ul>
</div>

			</div>
			<!-- /order-list -->
		</div>
		<!-- /main-content-wrap -->
	</div>
	<!-- /main-content-wrap -->
	<!-- bottom-page -->
	<div class="bottom-page">
		<div class="body-text">Copyright © 2024 Remos. Design with</div>
		<i class="icon-heart"></i>
		<div class="body-text">
			by <a href="https://themeforest.net/user/themesflat/portfolio">Themesflat</a>
			All rights reserved.
		</div>
	</div>
	<!-- /bottom-page -->
</div>
<!-- /main-content -->

