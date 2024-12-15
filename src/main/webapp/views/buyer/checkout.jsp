  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
  <!--Register Start-->
        <div class="checkout-page section-padding-5">
            <div class="container">
               

                <form action="${pageContext.request.contextPath}/buyer/orders/placeOrder" method="post">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="checkout-form mt-30">

                                <div class="checkout-title">
                                    <h4 class="title">Shipping address details</h4>
                                    
                                </div>
										<div class="single-select2">
    <label>Address *</label>
    <div class="form-select2">
        <select class="select2" id="addressDropdown" onchange="fillAddressFields(this)">
            <c:forEach items="${shippingAddress}" var="address" varStatus="STT">
                <option value="${address.id}"
                    data-province="${address.province}" 
                    data-district="${address.district}" 
                    data-commune="${address.commune}" 
                    data-streetNumber="${address.streetNumber}" 
                    data-streetName="${address.streetName}">
                    Address ${STT.index+1}
                </option>
            </c:forEach>
        </select>
    </div>
</div>

<div class="row">
    <div class="col-sm-6">
        <div class="single-form">
            <label>Province *</label>
            <input type="text" id="province"  required>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="single-form">
            <label>District *</label>
            <input type="text" id="district"  required>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="single-form">
            <label>Commune *</label>
            <input type="text" id="commune" >
        </div>
    </div>
    <div class="col-sm-6">
        <div class="single-form">
            <label>Street Number *</label>
            <input type="text" id="streetNumber" >
        </div>
    </div>
    <div class="col-sm-12">
        <div class="single-form">
            <label>Street Name *</label>
            <input type="text" id="streetName" >
        </div>
    </div>
</div>


                              

                              
                                
                                
                                 <div class="checkout-btn" >
                                        <button class="btn btn-primary btn-block" type="submit" style="margin-top:30px;">Save Address</button>
                                    </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-5">
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
         
         
        <c:forEach var="item" items="${cartItemList}">
            <tr>
                <td class="Product-name">
                    <p>${item.product.name}  </p> <!-- Tên sản phẩm -->

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
            <td class="Product-name Product-quantity" colspan="3"> <p id="selectedAddress" >Selected Address: None</p></td>
            <td>
          <input type="hidden" value=${cartID } name="cartID">
			<input type="hidden" id="shippingAddress" name="shippingAddress">
            <input type="hidden" name="buyerID" value="${buyerID}">
      
            </td>
            <td class="Product-price">
               
            </td>
        </tr>
        
        <tr>
            <td class="Product-name"><p>Subtotal</p></td>
            <td></td>
            <td class="Product-price">
                <p>
                    <!-- Tính tổng giá trị giỏ hàng -->
                    <c:set var="subtotal" value="0" />
                    <c:forEach var="item" items="${cartItemList}">
                        <c:set var="subtotal" value="${subtotal + (item.product.price * item.quantity)}" />
                    </c:forEach>
                    £${subtotal}
                </p>
            </td>
        </tr>
       
        <tr>
            <td class="Product-name"><p>Total</p></td>
            <td></td>
            <td class="total-price">
                <p>£<c:set var="total" value="${subtotal}" />${total}</p>
            </td>
              <td>    <input type="hidden" name="totalPrice" value="${subtotal}"> </td>
        </tr>
        <tr>
         <td colspan="3"><div class="single-form checkout-note" >
                                    <label>Order notes</label>
                                    <textarea placeholder="Notes about your order, e.g. special notes for delivery." name="orderNote"></textarea>
                                </div>
                                </td>
        </tr>
    </tfoot>
</table>

                                </div>

                                <div class="checkout-payment">

                                    <div class="checkout-btn">
                                        <button class="btn btn-primary btn-block" type="submit">Place Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--Register End-->
        
        <script>
        function fillAddressFields(selectElement) {
            const selectedOption = selectElement.options[selectElement.selectedIndex];

            // Lấy giá trị từ các thuộc tính data-*
            const province = selectedOption.getAttribute("data-province") || 'N/A';
            const district = selectedOption.getAttribute("data-district") || 'N/A';
            const commune = selectedOption.getAttribute("data-commune") || 'N/A';
            const streetNumber = selectedOption.getAttribute("data-streetNumber") || 'N/A';
            const streetName = selectedOption.getAttribute("data-streetName") || 'N/A';

            // In log để kiểm tra
            //alert("Selected Address:", ${streetNumber} );

            // Gán giá trị vào các trường input
            document.getElementById("province").value = province;
            document.getElementById("district").value = district;
            document.getElementById("commune").value = commune;
            document.getElementById("streetNumber").value = streetNumber;
            document.getElementById("streetName").value = streetName;

            // Hiển thị địa chỉ trong thẻ <p>
            const fullAddress ="Selected address: "+ streetNumber + " " + streetName + ", " + commune + ", " + district + ", " + province;
            document.getElementById("selectedAddress").textContent = fullAddress;
			
            document.getElementById("shippingAddress").value = streetNumber + " " + streetName + ", " + commune + ", " + district + ", " + province;
        }


</script>
        
    <script>
    document.querySelector(".btn.btn-primary.btn-block").addEventListener("click", function(event) {
        event.preventDefault(); // Ngăn form submit nếu chưa cần thiết

        // Lấy dữ liệu từ các input
        const province = document.getElementById("province").value || 'N/A';
        const district = document.getElementById("district").value || 'N/A';
        const commune = document.getElementById("commune").value || 'N/A';
        const streetNumber = document.getElementById("streetNumber").value || 'N/A';
        const streetName = document.getElementById("streetName").value || 'N/A';

        // Format địa chỉ đầy đủ
        const fullAddress ="Selected address: "+ streetNumber + " " + streetName + ", " + commune + ", " + district + ", " + province;
        document.getElementById("selectedAddress").textContent = fullAddress;
		
        document.getElementById("shippingAddress").value = streetNumber + " " + streetName + ", " + commune + ", " + district + ", " + province;
    });
</script>
