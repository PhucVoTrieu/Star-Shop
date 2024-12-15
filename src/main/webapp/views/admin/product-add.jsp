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
                                    <h3>Add Product</h3>
                                    <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                        <li>
                                            <a href="index.html"><div class="text-tiny">Dashboard</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <a href="#"><div class="text-tiny">Ecommerce</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <div class="text-tiny">Add product</div>
                                        </li>
                                    </ul>
                                </div>
                                <!-- form-add-product -->
                                <form class="tf-section-2 form-add-product" action="${pageContext.request.contextPath}/admin/products/create-product" method="post" enctype="multipart/form-data">
                                    <div class="wg-box">
                                        <fieldset class="name">
                                            <div class="body-title mb-10">Product name <span class="tf-color-1">*</span></div>
                                            <input class="mb-10" type="text" placeholder="Enter product name" name="name" tabindex="0" value="" aria-required="true" required="">
                                            <div class="text-tiny">Do not exceed 20 characters when entering the product name.</div>
                                        </fieldset>
                                        <div class="gap22 cols">
                                            <fieldset class="category">
                                                <div class="body-title mb-10">Category <span class="tf-color-1">*</span></div>
                                                <div class="select" >
                                                    <select class="" name="category">
                                                       <c:forEach var="category" items="${categories}">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
                                                    </select>
                                                </div>
                                            </fieldset>
                                            <fieldset class="male">
                                                <div class="body-title mb-10">Color <span class="tf-color-1">*</span></div>
                                                <div class="select">
                                                    <select class="" name="color">
                                                         <c:forEach var="color" items="${colors}">
                <option value="${color.id}">${color.colorName}</option>
            </c:forEach>
                                                    </select>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <fieldset class="brand">
                                            <div class="body-title mb-10">Recipient <span class="tf-color-1">*</span></div>
                                            <div class="select">
                                                <select class="" name="recipient">
                                                    <c:forEach var="recipient" items="${recipients}">
                <option value="${recipient.id}">${recipient.name}</option>
            </c:forEach>
                                                </select>
                                            </div>
                                        </fieldset>
                                        <fieldset class="name">
                                            <div class="body-title mb-10">Price<span class="tf-color-1">*</span></div>
                                            <input class="mb-10" type="text" placeholder="Enter product price" name="price" tabindex="0" value="" aria-required="true" required="">
                            
                                        </fieldset>
                                        <fieldset class="description">
                                            <div class="body-title mb-10">Description <span class="tf-color-1">*</span></div>
                                            <textarea class="mb-10" name="description" placeholder="Description" tabindex="0" aria-required="true" required=""></textarea>
                                            <div class="text-tiny">Do not exceed 100 characters when entering the product name.</div>
                                        </fieldset>
                                    </div>
                                    <div class="wg-box">
                                       <fieldset class="name">
    <div class="body-title mb-10">Img URL <span class="tf-color-1">*</span></div>
    <input 
        class="mb-10" 
        type="text" 
        placeholder="Enter product image URL" 
        name="imageURL" 
        tabindex="0" 
        value="" 
        aria-required="true" 
        required 
        onchange="loadImageFromURL(event)"
    >
    <!-- Thẻ chứa ảnh preview -->
    <div id="preview-container">
        <img id="url-image-preview" style="max-width: 200px; margin-top: 10px; display: none;" />
    </div>
</fieldset>

                                        <div class="cols gap22">
                                            
                                        </div>
                                        <div class="cols gap10">
                                            <button class="tf-button w-full" type="submit" >Add product</button>
<!--                                             <button class="tf-button style-1 w-full" type="submit">Save product</button> -->
       <% if (request.getAttribute("successMessage") != null) { %>
    <script>
        alert('<%= request.getAttribute("successMessage") %>');
    </script>
<% } %>

<% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert('<%= request.getAttribute("errorMessage") %>');
    </script>
<% } %>

           
                                        </div>
                                    </div>
                                </form>
                                <!-- /form-add-product -->
                            </div>
                            <!-- /main-content-wrap -->
                        </div>
                        <!-- /main-content-wrap -->
                        <!-- bottom-page -->
                        <div class="bottom-page">
                            <div class="body-text">Copyright © 2024 Remos. Design with</div>
                            <i class="icon-heart"></i>
                            <div class="body-text">by <a href="https://themeforest.net/user/themesflat/portfolio">Themesflat</a> All rights reserved.</div>
                        </div>
                        <!-- /bottom-page -->
                    </div>
                    <!-- /main-content -->
                    
                <script>
    // Hiển thị preview ảnh

    function loadImageFromURL(event) {
        const url = event.target.value; // Lấy giá trị URL từ ô input
        const preview = document.getElementById('url-image-preview');
        
        if (url) {
            preview.src = url; // Đặt URL làm nguồn ảnh
            preview.style.display = 'block'; // Hiển thị ảnh
        } else {
            preview.src = ''; // Xóa ảnh nếu URL bị xóa
            preview.style.display = 'none'; // Ẩn ảnh
        }
    }
  
</script>

