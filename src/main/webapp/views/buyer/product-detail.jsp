<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

   <!--Shop Single Start-->
        <div class="shop-single-page section-padding-4">
            <div class="container">


                <!--Shop Single Start-->
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8">
                        <div class="shop-image">
                            <div class="shop-single-preview-image">
                                <img class="product-zoom" src="${product.imageUrl }" alt="">

                                <span class="sticker-new label-sale">-34%</span>
                            </div>
<!--                             <div id="gallery_01" class="shop-single-thumb-image shop-thumb-active swiper-container"> -->
<!--                                 <div class="swiper-wrapper"> -->
<!--                                     <div class="swiper-slide single-product-thumb"> -->
<!--                                         <a class="active" href="#" data-image="assets/images/product-single/product-1.jpg"> -->
<!--                                             <img src="assets/images/product-single/product-1.jpg" alt=""> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <div class="swiper-slide single-product-thumb"> -->
<!--                                         <a href="#" data-image="assets/images/product-single/product-2.jpg"> -->
<!--                                             <img src="assets/images/product-single/product-2.jpg" alt=""> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <div class="swiper-slide single-product-thumb"> -->
<!--                                         <a href="#" data-image="assets/images/product-single/product-3.jpg"> -->
<!--                                             <img src="assets/images/product-single/product-3.jpg" alt=""> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <div class="swiper-slide single-product-thumb"> -->
<!--                                         <a href="#" data-image="assets/images/product-single/product-4.jpg"> -->
<!--                                             <img src="assets/images/product-single/product-4.jpg" alt=""> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                                 Add Arrows -->
<!--                                 <div class="swiper-thumb-next"><i class="fa fa-angle-right"></i></div> -->
<!--                                 <div class="swiper-thumb-prev"><i class="fa fa-angle-left"></i></div> -->
<!--                             </div> -->
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shop-single-content">
                            <h3 class="title">${product.name }</h3>
                           
                            <div class="product-rating">
                                <div class="rating">
                                     <div class="rating-on" style="width: ${averageRating * 20}%;"></div>
                                </div>
                                <span>
                                
                                <div class="shop-info-tab">
                        <ul class="nav justify-content-center">
<!--                             <li class="nav-item"><a class="active" data-bs-toggle="tab" href="#tab1">Description</a></li> -->
                            <li class="nav-item"><a  data-bs-toggle="tab" href="#tab2">${product.reviews.size()} reviews</a></li>
                        </ul>
                    </div>
                                
                                
                                </span>
                            </div>
                            <div class="thumb-price">
                                <span class="current-price">$ ${product.price} </span>
<!--                                 <span class="old-price">$29.00</span> -->
                                <span class="discount">${product.color.colorName}</span>
                                <span class="discount">${product.recipient.name}</span>
                            </div>
                            <p>${product.description}</p>

<!--                             <div class="shop-single-size"> -->
<!--                                 <span class="size-title">Size:</span> -->
<!--                                 <ul class="size-list"> -->
<!--                                     <li> -->
<!--                                         <div class="size-radio"> -->
<!--                                             <input type="radio" name="size" id="s"> -->
<!--                                             <label for="s">S</label> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="size-radio"> -->
<!--                                             <input type="radio" name="size" id="m"> -->
<!--                                             <label for="m">M</label> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="size-radio"> -->
<!--                                             <input type="radio" name="size" id="l"> -->
<!--                                             <label for="l">L</label> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="size-radio"> -->
<!--                                             <input type="radio" name="size" id="xl"> -->
<!--                                             <label for="xl">Xl</label> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->

                            

                           <div class="product-quantity d-flex flex-wrap align-items-center">
    <span class="quantity-title">Quantity: </span>
    <div class="quantity d-flex">
        <button type="button" class="sub"><i class="ti-minus"></i></button>
        <input type="number" class="quantity-input" value="1" min="1" />
        <button type="button" class="add"><i class="ti-plus"></i></button>
    </div>
</div>

<div class="product-action d-flex flex-wrap">
    <div class="action">
        <a href="javascript:void(0);" 
           data-product-id="${product.id}" 
           class="add-to-cart-btn-product-detail btn btn-primary" 
           data-bs-tooltip="tooltip" 
           data-bs-placement="left" 
           title="Add to cart">Add to cart
        </a>
    </div>
     <div class="action">
                                    <a href="#"><i class="fa fa-heart"></i></a>
                                </div>
