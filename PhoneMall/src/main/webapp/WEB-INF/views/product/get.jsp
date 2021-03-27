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
                                      <form id="cartform" name="form1" action="/purchase/insertCart" method="post">
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
                                                    <c:forEach var="i" begin="1" end="${product.product_rating }" >
					                              		<a><i class="zmdi zmdi-star"></i></a>
					                              		<c:set var="rating">${i}</c:set>
					                              	</c:forEach>
					                              	<c:if test="${ product.product_rating - rating >= 0.5 }">
                                                   		<a><i class="zmdi zmdi-star-half"></i></a>
                                                   	</c:if>
                                                   	<c:if test="${ product.product_rating - rating != 0 }">
                                                    	<c:if test="${ product.product_rating - rating < 0.5 }">
                                                    		<a><i class="zmdi zmdi-star-outline"></i></a>
                                                    	</c:if>
                                                   	</c:if>
                                                   	<c:if test="${ product.product_rating - rating == 0 }">
                                                    	<a><i class="zmdi zmdi-star-outline"></i></a>
                                                   	</c:if>
                                                   	<c:forEach var="i" begin="${product.product_rating+2}" end="5">
                                                   		<a><i class="zmdi zmdi-star-outline"></i></a>
                                                   	</c:forEach>
                                                    <span class="text-black-5">( <c:out value="${product.product_rating}"/>점 )</span>
                                                </div>
                                            </div>
                                            <!-- hr -->
                                            <hr>
                                            <!-- plus-minus-pro-action -->
                                            
                                            <div class="plus-minus-pro-action clearfix" style="height:30px;">
                                                <div class="sin-plus-minus f-left clearfix">
                                                    <p class="color-title f-left">Qty</p>
                                                    <div class="cart-plus-minus f-left">
                                                        <input type="text" value="01" name="product_qty"
                                                            class="cart-plus-minus-box">
                                                    </div>
                                                </div>
                                                <div class="sin-plus-minus f-left clearfix" style="margin-left:30px;">
                                                	<input type="hidden" name="product_id" value="${product.product_id}"/>
                                                	<input type="hidden" name="product_price" value="${product.product_price}"/>
                                                    <p class="color-title f-left">Color</p>
                                                        <select name="product_color">
                                                        <c:forEach var = "color" items = "${product.product_colorList}">
    															<option value="${color.product_color}">${color.product_color}</option>
    													</c:forEach>
														</select>
                                                </div>
                                         
                                              </div>   
                                            <!-- plus-minus-pro-action end -->
                                            <!-- hr -->
                                            <hr>
                                            <!-- single-product-price -->
                                            <h3 class="pro-price">Price :&nbsp; <fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="3"/> 원</h3>
                                            <!--  hr -->
                                            <hr>
                                            <div>
                                                <a id="customSubmit2"  class="button extra-small button-black" tabindex="-1">
                                                    <span class="text-uppercase">Add to Cart</span>
                                                </a>
                                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                <a class="button extra-small button-black" tabindex="-1" data-oper='modify'>
	                            					<span>수정</span>
	                                            </a>
	                                            </sec:authorize>
                                            </div>
                                     
												</div>
												</form>
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
                                                    <p> 상품 설명입니다.</p>
                                                    <pre style="background-color:transparent; border: none"> ${product.product_description} </pre>
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="information">
                                                    <p> information </p>
                                                    <p> <c:out value="${product.product_information}"/> </p>
                                                </div>
                                                <div role="tabpanel" class="tab-pane" id="reviews">
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
                            <c:if test="${!empty relatedList}">
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
                                	<c:forEach items="${relatedList}" var="product" varStatus="varstatus">
                                	
                                    <!-- product-item start -->
                                    <div class="col-lg-12">
                                        <div class="product-item">
                                            <div class="product-img" style="position:relative; padding-top:111%; display:block;" >
                                                <a href='get?product_id=<c:out value="${product.product_id}"/>'>
                                                <img id = 'related-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'"
                                                  	style="position:absolute; top:0; width:100%;height:100%">
	                                        	<script>
	                                         	var imageName = encodeURIComponent('${product.product_imageList[0].image_uploadPath}'+'/s_'+'${product.product_imageList[0].image_uuid}'+'_'+'${product.product_imageList[0].image_name}');
	                                         	var realSrc = '/product/display?fileName='+imageName;
	                                         	
	                                     		document.getElementById('related-img${varstatus.index}').src= realSrc;
												</script>
                                                </a>
                                              </div>
                                            <div class="product-info">
                                                <h6 class="product-title">
                                                    <a href="single-product.html"><c:out value="${product.product_title}"/></a>
                                                </h6>
                                                <div class="pro-rating">
	                                               	<c:forEach var="i" begin="1" end="${product.product_rating }" >
	                                               		<a><i class="zmdi zmdi-star"></i></a>
	                                               		<c:set var="rating">${i}</c:set>
	                                               	</c:forEach>
	                                               	
	                                               	<c:if test="${ product.product_rating - rating >= 0.5 }">
	                                               		<a><i class="zmdi zmdi-star-half"></i></a>
	                                               	</c:if>
	                                               	<c:if test="${ product.product_rating - rating < 0.5 }">
	                                               		<a><i class="zmdi zmdi-star-outline"></i></a>
	                                               	</c:if>
	                                               	<c:forEach var="i" begin="${product.product_rating+2}" end="5">
	                                               		<a><i class="zmdi zmdi-star-outline"></i></a>
	                                               	</c:forEach>
	                              						<b><c:out value="${product.product_rating }"/></b>&nbsp;(<c:out value="${product.review_count }"/>)               
	                                            </div>
                                                <h3 class="pro-price"><fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="3"/>원</h3>
                                                <ul class="action-button">
                                                    <li>
                                                        <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite" data-id="<c:out value='${product.product_id }'/>"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" data-toggle="modal" data-target="#productModal"
                                                            title="Quickview" data-id="<c:out value='${product.product_id }'/>"><i class="zmdi zmdi-zoom-in"></i></a>
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
                                    
                                    </c:forEach>
                                    
                                </div>
                            </div>
                            </c:if>
                            
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
            	<button id="reviewUpdateBtn" class="submit-btn-1 btn-hover-1" type="button">수정</button>
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

            </div><!-- .modal-body -->
            
            <div class="modal-footer">
            	<button id="replyRegisterBtn" class="submit-btn-1 btn-hover-1" type="button">등록</button>
            	<button id="replyUpdateBtn" class="submit-btn-1 btn-hover-1" type="button">수정</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
    </div><!-- .modal-dialog -->
