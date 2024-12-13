<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/common/taglibs.jsp"%>
    
            <!--Page Banner Start-->
        <div class="page-banner" style="background-image: url(assets/images/testimonial-bg.jpg);">
            <div class="container">
                <div class="page-banner-content text-center">
                    <h2 class="title">Products</h2>
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Products</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--Page Banner End-->

        <!--Shop Start-->
        <div class="shop-page section-padding-6">
            <div class="container">
                <div class="row flex-row-reverse">
                    <div class="col-lg-9">

                        <div class="shop-banner">
                            <a href="#"><img src="assets/images/banner-1.jpg" alt=""></a>
                        </div>


                        <!--Shop Top Bar Start-->
                        <div class="shop-top-bar d-sm-flex align-items-center justify-content-between">
                            <div class="top-bar-btn">
                                <ul class="nav"">
            <li class=" nav-item"><a class="nav-link grid active" data-bs-toggle="tab" href="#grid"></a></li>
                                    <li class="nav-item"><a class="nav-link list" data-bs-toggle="tab" href="#list"></a></li>
                                </ul>
                            </div>
                            <div class="top-bar-sorter">
                                <div class="sorter-wrapper d-flex align-items-center">
                                    <label>Sort by:</label>
                                    <select class="sorter wide" name="SortBy" id="SortBy">
                                        <option value="manual">Featured</option>
                                        <option value="best-selling">Best Selling</option>
                                        <option value="title-ascending">Alphabetically, A-Z</option>
                                        <option value="title-descending">Alphabetically, Z-A</option>
                                        <option value="price-ascending">Price, low to high</option>
                                        <option value="price-descending">Price, high to low</option>
                                        <option value="created-descending">Date, new to old</option>
                                        <option value="created-ascending">Date, old to new</option>
                                    </select>
                                </div>
                            </div>
                            <div class="top-bar-page-amount">
                                <p>Showing 1 - 9 of 10 result</p>
                            </div>
                        </div>
                        <!--Shop Top Bar End-->


                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="grid" role="tabpanel">
                                <div class="row">
                                
                                
                                
                                    <!-- Hiển thị các sản phẩm phân trang -->
<c:forEach var="product" items="${productPage.content}">
    <div class="col-lg-4 col-sm-6">
        <div class="single-product">
            <div class="product-image">
                <a href="shop-single.html">
                    <img src="${product.imageUrl}" alt="${product.name}">
                </a>

                <!-- Hiển thị sticker nếu sản phẩm hết hàng -->
                <c:if test="${product.stock == 0}">
                    <span class="sticker-new soldout-title">Soldout</span>
                </c:if>

                <div class="action-links">
                    <ul>
<%--                         <li><a href="<c:url value='/buyer/cart/addCartItem?productID=${product.id}'/>" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li> --%>
                       <li>
    <a href="javascript:void(0);" 
       data-product-id="${product.id}" 
       class="add-to-cart-btn" 
       data-bs-tooltip="tooltip" 
       data-bs-placement="left" 
       title="Add to cart">
       <i class="icon-shopping-bag"></i>
    </a>
</li>
                       
                        <li><a href="compare.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Compare"><i class="icon-sliders"></i></a></li>
                        <li><a href="wishlist.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="icon-heart"></i></a></li>
                        <li><a href="javascript:void(0);" data-bs-tooltip="tooltip" data-bs-placement="left" title="Quick View" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="icon-eye"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="product-content text-center">
                <div class="rating">
                    <div class="rating-on" style="width: 80%;"></div>
                </div>
                <h4 class="product-name"><a href="shop-single.html">${product.name}</a></h4>
                <div class="price-box">
                    <span class="current-price">${product.price}</span>
<%--                     <c:if test="${product.oldPrice != null}"> --%>
<%--                         <span class="old-price">${product.oldPrice}</span> --%>
<%--                     </c:if> --%>
                </div>
            </div>
        </div>
    </div>
</c:forEach>