</div>

                            </div>

                          

                            <div class="social-share">
                               
                            </div>
                        </div>
                    </div>
                </div>
                <!--Shop Single End-->



                <!--Shop Single info Start-->
                <div class="shop-single-info">
                    <div class="shop-info-tab">
                        <ul class="nav justify-content-center">
<!--                             <li class="nav-item"><a class="active" data-bs-toggle="tab" href="#tab1">Description</a></li> -->
                            <li class="nav-item"><a data-bs-toggle="tab" href="#tab2">Reviews</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
<!--                         <div class="tab-pane fade show active" id="tab1" role="tabpanel"> -->
<!--                             <div class="description"> -->
<!--                                 <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. <br> In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</p> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                            <div class="reviews">
                                <h3 class="review-title">Customer Reviews</h3>

                            <ul class="reviews-items">
    <c:forEach var="review" items="${reviewList}">
        <li>
            <div class="single-review">
                <h6 class="name">${review.buyer.fullName}</h6> <!-- Hiển thị tên người mua -->
                <div class="rating-date">
                    <div class="rating">
                        <!-- Hiển thị số sao đánh giá -->
                        <div class="rating-on" style="width: ${review.rating * 20}%; line-height: 30px;"></div>
                    </div>
                    <!-- Hiển thị ngày đánh giá -->
                    <span class="date">${review.reviewDate}</span>
                </div>
                <!-- Hiển thị nội dung đánh giá -->
                <div class="row">
                <p>${review.reviewContent}</p>
                
                <c:if test="${review.buyer.email == currentUserEmail}">
    <!-- Thêm nút xóa review nếu người dùng phù hợp -->
    <form action="${pageContext.request.contextPath}/buyer/reviews/deleteReview" method="post">
        <input type="hidden" name="reviewId" value="${review.reviewId}">
        <button class="btn btn-danger" type="submit" style="height:50px">Xóa</button>
    </form>
</c:if>
           </div>     
                
            </div>
        </li>
    </c:forEach>
</ul>


                                <div class="reviews-form">

                                                
<c:if test="${hasPurchased && !hasReviewed}">
<form id="reviewForm">
    <input type="hidden" value="${product.id}" name="productID" id="productID">
    <div class="row">
        <div class="col-md-12">
            <div class="reviews-rating">
                <label>Rating</label>
                <ul id="rating" class="rating">
                    <li class="star" title='Poor' data-value='1'><i class="fa fa-star-o"></i></li>
                    <li class="star" title='Fair' data-value='2'><i class="fa fa-star-o"></i></li>
                    <li class="star" title='Good' data-value='3'><i class="fa fa-star-o"></i></li>
                    <li class="star" title='Very Good' data-value='4'><i class="fa fa-star-o"></i></li>
                    <li class="star" title='Excellent' data-value='5'><i class="fa fa-star-o"></i></li>
                </ul>
            </div>
        </div>
        <div class="col-md-12">
            <div class="single-form">
                <label>Body of Review (1500)</label>
                <textarea name="reviewContent" id="reviewContent" placeholder="Write your comments here"></textarea>
            </div>
        </div>
        <div class="col-md-12">
            <div class="single-form">
                <button type="button" class="btn btn-dark" id="submitReview">Submit Review</button>
            </div>
        </div>
    </div>
</form>
</c:if>
<c:if test="${!hasPurchased}">
    <p class="text-danger">You must purchase the product before leaving a review.</p>
</c:if>
<c:if test="${hasPurchased && hasReviewed}">
    <p class="text-danger">You have reviewed the product.</p>
