<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>
     <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Single Product Without Sidebar</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Home</a></li>
                                    <li>Single Product Without Sidebar</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper section">
        
            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- single-product-area start -->
                            <div class="single-product-area mb-80">
                                <div class="row">
                                    <!-- imgs-zoom-area start -->
                                    <div class="col-lg-5">
                                        <div class="imgs-zoom-area">
                                        	<c:forEach items="${product.product_imageList}" var="image" begin='0' end='0'>            	
	                                        	<img id="zoom_03" alt="image error" onError ="this.src='/resources/img/product/2.jpg'">
	                                            <script>
	                                            	var imageName = encodeURIComponent('${image.image_uploadPath}'+'/'+'${image.image_uuid}'+'_'+'${image.image_name}');
	                                            	var realSrc = '/product/display?fileName='+imageName;
	                                            	
	                                        		document.getElementById('zoom_03').setAttribute("data-zoom-image",realSrc);
	                                        		document.getElementById('zoom_03').src= realSrc;
												</script>
                                            </c:forEach>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div id="gallery_01" class="carousel-btn slick-arrow-3 mt-30">
                                                        
                                                        <c:forEach items="${product.product_imageList}" var="image" varStatus="varstatus">
	                                                        <div class="p-c">
	                                                            <a href="#" id="subImage${varstatus.index}" >
	                                                                <img id="subImg${varstatus.index}" class="zoom_03" src="/resources/img/product/2.jpg" alt="image error" onError ="this.src='/resources/img/product/2.jpg'">
	                                                            </a>
	                                                            <script>
					                                            	var imageName = encodeURIComponent('${image.image_uploadPath}'+'/'+'${image.image_uuid}'+'_'+'${image.image_name}');
					                                            	var realSrc = '/product/display?fileName='+imageName;
					                                            	
					                                        		document.getElementById('subImage${varstatus.index}').setAttribute("data-zoom-image",realSrc);
					                                        		document.getElementById('subImage${varstatus.index}').setAttribute("data-image",realSrc);
					                                        		document.getElementById('subImg${varstatus.index}').src= realSrc;
																</script>
	                                                        </div>
                                                        </c:forEach>
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- imgs-zoom-area end -->
                                    <!-- single-product-info start -->
                                    <div class="col-lg-7">
                                        <div class="single-product-info">
                                            <h3 class="text-black-1"><c:out value="${product.product_title}"/></h3>
                                            <h6 class="brand-name-2">
                                            	<c:out value="${product.product_brand }"/> / <c:out value="${product.product_type }"/> / <c:out value="${product.product_carrier }"/>
                                            </h6>
                                            <!--  hr -->
                                            <hr>
                                            
                                            <!-- single-pro-color-rating -->
                                            <div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">Color</p>
                                                    <div class="widget-color f-left">
                                                        <ul>
                                                        <li class='color-1'><a href='#'></a></li> <li class='color-1'><a href='#'></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="pro-rating sin-pro-rating f-right">
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star-outline"></i></a>
                                                    <span class="text-black-5">( <c:out value="${product.product_rating}"/>점 )</span>
                                                </div>
                                            </div>
                                            <!-- hr -->
                                            <hr>
                                            <!-- plus-minus-pro-action -->
                                            <div class="plus-minus-pro-action clearfix">
                                                <div class="sin-plus-minus f-left clearfix">
                                                    <p class="color-title f-left">Qty</p>
                                                    <div class="cart-plus-minus f-left">
                                                        <input type="text" value="01" name="qtybutton"
                                                            class="cart-plus-minus-box">
                                                    </div>
                                                </div>
                                                <div class="sin-pro-action f-right">
                                                    <ul class="action-button">
                                                        <li>
                                                            <a href="#" title="Wishlist" tabindex="0"><i
                                                                    class="zmdi zmdi-favorite"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#" data-toggle="modal" data-target="#productModal"
                                                                title="Quickview" tabindex="0"><i
                                                                    class="zmdi zmdi-zoom-in"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="Compare" tabindex="0"><i
                                                                    class="zmdi zmdi-refresh"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="Add to cart" tabindex="0"><i
                                                                    class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- plus-minus-pro-action end -->
                                            <!-- hr -->
                                            <hr>
                                            <!-- single-product-price -->
                                            <h3 class="pro-price">Price :&nbsp; <c:out value="${product.product_price}"/> 원</h3>
                                            <!--  hr -->
                                            <hr>
                                            <div>
                                                <a href="#" class="button extra-small button-black" tabindex="-1">
                                                    <span class="text-uppercase">Buy now</span>
                                                </a>
                                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                <a class="button extra-small button-black" tabindex="-1" data-oper='modify'>
	                            					<span>수정</span>
	                                            </a>
	                                            </sec:authorize>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!-- single-product-info end -->
                                </div>
                                <!-- single-product-tab -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <!-- hr -->
                                        <hr>
                                        <div class="single-product-tab reviews-tab">
                                            <ul class="nav mb-20">
                                                <li><a class="active" href="#description" data-toggle="tab">description</a></li>
                                                <li><a href="#information" data-toggle="tab">information</a></li>
                                                <li><a href="#reviews" data-toggle="tab" id="reviews-tab">reviews</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane active" id="description">
                                                    <p> 상품 설명입니다.'${_csrf.token}' </p>
                                                    <p>  <c:out value="${product.product_description}"/>  </p>
                                                    
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="information">
                                                    <p> information </p>
                                                    <p> <c:out value="${product.product_information}"/> </p>
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="reviews">
                                                	<a class="button extra-small button-black mb-20" data-toggle="modal" data-target="#reviewModal">
	                            					<span>리뷰 등록</span>
	                                            	</a>
                                                    <!-- reviews-tab-desc -->
                                                    <div class="reviews-tab-desc"> </div>
                                                    <br>
                                                    <!-- review pagination -->
                                                    <ul class="shop-pagination box-shadow text-center ptblr-10-30"> </ul>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <!--  hr -->
                                        <hr>
                                    </div>
                                </div>
                            </div>
                            <!-- single-product-area end -->
                            <div class="related-product-area">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="section-title text-left mb-40">
                                            <h2 class="uppercase">related product</h2>
                                            <h6>There are many variations of passages of brands available,</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="active-related-product">
                                    <!-- product-item start -->
                                    <div class="col-lg-12">
                                        <div class="product-item">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="/resources/img/product/1.jpg" alt="" />
                                                </a>
                                            </div>
                                            <div class="product-info">
                                                <h6 class="product-title">
                                                    <a href="single-product.html">Product Name</a>
                                                </h6>
                                                <div class="pro-rating">
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                </div>
                                                <h3 class="pro-price">$ 869.00</h3>
                                                <ul class="action-button">
                                                    <li>
                                                        <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" data-toggle="modal" data-target="#productModal"
                                                            title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Add to cart"><i
                                                                class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                    <!-- product-item start -->
                                    <div class="col-lg-12">
                                        <div class="product-item">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="/resources/img/product/1.jpg" alt="" />
                                                </a>
                                            </div>
                                            <div class="product-info">
                                                <h6 class="product-title">
                                                    <a href="single-product.html">Product Name</a>
                                                </h6>
                                                <div class="pro-rating">
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                </div>
                                                <h3 class="pro-price">$ 869.00</h3>
                                                <ul class="action-button">
                                                    <li>
                                                        <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" data-toggle="modal" data-target="#productModal"
                                                            title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Add to cart"><i
                                                                class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                    <!-- product-item start -->
                                    <div class="col-lg-12">
                                        <div class="product-item">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="/resources/img/product/1.jpg" alt="" />
                                                </a>
                                            </div>
                                            <div class="product-info">
                                                <h6 class="product-title">
                                                    <a href="single-product.html">Product Name</a>
                                                </h6>
                                                <div class="pro-rating">
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                </div>
                                                <h3 class="pro-price">$ 869.00</h3>
                                                <ul class="action-button">
                                                    <li>
                                                        <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" data-toggle="modal" data-target="#productModal"
                                                            title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Add to cart"><i
                                                                class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                    <!-- product-item start -->
                                    <div class="col-lg-12">
                                        <div class="product-item">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="/resources/img/product/1.jpg" alt="" />
                                                </a>
                                            </div>
                                            <div class="product-info">
                                                <h6 class="product-title">
                                                    <a href="single-product.html">Product Name</a>
                                                </h6>
                                                <div class="pro-rating">
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                </div>
                                                <h3 class="pro-price">$ 869.00</h3>
                                                <ul class="action-button">
                                                    <li>
                                                        <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" data-toggle="modal" data-target="#productModal"
                                                            title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" title="Add to cart"><i
                                                                class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->
        
        </section>
        <!-- End page content -->
        