</div>
<!-- END reply Modal -->

<!-- START QUICKVIEW PRODUCT -->
<div id="quickview-wrapper">
  <!-- Modal -->
  <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
              <div class="modal-body">
                  <div class="modal-product clearfix">
                      <div class="product-images">
                          <div class="main-image images">
                              <img alt="" id="quick-img"src="/resources/img/product/quickview.jpg">
                          </div>
                      </div><!-- .product-images -->
                      
                      <div class="product-info">
                          <h1 id ="quick-title"> </h1>
                          <div class="price-box-3">
                              <div class="s-price-box">
                                  <span class="new-price" id ="quick-price"> </span>
                              </div>
                          </div>
                          <a class ='move see-all' id="quick-id" href='<c:out value="${product.product_id}"/>'>See all features</a>
                          <div class="quick-add-to-cart">
                              <form method="post" class="cart">
                                  <div class="numbers-row">
                                      <input type="number" id="french-hens" value="1">
                                  </div>
                                  <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                              </form>
                          </div>
                          <div id="quick-information" class="quick-desc"></div>
                          <div class="social-sharing">
                              <div class="widget widget_socialsharing_widget">
                                  <h3 class="widget-title-modal">Share this product</h3>
                                  <ul class="social-icons clearfix">
                                      <li>
                                          <a class="facebook" href="#" target="_blank" title="Facebook">
                                              <i class="zmdi zmdi-facebook"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="google-plus" href="#" target="_blank" title="Google +">
                                              <i class="zmdi zmdi-google-plus"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="twitter" href="#" target="_blank" title="Twitter">
                                              <i class="zmdi zmdi-twitter"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="pinterest" href="#" target="_blank" title="Pinterest">
                                              <i class="zmdi zmdi-pinterest"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="rss" href="#" target="_blank" title="RSS">
                                              <i class="zmdi zmdi-rss"></i>
                                          </a>
                                      </li>
                                      <li>
                                      	<a id="kakao-link-btn" href="#">
                                          <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" style="width:100%"/>
  									  	</a>
  									  </li>
                                  </ul>
                              </div>
                          </div>
                      </div><!-- .product-info -->
                  </div><!-- .modal-product -->
              </div><!-- .modal-body -->
          </div><!-- .modal-content -->
      </div><!-- .modal-dialog -->
  </div>
  <!-- END Modal -->