</c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Shop Single info End-->


            </div>
        </div>
        <!--Shop Single End-->


        <!--New Product Start-->
        <div class="new-product-area section-padding-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-9 col-sm-11">
                        <div class="section-title text-center">
                            <h2 class="title">Related Products</h2>
                            <p>A perfect blend of creativity, energy, communication, happiness and love. Let us arrange a smile for you.</p>
                        </div>
                    </div>
                </div>
                <div class="product-wrapper">
                    <div class="swiper-container product-active">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-1.jpg" alt="">
                                        </a>
                                        <span class="sticker-new soldout-title">Soldout</span>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Spring Snowflake</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$19.00</span>
                                            <span class="old-price">$29.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-2.jpg" alt="">
                                        </a>
                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Rock Soapwort</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$50.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-3.jpg" alt="">
                                        </a>

                                        <span class="sticker-new label-sale">-35%</span>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li><a href="compare.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Compare"><i class="icon-sliders"></i></a></li>
                                                <li><a href="wishlist.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="icon-heart"></i></a></li>
                                                <li><a href="javascript:void(0);" data-bs-tooltip="tooltip" data-bs-placement="left" title="Quick View" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>

                                        <div class="product-countdown">
                                            <div data-countdown="2022/12/31"></div>
                                        </div>

                                    </div>
                                    <div class="product-content text-center">
                                        <div class="rating">
                                            <div class="rating-on" style="width: 80%;"></div>
                                        </div>
                                        <h4 class="product-name"><a href="shop-single.html">Scarlet Sage</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$39.00</span>
                                            <span class="old-price">$60.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-4.jpg" alt="">
                                        </a>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Foxglove Flower</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-5.jpg" alt="">
                                        </a>

                                        <span class="sticker-new label-sale">-18%</span>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Summer Savory</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$40.00</span>
                                            <span class="old-price">$85.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-6.jpg" alt="">
                                        </a>

                                        <span class="sticker-new label-sale">-10%</span>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Wild Roses</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$19.00</span>
                                            <span class="old-price">$21.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-7.jpg" alt="">
                                        </a>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Sweet Alyssum</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$50.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-8.jpg" alt="">
                                        </a>

<!--                                         <span class="sticker-new label-sale">-34%</span> -->

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Lity Majesty Palm</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$19.00</span>
                                            <span class="old-price">$29.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="single-product">
                                    <div class="product-image">
                                        <a href="shop-single.html">
                                            <img src="assets/images/product/product-9.jpg" alt="">
                                        </a>

                                        <span class="sticker-new soldout-title">Soldout</span>

                                        <div class="action-links">
                                            <ul>
                                                <li><a href="cart.html" data-bs-tooltip="tooltip" data-bs-placement="left" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
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
                                        <h4 class="product-name"><a href="shop-single.html">Majesty Palm</a></h4>
                                        <div class="price-box">
                                            <span class="current-price">$19.00</span>
                                            <span class="old-price">$29.00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Add Arrows -->
                        <div class="swiper-next"><i class="fa fa-angle-right"></i></div>
                        <div class="swiper-prev"><i class="fa fa-angle-left"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <!--New Product End-->
<script>

document.addEventListener("DOMContentLoaded", function () {
    let selectedRating = 0;

    // Xử lý chọn rating
    const stars = document.querySelectorAll("#rating .star");
    stars.forEach(star => {
        star.addEventListener("click", function () {
            selectedRating = parseInt(this.getAttribute("data-value"));
            // Reset tất cả các sao
            stars.forEach(s => s.classList.remove("selected"));
            // Highlight các sao đã chọn
            for (let i = 0; i < selectedRating; i++) {
                stars[i].classList.add("selected");
            }
        });
    });

    // Xử lý submit review
    document.getElementById("submitReview").addEventListener("click", function () {
        const productID = document.getElementById("productID").value;
        const reviewContent = document.getElementById("reviewContent").value;

        if (selectedRating === 0) {
            alert("Please select a rating!");
            return;
        }
        if (reviewContent.length < 50) {
            alert("Review content must be at least 50 characters!");
            return;
        }
        if (!reviewContent.trim()) {
            alert("Review content cannot be empty!");
            return;
        }

        const reviewData = {
            productID: productID,
            rating: selectedRating,
            reviewContent: reviewContent
        };

        // Gửi dữ liệu qua AJAX
        fetch("${pageContext.request.contextPath}/buyer/reviews/postReview", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(reviewData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
         
                // Reload hoặc điều hướng nếu cần thiết
                window.location.href = "/buyer/products/productDetail?productId=" + productID;

            } else {
                alert("Failed to submit review.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("An error occurred while submitting the review.");
        });
    });
});

</script>