</div>
</div>
</div>
                        <!--Pagination Start-->
                        <div class="page-pagination">
                            <ul class="pagination justify-content-center">
                                <li class="page-item"><a class="page-link prev" href="#">Prev</a></li>
                                <li class="page-item"><a class="page-link active" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link next" href="#">Next</a></li>
                            </ul>
                        </div>
                        <!--Pagination End-->


                    </div>
                    <div class="col-lg-3">
                        <div class="shop-sidebar">


                            <!--Sidebar Categories Start-->
                            <div class="sidebar-categories">
                                <h3 class="widget-title">Custom category</h3>

                                <ul class="categories-list">
                                    <li><a href="#">Delivery</a></li>
                                    <li><a href="#">Legal Notice</a></li>
                                    <li><a href="#">Secure payment</a></li>
                                    <li><a href="#">Sitemap</a></li>
                                    <li><a href="#">About us</a></li>
                                </ul>
                            </div>
                            <!--Sidebar Categories End-->



                            <!--Sidebar Categories Start-->
                            <div class="sidebar-categories">
                                <h3 class="widget-title">Categories</h3>

                                <ul class="categories-list">
                                    <li><a href="#">Best Sellers <span>(8)</span></a></li>
                                    <li><a href="#">Featured <span>(9)</span></a></li>
                                    <li><a href="#">New <span>(8)</span></a></li>
                                </ul>
                            </div>
                            <!--Sidebar Categories End-->



                            <!--Sidebar Color Start-->
                            <div class="sidebar-color">
                                <h3 class="widget-title">Color</h3>

                                <ul class="color-list">
                                    <li class="active"> <span data-color="#ff0000"></span> Red</li>
                                    <li> <span data-color="#008000"></span> Green</li>
                                    <li> <span data-color="#0000ff"></span> Blue</li>
                                    <li> <span data-color="#ffff00"></span> Yellow</li>
                                    <li> <span data-color="#ffffff"></span> White</li>
                                    <li> <span data-color="#ffd700"></span> Gold</li>
                                </ul>
                            </div>
                            <!--Sidebar Color End-->



                            <!--Sidebar Size Start-->
                            <div class="sidebar-size">
                                <h3 class="widget-title">Size</h3>

                                <ul class="size-list">
                                    <li><a href="javascript:void(0)">S</a></li>
                                    <li><a href="javascript:void(0)">M</a></li>
                                    <li><a href="javascript:void(0)">L</a></li>
                                    <li><a href="javascript:void(0)">Xl</a></li>
                                    <li><a href="javascript:void(0)">XXl</a></li>
                                </ul>
                            </div>
                            <!--Sidebar Size End-->


                            <!--Sidebar Size Start-->
                            <div class="sidebar-banner">
                                <a href="#"><img src="assets/images/banner-2.jpg" alt=""></a>
                            </div>
                            <!--Sidebar Size End-->


                            <!--Sidebar Product Start-->
                            <div class="sidebar-product">
                                <h3 class="widget-title">Top rated products</h3>

                                <ul class="product-list">
                                    <li>
                                        <div class="single-mini-product">
                                            <div class="product-image">
                                                <a href="shop-single.html"><img src="assets/images/product/product-8.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h4 class="title"><a href="shop-single.html">Lity Majesty Palm</a></h4>
                                                <ul class="rating">
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                </ul>
                                                <div class="price-box">
                                                    <span class="old-price">$29.00</span>
                                                    <span class="current-price">$19.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="single-mini-product">
                                            <div class="product-image">
                                                <a href="shop-single.html"><img src="assets/images/product/product-5.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h4 class="title"><a href="shop-single.html">Summer Savory</a></h4>
                                                <ul class="rating">
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                </ul>
                                                <div class="price-box">
                                                    <span class="old-price">$85.00</span>
                                                    <span class="current-price">$40.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="single-mini-product">
                                            <div class="product-image">
                                                <a href="shop-single.html"><img src="assets/images/product/product-7.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h4 class="title"><a href="shop-single.html">Sweet Alyssum</a></h4>
                                                <ul class="rating">
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                    <li class="rating-on"><i class="fa fa-star-o"></i></li>
                                                </ul>
                                                <div class="price-box">
                                                    <span class="current-price">$50.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!--Sidebar Product End-->



                            <!--Sidebar Tags Start-->
                            <div class="sidebar-tags">
                                <h3 class="widget-title">Tags</h3>

                                <ul class="tags-list">
                                    <li><a href="#">black</a></li>
                                    <li><a href="#">blue</a></li>
                                    <li><a href="#">fiber</a></li>
                                    <li><a href="#">gold</a></li>
                                    <li><a href="#">gray</a></li>
                                    <li><a href="#">green</a></li>
                                    <li><a href="#">I</a></li>
                                    <li><a href="#">leather</a></li>
                                </ul>
                            </div>
                            <!--Sidebar Tags End-->


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Shop End-->
        