<!-- 수정페이지 이동시킬때 필요한 정보 -->
<form id='operForm' action='product/modify' method='get'>
	<input type="hidden" id='product_id' name='product_id' value='<c:out value="${product.product_id}"/>'>
</form>

<%@include file="/WEB-INF/views/layout/foot.jsp" %>

<!-- Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            	<h4 class="modal-title">리뷰 작성</h4>
            </div>
            <div class="modal-body">

            	<div class="form-group">
	            	<label>리뷰 평점</label><br>
	            	<c:forEach var="i" begin="0" end="4">
	            		<input type="radio" name="review_rating" value="${5-i}">
	            		<div class="pro-rating sin-pro-rating" style="display:inline-block">
	            			<c:forEach var="j" begin="1" end="${5-i}">
	            				<a><i class="zmdi zmdi-star"></i></a>
	            			</c:forEach>
	            			<c:forEach var="j" begin="1" end="${i}">
	            				<a><i class="zmdi zmdi-star-outline"></i></a>
	            			</c:forEach>
	            		</div> &nbsp;
	            	</c:forEach>
            	</div>
            	<div class="form-group">
            		<label>리뷰 내용</label>
            		<textarea class="form-control" name="review_content" placeholder="리뷰를 작성해주세요"></textarea>
            	</div>
            	<div class="form-group">
            		<label>리뷰 작성자</label>
            		<input class="form-control" name="review_reviewer" readonly="readonly">
            	</div>
            	
            </div><!-- .modal-body -->
            
            <div class="modal-footer">
            	<button id="reviewRegisterBtn" class="submit-btn-1 btn-hover-1" type="button">등록</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
    </div><!-- .modal-dialog -->