</div>
<!-- END QUICKVIEW PRODUCT -->

<script type="text/javascript" src="/resources/js/review.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/quickViewModal.js"></script>

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
	
	 // ============ review ===============
	 var productID = '<c:out value="${product.product_id}"/>';
	 var reviewsTabDiv =$(".reviews-tab-desc");
	 
	// show review list function
	 function showList(page){
		 reviewService.getList({product_id : productID, page:page||1}, function(reviewTotal, list){
			 
			 var str="";
			 if(list == null || list.length == 0){
				 reviewsTabDiv.html("<p>아직 작성된 리뷰가 없습니다.</p>");
				 return;
			 }
			for(var i=0, len = list.length||0; i<len; i++){
				if(list[i].reply_id==null){ //review
					str += '<div class="media mt-30">';
					str += '<div class="media-left"><img class="media-object" src="/resources/img/author/5.jpg">';
	                str += '</div> <div class="media-body"> <div class="clearfix"> <div class="name-commenter pull-left">';
	                str += '<h6 class="media-heading">'+list[i].review_reviewer.substring(0,3)+"****"+'</h6>';
	                str += '<p class="mb-10">'+reviewService.displayTime(list[i].review_regDate);
	                if(list[i].review_updateDate){
	                	str += '<br>'+reviewService.displayTime(list[i].review_updateDate)+'(수정됨)';
	                }
	                str += '</p></div> <ul class="reply-delate pull-right"> <li><a class="reply-register" data-id='+list[i].review_id+'>답글</a></li> <li>/</li> ';
	                str += '<li><a class= "review-update" href='+list[i].review_id+' data-reviewer='+list[i].review_reviewer+'>수정</a></li> <li>/</li> <li><a class= "review-delete" href='+list[i].review_id+' data-reviewer='+list[i].review_reviewer+'>삭제</a></li> ';
	                str += '</ul> </div> <div class="pro-rating sin-pro-rating" style="display:inline-block">';
	                
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
	                str += '<p class="mb-10">'+reviewService.displayTime(list[i].review_regDate);
	                if(list[i].review_updateDate){
	                	str += '<br>'+reviewService.displayTime(list[i].review_updateDate)+'(수정됨)';
	                }
	                str += '</p></div> <ul class="reply-delate pull-right"> <li><a class= "reply-update" href='+list[i].reply_id+' data-reviewer='+list[i].review_reviewer+'>수정</a></li>';
	                str += ' <li>/</li><li><a class= "reply-delete" href="'+list[i].reply_id+'">삭제</a></li> </ul> </div>';
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

	var reviewModal = $("#reviewModal");	
	// show review update modal 
	$(".reviews-tab-desc").on("click", "ul li .review-update", function(e){
		e.preventDefault();
		
		if(!user){
			alert("로그인 후 수정이 가능합니다.");
			return;
		}
		
		var review_id = $(this).attr("href");
		
		reviewService.get(review_id,function(review){
			if(user !=review.review_reviewer){
				alert("자신이 작성한 리뷰만 수정할 수 있습니다.");
				return;
			}
			reviewModal.find("textarea[name='review_content']").val(review.review_content);
			reviewModal.find("input[name='review_reviewer']").val(user);
			reviewModal.find("button[id='reviewRegisterBtn']").hide();
			reviewModal.find("button[id='reviewUpdateBtn']").show();
			reviewModal.data("review_id", review.review_id);
			reviewModal.modal("show");
		});
	});
	
	// review update
	$("#reviewUpdateBtn").on("click", function(e){
		var review = {
				review_id : reviewModal.data("review_id"),
				review_content : reviewModal.find("textarea[name='review_content']").val(),
				review_reviewer : reviewModal.find("input[name='review_reviewer']").val(),
				review_rating : reviewModal.find("input[name='review_rating']:checked").val(),
				product_id : productID
		};
		reviewService.update(review, function(result){
			alert("result: "+result);
			reviewModal.modal("hide");
			showList(1);
		});
	});

	// review delete
	$(".reviews-tab-desc").on("click", "ul li .review-delete", function(e){
		e.preventDefault();
		
		var review_id = $(this).attr("href");
		var originalReviewer = $(this).data('reviewer');
		
		if(!user){
			alert("로그인 후 삭제가 가능합니다.");
			return;
		}
		if( user != originalReviewer){
			alert("자신이 작성한 리뷰만 삭제가 가능합니다.");
			return;
		}
		reviewService.remove(review_id, originalReviewer, function(result){
				alert("remove result:"+result);
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
	
	// ========= reply =============
	// show reply register modal
	var replyModal = $("#replyModal");
	$(".reviews-tab-desc").on("click", "ul li .reply-register", function(e){
		e.preventDefault();
		
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			alert("관리자만 답글을 쓸 수 있습니다.");
			return;
		</sec:authorize>
		replyModal.find("textarea[name='reply_content']").val("");
		replyModal.find("input[name='reply_replier']").val(user);
		replyModal.data("review_id", $(this).data('id'));
		replyModal.find("button[id='replyRegisterBtn']").show();
		replyModal.find("button[id='replyUpdateBtn']").hide();
		replyModal.modal("show");
	});
	
	// reply register
	$("#replyRegisterBtn").on("click",function(e){
		var reply = {
				review_content : replyModal.find("textarea[name='reply_content']").val(),
				review_reviewer : replyModal.find("input[name='reply_replier']").val(),
				review_id : replyModal.data("review_id")
		};
		replyService.add(reply, function(result){
			alert("register reply result: " + result);
			replyModal.modal("hide");
			showList(1);
		});
	});
	
	// reply update modal show
	$(".reviews-tab-desc").on("click", "ul li .reply-update", function(e){
		e.preventDefault();
		
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			alert("관리자만 답글을 수정할 수 있습니다.");
			return;
		</sec:authorize>
		
		var reply_id = $(this).attr("href");
		
		replyService.get(reply_id, function(reply){
			console.log(reply);
			replyModal.find("textarea[name='reply_content']").val(reply.review_content);
			replyModal.find("input[name='reply_replier']").val(user);
			replyModal.find("button[id='replyRegisterBtn']").hide();
			replyModal.find("button[id='replyUpdateBtn']").show();
			replyModal.data("reply_id", reply.reply_id);
			replyModal.modal("show");
		});
	});
	
	// reply update
	$("#replyUpdateBtn").on("click", function(e){
		var reply = {
				reply_id : replyModal.data("reply_id"),
				review_content : replyModal.find("textarea[name='reply_content']").val(),
				review_reviewer : replyModal.find("input[name='reply_replier']").val()
		};
		replyService.update(reply, function(result){
			alert("result: "+result);
			replyModal.modal("hide");
			showList(1);
		});
	});
	
	// reply delete
	$(".reviews-tab-desc").on("click", "ul li .reply-delete", function(e){
		e.preventDefault();
		
		if(!user){
			alert("로그인 후 삭제가 가능합니다.");
			return;
		}
		
		var reply_id = $(this).attr("href");
		
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
	
	var msg="${insertmsg}"

	if(msg=="SUCCESS"){
		alert("성공적으로 추가되었습니다!");
		}else if(msg=="FAIL"){
		alert("이미 장바구니에 존재하는 상품입니다");
	}	
	
	$("#customSubmit2").on("click", function(e){
		
		$("#cartform").submit();
		
	});
	
 });
 	
	
	
	
	
	
	

 


 
</script>