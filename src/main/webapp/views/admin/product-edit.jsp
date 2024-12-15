<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="main-content">
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <h3>Edit Product</h3>
            <form class="tf-section-2 form-add-product" 
                  action="${pageContext.request.contextPath}/admin/products/update-product" 
                  method="post" 
                  enctype="multipart/form-data">
                  
                <div class="wg-box" style="margin-left:400px; margin-right:0px; width:700px;">
                  <div class="cols gap10">
                    <button class="tf-button w-full" type="submit">Save Changes</button>
                </div>
                <input type="hidden" name="id" value="${product.id}">
                    <fieldset class="name">
                        <div class="body-title mb-10">Product name <span class="tf-color-1">*</span></div>
                        <input class="mb-10" type="text" placeholder="Enter product name" name="name" 
                               value="${product.name}" aria-required="true" required="">
                    </fieldset>
                    
                    <fieldset class="category">
                        <div class="body-title mb-10">Category <span class="tf-color-1">*</span></div>
                        <div class="select">
                            <select name="category">
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}" 
                                            ${category.id == product.category.id ? 'selected' : ''}>
                                        ${category.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </fieldset>
                    
                    <fieldset class="male">
                        <div class="body-title mb-10">Color <span class="tf-color-1">*</span></div>
                        <div class="select">
                            <select name="color">
                                <c:forEach var="color" items="${colors}">
                                    <option value="${color.id}" 
                                            ${color.id == product.color.id ? 'selected' : ''}>
                                        ${color.colorName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </fieldset>

                    <fieldset class="brand">
                        <div class="body-title mb-10">Recipient <span class="tf-color-1">*</span></div>
                        <div class="select">
                            <select name="recipient">
                                <c:forEach var="recipient" items="${recipients}">
                                    <option value="${recipient.id}" 
                                            ${recipient.id == product.recipient.id ? 'selected' : ''}>
                                        ${recipient.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </fieldset>

                    <fieldset class="name">
                        <div class="body-title mb-10">Price<span class="tf-color-1">*</span></div>
                        <input class="mb-10" type="text" placeholder="Enter product price" name="price" 
                               value="${product.price}" aria-required="true" required="">
                    </fieldset>

                    <fieldset class="description">
                        <div class="body-title mb-10">Description <span class="tf-color-1">*</span></div>
                        <textarea class="mb-10" name="description" 
                                  aria-required="true" required="">${product.description}</textarea>
                    </fieldset>

                    <fieldset class="name">
                        <div class="body-title mb-10">Img URL <span class="tf-color-1">*</span></div>
                        <input class="mb-10" type="text" placeholder="Enter product image URL" name="imageUrl"
                               value="${product.imageUrl}" aria-required="true">
                        <!-- Preview hình ảnh -->
                        <div id="preview-container">
                            <img id="url-image-preview" src="${product.imageUrl}" style="max-width: 200px; margin-top: 10px;" />
                        </div>
                    </fieldset>

                </div>
                
              
            </form>
        </div>
    </div>
</div>

<script>
    function loadImageFromURL(event) {
        const url = event.target.value;
        const preview = document.getElementById('url-image-preview');
        
        if (url) {
            preview.src = url;
            preview.style.display = 'block';
        } else {
            preview.style.display = 'none';
        }
    }
</script>
