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
                                    <h3>Product List</h3>
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
                                            <div class="text-tiny">Product List</div>
                                        </li>
                                    </ul>
                                </div>
                                <!-- product-list -->
                                <div class="wg-box">
                                    <div class="title-box">
                                        <i class="icon-coffee"></i>
                                        <div class="body-text">Tip search by Product ID: Each product is provided with a unique ID, which you can rely on to find the exact product you need.</div>
                                    </div>
                                    <div class="flex items-center justify-between gap10 flex-wrap">
                                        <div class="wg-filter flex-grow">
                                            <div class="show">
                                                <div class="text-tiny">Showing</div>
                                                <div class="select">
                                                    <select class="">
                                                        <option>10</option>
                                                        <option>20</option>
                                                        <option>30</option>
                                                    </select>
                                                </div>
                                                <div class="text-tiny">entries</div>
                                            </div>
                                            <form class="form-search">
                                                <fieldset class="name">
                                                    <input type="text" placeholder="Search here..." class="" name="name" tabindex="2" value="" aria-required="true" required="">
                                                </fieldset>
                                                <div class="button-submit">
                                                    <button class="" type="submit"><i class="icon-search"></i></button>
                                                </div>
                                            </form>
                                        </div>
                                        <a class="tf-button style-1 w208" href="${pageContext.request.contextPath}/admin/products/add-product" ><i class="icon-plus"></i>Add new</a>
                                    </div>
                                    <div class="wg-table table-product-list">
                                        <ul class="table-title flex gap20 mb-14">
                                            <li>
                                                <div class="body-title">Product</div>
                                            </li>    
                                            <li>
                                                <div class="body-title">Product ID</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Description</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Category</div>
                                            </li>
                                                            <li>
                                                <div class="body-title">Color</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Price</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Created date</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Action</div>
                                            </li>
                                        </ul>
                                        <ul class="flex flex-column">
                                            <c:forEach var="product" items="${productPage.content}">
    <li class="product-item gap14">
        <div class="image no-bg">
            <img src="${product.imageUrl}" alt="${product.name}">
        </div>
        <div class="flex items-center justify-between gap20 flex-grow">
            <div class="name">
                <a href="#" class="body-title-2">${product.name}</a>
            </div>
            <div class="body-text">#${product.id}</div>
               <div class="body-text">${product.description}</div>
            <div class="body-text">${product.category.name}</div>
            <div class="body-text">${product.color.colorName}</div>
            <div class="body-text">$${product.price}</div>
         
            <div class="body-text">${product.createdDate}</div>
            <div class="list-icon-function">
                <div class="item edit">
                    <a href="${pageContext.request.contextPath}/admin/products/edit-product/${product.id}"><i class="icon-edit-3"></i></a>
                </div>
                <div class="item trash">
                    <a href="${pageContext.request.contextPath}/admin/products/delete-product/${product.id}"><i class="icon-trash-2"></i></a>
                </div>
            </div>
        </div>
    </li>
</c:forEach>
                                            
                                        </ul>
                                    </div>
                                    <div class="pagination">
    <c:if test="${productPage.hasPrevious()}">
        <a href="?page=${productPage.number - 1}&size=${pageSize}">&laquo; Previous</a>
    </c:if>

    <c:forEach begin="0" end="${productPage.totalPages - 1}" var="i">
        <a href="?page=${i}&size=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i + 1}</a>
    </c:forEach>

    <c:if test="${productPage.hasNext()}">
        <a href="?page=${productPage.number + 1}&size=${pageSize}">Next &raquo;</a>
    </c:if>
</div>
                                    <div class="divider"></div>
<div class="flex items-center justify-between flex-wrap gap10">
    <!-- Hiển thị số mục -->
    <div class="text-tiny">
        Showing ${productPage.size} entries of ${productPage.totalElements}
    </div>

    <!-- Phân trang -->
    <ul class="wg-pagination">
        <!-- Nút Previous -->
        <c:if test="${productPage.hasPrevious()}">
            <li>
                <a href="?page=${productPage.number - 1}&size=${productPage.size}">
                    <i class="icon-chevron-left"></i>
                </a>
            </li>
        </c:if>

        <!-- Các số trang -->
        <c:forEach begin="0" end="${productPage.totalPages - 1}" var="i">
            <li class="${i == productPage.number ? 'active' : ''}">
                <a href="?page=${i}&size=${productPage.size}">${i + 1}</a>
            </li>
        </c:forEach>

        <!-- Nút Next -->
        <c:if test="${productPage.hasNext()}">
            <li>
                <a href="?page=${productPage.number + 1}&size=${productPage.size}">
                    <i class="icon-chevron-right"></i>
                </a>
            </li>
        </c:if>
    </ul>
</div>
                                    
<!--                                     <div class="divider"></div> -->
<!--                                     <div class="flex items-center justify-between flex-wrap gap10"> -->
<!--                                         <div class="text-tiny">Showing 10 entries</div> -->
<!--                                         <ul class="wg-pagination"> -->
<!--                                             <li> -->
<!--                                                 <a href="#"><i class="icon-chevron-left"></i></a> -->
<!--                                             </li> -->
<!--                                             <li> -->
<!--                                                 <a href="#">1</a> -->
<!--                                             </li> -->
<!--                                             <li class="active"> -->
<!--                                                 <a href="#">2</a> -->
<!--                                             </li> -->
<!--                                             <li> -->
<!--                                                 <a href="#">3</a> -->
<!--                                             </li> -->
<!--                                             <li> -->
<!--                                                 <a href="#"><i class="icon-chevron-right"></i></a> -->
<!--                                             </li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
                                </div>
                                <!-- /product-list -->
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