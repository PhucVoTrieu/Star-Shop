
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

 <!--My Account Start-->
        <div class="register-page section-padding-5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-4">
                        <div class="my-account-menu mt-30">
                            <ul class="nav account-menu-list flex-column">
<!--                                 <li> -->
<!--                                     <a class="active" data-bs-toggle="pill" href="#pills-dashboard"><i class="fa fa-tachometer"></i> Dashboard</a> -->
<!--                                 </li> -->
                                <li>
                                    <a data-bs-toggle="pill" href="#pills-order"><i class="fa fa-shopping-cart"></i> Order</a>
                                </li>
<!--                                 <li> -->
<!--                                     <a data-bs-toggle="pill" href="#pills-payment"><i class="fa fa-credit-card"></i> Payment Method</a> -->
<!--                                 </li> -->
                                <li>
                                    <a data-bs-toggle="pill" href="#pills-address"><i class="fa fa-map-marker"></i> Address</a>
                                </li>
<!--                                 <li> -->
<!--                                     <a data-bs-toggle="pill" href="#pills-account"><i class="fa fa-user"></i> Account Details</a> -->
<!--                                 </li> -->
                               
                                <li>
                                    <a href="#" id="logoutLink"><i class="fa fa-sign-out"></i> Logout</a> 
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-8 col-md-8">
                        <div class="tab-content my-account-tab mt-30" id="pills-tabContent">
<!--                             <div class="tab-pane fade show active" id="pills-dashboard"> -->
<!--                                 <div class="my-account-dashboard account-wrapper"> -->
<!--                                     <h4 class="account-title">Dashboard</h4> -->
<!--                                     <div class="welcome-dashboard"> -->
<!--                                         <p>Hello, <strong>Alex Tuntuni</strong> (If Not <strong>Tuntuni !</strong> <a href="login.html">Logout</a> )</p> -->
<!--                                     </div> -->
<!--                                     <p class="mt-25">From your account dashboard. you can easily check & view your recent orders, manage your shipping and billing addresses and edit your password and account details.</p> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="tab-pane fade" id="pills-order">
                                <div class="my-account-order account-wrapper">
                                    <h4 class="account-title">Orders</h4>
                                    <div class="account-table text-center mt-30 table-responsive">
                                        <table class="table">
                                           <thead>
                    <tr>
                        <th class="no">No</th>
                        <th class="date">Order Date</th>
                        <th class="status">Status</th>
                        <th class="total">Total Price</th>
                        <th class="address">Shipping Address</th>
                        <th class="note">Order Note</th>
                        <th class="action">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td> <!-- Số thứ tự -->
                            <td>${order.orderDate}</td> <!-- Ngày đặt hàng -->
                            <td>${order.status}</td> <!-- Trạng thái -->
                            <td>$${order.totalPrice}</td> <!-- Tổng tiền -->
                            <td style="width:400px;">${order.shippingAddress}</td> <!-- Địa chỉ giao hàng -->
                            <td style="width:200px;">${order.orderNote}</td> <!-- Ghi chú đơn hàng -->
                            <td>
                                <a href="${pageContext.request.contextPath}/buyer/orders/orderDetail?orderID=${order.orderID}">
                                    View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                                        </table>
                                        <div>
                                         <a class="btn btn-primary"  href="${pageContext.request.contextPath}/buyer/address/" style="margin-left:25px; width:300px;">
                                    <i class="fa fa-plus"></i> Add Address
                                </a>
                                
                                </div>
                                         
                                    </div>
                                </div>
                            </div>
                          
<!--                             <div class="tab-pane fade" id="pills-payment"> -->
<!--                                 <div class="my-account-payment account-wrapper"> -->
<!--                                     <h4 class="account-title">Payment Method</h4> -->
<!--                                     <p class="mt-30">You Can't Saved Your Payment Method yet.</p> -->
<!--                                 </div> -->
                                
<!--                             </div> -->
                            
                          <div class="tab-pane fade" id="pills-address">
    <div class="my-account-address account-wrapper">
        <div class="row">
            <!-- Hiển thị danh sách các địa chỉ -->
            <c:forEach var="address" items="${shippingAddress}" varStatus="STT">
                <div class="col-md-6">
                    <h4 class="account-title">Address ${STT.index+1}</h4>
                    <div class="account-address mt-30">
                        <h6 class="name">${address.buyer.fullName}</h6>
                        <p>${address.streetNumber} ${address.streetName},${address.commune } <br> 
                           ${address.district}, ${address.province}</p>
                        <p>Mobile: ${address.buyer.phoneNumber}</p>

				

						
                        <div style="display: flex; justify-content: flex-start; align-items: center; gap: 10px;">
                            <!-- Nút Edit Address -->
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/buyer/address/edit-address/${address.id}">
                                <i class="fa fa-edit"></i> Edit Address
                            </a>
 									<a class="btn btn-primary" href="${pageContext.request.contextPath}/buyer/address/delete-address/${address.id}">
                                <i class="fa fa-trash"></i> Delete Address
                            </a> 
                            <!-- Nút Add Address (nếu chưa có đủ 2 địa chỉ) -->
                            <c:if test="${addressQuantity < 2}">
                                <a class="btn btn-primary"  href="${pageContext.request.contextPath}/buyer/address/add-address/${buyerID}" style="margin-left:25px; width:300px;">
                                    <i class="fa fa-plus"></i> Add Address
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
                          


						<div class="tab-pane fade" id="pills-edit-address">
                                <div class="my-account-details account-wrapper">
                                    <h4 class="account-title">Account Details</h4>

                                    <div class="account-details">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="text" placeholder="First Name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Last Name">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Display Name">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Email address">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <h5 class="title">Password change</h5>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="password" placeholder="Current Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="password" placeholder="New Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="password" placeholder="Confirm Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <button class="btn btn-primary">Save Change</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            
                            
                            
                            
                            <div class="tab-pane fade" id="pills-account">
                                <div class="my-account-details account-wrapper">
                                    <h4 class="account-title">Account Details</h4>

                                    <div class="account-details">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="text" placeholder="First Name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Last Name">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Display Name">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="text" placeholder="Email address">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <h5 class="title">Password change</h5>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="single-form">
                                                    <input type="password" placeholder="Current Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="password" placeholder="New Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <input type="password" placeholder="Confirm Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="single-form">
                                                    <button class="btn btn-primary">Save Change</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--My Account End-->