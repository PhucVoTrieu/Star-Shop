<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp"%>
 


<div class="compare-page section-padding-5">
    <div class="container">
        <div class="compare-table table-responsive">
            <table class="table">
               
                <tbody>
                    <tr>
                        <th>Image</th>
                        <c:forEach var="product" items="${products}">
                            <td>
                                <div class="product-image-title">
                                   <c:if test="${not empty product and not empty product.imageUrl}">
                    <a class="product-image" href="shop-single.html?id=${product.id}">
                        <img src="${product.imageUrl}" alt="${product.name}" />
                    </a>
                </c:if>
                                </div>
                            </td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Name</th>
                       <c:forEach var="product" items="${products}">
                            <th>${product.name}</th>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <c:forEach var="product" items="${products}">
                            <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$" /></td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <c:forEach var="product" items="${products}">
                            <td>${product.description}</td>
                        </c:forEach>
                    </tr>
                   
                    <tr>
                        <th>Category</th>
                        <c:forEach var="product" items="${products}">
                            <td>${product.category.name}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Color</th>
                        <c:forEach var="product" items="${products}">
                            <td>${product.color.colorName}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Recipient</th>
                        <c:forEach var="product" items="${products}">
                            <td>${product.recipient.name}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Average Rating</th>
                        <c:forEach var="product" items="${products}">
                            <td>
                                <div class="rating">
                                    <div class="rating-on" style="width: ${product.averageRating * 20}%;"></div>
                                    
                                </div>
                              
                            </td>
                        </c:forEach>
                    </tr>
                   
                   
                    <tr>
                        <th>Add to Cart</th>
                        <c:forEach var="product" items="${products}">
                            <td>
                               <div class="action">
        <a href="javascript:void(0);" 
           data-product-id="${product.id}" 
           class="add-to-cart-btn-product-compare btn btn-primary" 
           data-bs-tooltip="tooltip" 
           data-bs-placement="left" 
           title="Add to cart">Add to cart
        </a>
    </div>
                            </td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <th>Delete</th>
                        <c:forEach var="product" items="${products}">
                            <td>
                                <a href="${pageContext.request.contextPath}/buyer/product-compare/delete?productID=${product.id}">

                                    <i class="fa fa-trash-o"></i>
                                </a>
                            </td>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
             <a class="btn btn-primary"  href="${pageContext.request.contextPath}/buyer/products" style="margin-top:25px; width:300px;">
                                     Return 
                                </a>
        </div>
    </div>
    
    
</div>

