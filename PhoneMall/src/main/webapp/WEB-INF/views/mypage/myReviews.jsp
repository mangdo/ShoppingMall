<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>

<!-- BREADCRUMBS SETCTION START -->
<div class="breadcrumbs-section plr-200 mb-80">
    <div class="breadcrumbs overlay-bg">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="breadcrumbs-inner">
                        <h1 class="breadcrumbs-title">My Reviews</h1>
                        <ul class="breadcrumb-list">
                            <li><a href="/">Home</a></li>
                            <li><a href="/myPurchase">Purchase</a></li>
                            <li><a href="/myInfo">MyInfo</a></li>
                            <li><a href="/myReviews">Reviews</a></li>
                            <li><a href="/mypage/myCoupon">MyCoupons</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BREADCRUMBS SETCTION END -->

<div id="page-content" class="page-wrapper">

	<!-- LOGIN SECTION START -->
	<div class="login-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
					<div class="section-title text-left ">
						<h2 class="uppercase">my reviews</h2>
						<h6 class="mb-40">내가 작성한 리뷰 내역을 확인할 수 있습니다.</h6>
					</div>
					<ul class="box-shadow p-30">

					<c:forEach items="${reviewList}" var="review" varStatus="status">
					<!-- review -->
					<c:if test="${review.review_rating != 0}">
					<c:if test="${status.first }">
						<c:set var="cnt" value='-1'/>
					</c:if>
						<c:set var="cnt" value="${cnt+1}"/>
					<li class="p-20" >
							<div class="row">
							<div class="product-img col-sm-2 col-xs-3 col-md-1">
	                            <a class ='move' href='product/get?product_id=<c:out value="${productList[cnt].product_id}"/>'>	                            	
                                    <img id='main-img${status.index}'  alt="image error" onError ="this.src='/resources/img/product/9.jpg'">
                                    <script>
                                   	var imageName = encodeURIComponent('${productList[cnt].product_imageList[0].image_uploadPath}'+'/s_'+'${productList[cnt].product_imageList[0].image_uuid}'+'_'+'${productList[cnt].product_imageList[0].image_name}');
                                   	var realSrc = '/product/display?fileName='+imageName;
                                   	
                               		document.getElementById('main-img${status.index}').src= realSrc;
									</script>
	                            </a>
	                        </div>
	                        <div class="col-md-11">
								<div class="row" >
				                    <h6 class="widget-title">
			                       	<a class ='move'href='product/get?product_id=<c:out value="${productList[cnt].product_id}"/>'><c:out value="${productList[cnt].product_title}"/></a>
			                        </h6>
			                        <h6 class="brand-name mb-15">
			                   		 <c:out value="${productList[cnt].product_brand}"/> / <c:out value="${productList[cnt].product_type}"/> /
			                   		  <c:out value="${productList[cnt].product_carrier}"/>
			                   	    </h6>
								</div>
							</div>
							</div>
							<hr style="margin:15px; margin-left:0px">
							<ul class="reply-delate pull-right">
		                        	<li><a class="review-update" href='${review.review_id}' data-reviewer='${review.review_reviewer}'>수정</a></li>
		                        	<li>/</li> 
		                        	<li><a class= "review-delete" href='${review.review_id}' data-reviewer='${review.review_reviewer}'>삭제</a></li>
		                        </ul>
							<div>
								<div class="pro-rating">
			                        <c:forEach var="i" begin="1" end="${review.review_rating }" >
	                              		<a><i class="zmdi zmdi-star"></i></a>
	                              		<c:set var="rating">${i}</c:set>
	                              	</c:forEach>
	                              	<c:forEach var="i" begin="${review.review_rating}" end="4">
                                    	<a><i class="zmdi zmdi-star-outline"></i></a>
                                    </c:forEach>
		                        	<br>
		                        	<fmt:formatDate value="${review.review_regDate }" type="both"/>
		                        	<c:if test="${review.review_updateDate ne null}">
		                        		<br><fmt:formatDate value="${review.review_regDate }" type="both"/>(수정됨)
		                        	</c:if>
		                        </div>
		                        <c:out value="${review.review_content }"/>
							</div>
							</li>
							
							<!-- this review has no reply-->
							<c:if test="${reviewList[status.index+1].review_rating!=0 }">
								<hr style="border-bottom: 2px solid #999999; margin:0px;">
							</c:if>
					</c:if>
					
					<!-- reply -->
					<c:if test="${review.review_rating == 0}">
					<li class="p-30" style="padding-top:0px">							
						<div class="media mt-10" style="background-color:#f6f6f6; padding:15px">
							<div class="media-body">
								<div class="clearfix"> 
									<h6 class="media-heading">판매자</h6>
									<p class="mb-10"><fmt:formatDate value="${review.review_regDate }" type="both"/>
									<c:if test="${review.review_updateDate ne null}">
	                        			<br><fmt:formatDate value="${review.review_regDate }" type="both"/>(수정됨)
	                        		</c:if>
									</p>
									<p class="mb-0"><c:out value="${review.review_content }"/></p>									
								</div>
							</div>
						</div>
					</li>
					<hr style="border-bottom: 2px solid #999999;margin:0px;">
					</c:if>
				</c:forEach>
				</ul>
				<br>
				<!-- shop-pagination start -->
                       <ul class="shop-pagination box-shadow text-center ptblr-10-30">
                       	<c:if test = "${pageMaker.prev}">
                       		<li class="paginate_button"><a href="${pageMaker.startPage - 1}">
                       		<i class="zmdi zmdi-chevron-left"></i>
                       		</a></li>
                       	</c:if>
                           
                           <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                           	<c:if test="${num eq pageMaker.cri.pageNum}">
                           		<li class="paginate_button active"><a href="myReviews?page=${num}">${num}</a></li>
                           	</c:if>
                           	<c:if test="${num ne pageMaker.cri.pageNum}">
                           		<li class="paginate_button"><a href="myReviews?page=${num}">${num}</a></li>
                           	</c:if>
                           </c:forEach>
                           
                           <c:if test = "${pageMaker.next}">
                           	<li class="paginate_button active">
                           	<a href="${pageMaker.endPage + 1}">
                           	<i class="zmdi zmdi-chevron-right">
                           	</i></a></li>
                       	</c:if>
                       </ul>
                       <!-- shop-pagination end -->
				</div>
			</div>
			</div>	
		</div>
	</div>
</div>


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
<script type="text/javascript" src="/resources/js/review.js"></script>
<script>

<sec:authorize access="isAuthenticated()">
var user ='<sec:authentication property="principal.username"/>';
</sec:authorize>

// review delete
$(".review-delete").on("click", function(e){
	e.preventDefault();
	
	var review_id = $(this).attr("href");
	var originalReviewer = $(this).data('reviewer');
	
	if( user != originalReviewer){
		alert("자신이 작성한 리뷰만 삭제가 가능합니다.");
		return;
	}
	reviewService.remove(review_id, originalReviewer, function(result){
			alert("remove result:"+result);
			location.reload();
	});
});

// show review update modal
var reviewModal = $("#reviewModal");
$(".review-update").on("click", function(e){
	e.preventDefault();

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
		reviewModal.data("product_id", review.product_id);
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
			product_id : reviewModal.data("product_id")
	};
	reviewService.update(review, function(result){
		alert("result: "+result);
		reviewModal.modal("hide");
		location.reload();
	});
});

// there's no review yet
var myList = "<c:out value='${reviewList[0].review_id}'/>";
if(myList.length==0){
	console.log("00000");
	$(".shop-pagination").hide();
	$(".box-shadow").html("작성한 리뷰가 아직 없습니다.");
}
</script>