</div>
<!-- END review Modal -->

<!-- reply Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            	<h4 class="modal-title">판매자 답글 작성</h4>
            </div>
            <div class="modal-body">
            	<div class="form-group">
            		<label>답글 내용</label>
            		<textarea class="form-control" name="reply_content" placeholder="답글을 작성해주세요"></textarea>
            	</div>
            	<div class="form-group">
            		<label>답글 작성자</label>
            		<input class="form-control" name="reply_replier" readonly= readonly>
            	</div>

            	<input  type="hidden" class="form-control" name="review_id">
            	
            </div><!-- .modal-body -->
            
            <div class="modal-footer">
            	<button id="replyRegisterBtn" class="submit-btn-1 btn-hover-1" type="button">등록</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
    </div><!-- .modal-dialog -->
</div>
<!-- END reply Modal -->


<script type="text/javascript" src="/resources/js/review.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 
	 // Immediately-invoked function to get colorList 
	 (function(){
		 var id = '<c:out value = "${product.product_id}"/>';
		 
		 $.getJSON("/product/getColorList",{product_id : id}, function(arr){
			 console.log(arr);
			 str="";
			 
			 $(arr).each(function(i, color){
				
				if(color.product_color=="pink")
					str+="&nbsp; <li class='color-1'><a href='#'></a></li>";
				else if (color.product_color=="brown")
					str+="&nbsp; <li class='color-2'><a href='#'></a></li>";
				else if (color.product_color=="red")
					str+="&nbsp; <li class='color-3'><a href='#'></a></li>";
				else if (color.product_color=="blue")
					str+="&nbsp; <li class='color-4'><a href='#'></a></li>";
				else if (color.product_color=="lightGreen")
					str+="&nbsp; <li class='color-5'><a href='#'></a></li>";
				else if (color.product_color=="green")
					str+="&nbsp; <li class='color-6'><a href='#'></a></li>";
				
			 });
			 
			 $(".widget-color ul").html(str);
		 }); 
	 })();
	 
	 
	 // modify button
	 var operForm = $("#operForm");
	 
	 $("a[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/product/modify").submit();
	 });
	
	 // ----- review------
	 var productID = '<c:out value="${product.product_id}"/>';
	 var reviewsTabDiv =$(".reviews-tab-desc");
	 
	// show review list function
	 function showList(page){
		 reviewService.getList({product_id : productID, page:page||1}, function(reviewTotal, list){
			 
			 var str="";
			 if(list == null || list.length == 0){
				 reviewsTabDiv.html("");
				 return;
			 }
			for(var i=0, len = list.length||0; i<len; i++){
				if(list[i].reply_id==null){ //review
					str += '<div class="media mt-30">';
					str += '<div class="media-left"><img class="media-object" src="/resources/img/author/5.jpg">';
	                str += '</div> <div class="media-body"> <div class="clearfix"> <div class="name-commenter pull-left">';
	                str += '<h6 class="media-heading">'+list[i].review_reviewer.substring(0,3)+"****"+'</h6>';
	                str += '<p class="mb-10">'+reviewService.displayTime(list[i].review_regDate)+'</p></div><div class="pull-right">';
	                str += '<ul class="reply-delate"> <li><a class="replyModalBtn" data-id='+list[i].review_id+'>Reply</a></li> <li>/</li> <li><a class= "review-delete" href='+list[i].review_id+' data-reviewer='+list[i].review_reviewer+'>Delete</a></li> ';
	                str += '</ul> </div> </div> <div class="pro-rating sin-pro-rating" style="display:inline-block">';
	                
					for(var j=0; j < list[i].review_rating; j++){
						str += '<a><i class="zmdi zmdi-star"></i></a>';
					}
					for(var j=0; j < 5-list[i].review_rating; j++){
						str += '<a><i class="zmdi zmdi-star-outline"></i></a>';
					}
					str += '<p class="mb-0">'+ list[i].review_content+'</p> </div> </div> </div>';
				}
				else{ // reply
					str += '<div class="media" style="background-color:#f6f6f6; margin-left:40px;margin-top:0px; padding:15px">';
					
					str += '<div class="media-left"><img class="media-object" src="/resources/img/author/4.jpg">';
	                str += '</div> <div class="media-body"> <div class="clearfix"> <div class="name-commenter pull-left">';
	                str += '<h6 class="media-heading">'+"판매자"+'</h6>';
	                str += '<p class="mb-10">'+reviewService.displayTime(list[i].review_regDate)+'</p></div><div class="pull-right">';
	                str += '<ul class="reply-delate"> <li><a class= "reply-delete" href="'+list[i].reply_id+'">Delete</a></li> </ul> </div> </div>';
	                str += '<div class="pro-rating sin-pro-rating">';
	                str += '<p class="mb-0">'+ list[i].review_content+'</p> </div> </div> </div>';
				
				}
				
			}
			reviewsTabDiv.html(str);
			showReviewPage(reviewTotal);
		});
	 }// end showList function
	 
	 var pageNum = 1;
	 // Review pagination function
	 function showReviewPage(reviewTotal){
		 var endNum = Math.ceil(pageNum/5.0)*5;
		 var startNum = endNum - 4;
		 
		 var prev = startNum!=1;
		 var next = false;
		 if(endNum*5 >= reviewTotal){
			 endNum = Math.ceil(reviewTotal/5.0);
		 }
		 if(endNum*5 < reviewTotal){
			 next = true;
		 }
		 var str = "";
		 if(prev){
			 str += '<li class="paginate_button"><a href="'+(startNum-1)+'"><i class="zmdi zmdi-chevron-left"></i></a></li>';
		 }
		 for(var i=startNum; i<= endNum; i++){
			 var active = pageNum == i? "active":"";
			 str += '<li class="paginate_button '+active+'" style="margin-right: 3px;"><a href="'+i+'">'+i+'</a></li>';
		 }
		 if(next){
			 str += '<li class="paginate_button active"> <a href="'+(endNum+1)+'"><i class="zmdi zmdi-chevron-right"></i></a></li>';
		 }
		 $(".shop-pagination").html(str);
	 }                 	
                                	
     // review tab click
	 $("#reviews-tab").on("click", function(e){
		 showList(1);
	 });
	 
	 var user = "";
	<sec:authorize access="isAuthenticated()">
		user ='<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
    // review Modal show
	var reviewModal = $("#reviewModal");
	$('#reviewModal').on('show.bs.modal', function(event) {          
		reviewModal.find("textarea[name='review_content']").val("");
		
		reviewModal.find("input[name='review_reviewer']").val(user);

		
    });	

	// review register
	$("#reviewRegisterBtn").on("click",function(e){
		var review = {
				review_content : reviewModal.find("textarea[name='review_content']").val(),
				review_reviewer : reviewModal.find("input[name='review_reviewer']").val(),
				review_rating : reviewModal.find("input[name='review_rating']:checked").val(),
				product_id : productID
		};
		reviewService.add(review, function(result){
			alert("result: "+result);
			reviewModal.modal("hide");
			showList(1);
		});
	});

	// review delete
	$(".reviews-tab-desc").on("click", "ul li .review-delete", function(e){
		e.preventDefault();
		
		var review_id = $(this).attr("href");
		
		if(!user){
			alert("로그인 후 삭제가 가능합니다.");
			return;
		}
		var originalReviewer = $(this).data('reviewer');
		
		if( user != originalReviewer){
			alert("자신이 작성한 리뷰만 삭제가 가능합니다.");
			return;
		}
		reviewService.remove(review_id, originalReviewer, function(result){
				alert("remove result:"+result);
				reviewModal.modal("hide");
				showList(1);
		});
	});
	
	// review pagination
	$(".shop-pagination").on("click","li a", function(e){
		e.preventDefault();
		var targetReviewPage = $(this).attr("href");
		pageNum = targetReviewPage;
		showList(pageNum);
	});
	
	// reply Modal show
	var replyModal = $("#replyModal");
	$('#replyModal').on('show.bs.modal', function(event) {
	
		replyModal.find("textarea[name='reply_content']").val("");
		replyModal.find("input[name='reply_replier']").val(user);
		//replyModal.find("input[name='review_id']").val($(".replyModalBtn").data('id'));
    });	

	
	// reply register
	$("#replyRegisterBtn").on("click",function(e){
		var reply = {
				review_content : replyModal.find("textarea[name='reply_content']").val(),
				review_reviewer : replyModal.find("input[name='reply_replier']").val(),
				review_id : replyModal.find("input[name='review_id']").val()
		};
		replyService.add(reply, function(result){
			alert("register reply result: " + result);
			replyModal.modal("hide");
			showList(1);
		});
	});
	
	// reply delete
	$(".reviews-tab-desc").on("click", "ul li .reply-delete", function(e){
		e.preventDefault();
		
		var reply_id = $(this).attr("href");
		if(!user){
			alert("로그인 후 삭제가 가능합니다.");
			return;
		}
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		replyService.remove(reply_id, function(result){
			alert("remove result: "+result);
			replyModal.modal("hide");
			showList(1);
		});
		</sec:authorize>
		
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			alert("관리자만 삭제가 가능합니다.");
		</sec:authorize>
		
		
	});
	
	// reply delete
	$(".reviews-tab-desc").on("click", "ul li .replyModalBtn", function(e){
		e.preventDefault();
		
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			alert("관리자만 답글을 쓸 수 있습니다.");
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			replyModal.modal("show");
			replyModal.find("input[name='review_id']").val($(this).data('id'));
		</sec:authorize>
		
	});
	
 });
</script>