<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>


        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">My Purchase</h1>
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
        
        <!-- Start page content -->
        <div id="page-content" class="page-wrapper">

            <!-- LOGIN SECTION START -->
            <div class="login-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                        	<div class="section-title text-left ">
								<h2 class="uppercase">my purchase</h2>
								<h6 class="mb-40">나의 구매 내역을 확인할 수 있습니다.</h6>
							</div>
					    	<div class="account_select01">
					        	<select id="select_searchYearSel" class="Searchselect_01" title="연도 선택">
					            	<option value="0" selected>전체보기</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option>
					            </select><span style="color: #636363; font-weight: bold;"> 년</span>
					
					             <select id="select_searchMonthSel" class="Searchselect_01" title="월 선택">
					             	<option value="0" selected>전체보기</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
					              </select><span style="color: #636363; font-weight: bold;"> 월</span>
					             &nbsp;
					     		 <button id="keywordButton"class="submit-btn-1 btn-hover-1" style="background-color : #575757;">검색</button>
					     	</div>
						</div>
					</div>
					<br>
                    <div>
                                <div class="tab-pane" id="wishlist">
                                    <div class="wishlist-content">
                                        <form action="#">
                                            <div class="table-content table-responsive mb-50">
                                                <table class="text-center">
                                                    <thead>
                                                        <tr>
                                                        
                                                            <th class="product-thumbnail">상품정보</th>
                                                            <th class="product-price">주문일자</th>
                                                            <th class="product-stock">주문번호</th>
                                                            <th class="product-add-cart">주문금액</th>
                                                            <th class="product-remove">리뷰작성</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	<c:forEach var="row" items="${list}"  varStatus="varstatus">
                                                        <!-- tr -->
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img" style="position:relative; padding-top:30%; display:block;">
                                                                    <img id = 'main-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'"
                                                                    style="position:absolute; top:0; left:0;width:100%;height:100%">
                                                                </div>
                                                                <script>
			                                            			var imageName = encodeURIComponent('${row.product_image.image_uploadPath}'+'/s_'+'${row.product_image.image_uuid}'+'_'+'${row.product_image.image_name}');
			                                            			var realSrc = '/product/display?fileName='+imageName;
			                                            	
			                                        				document.getElementById('main-img${varstatus.index}').src= realSrc;
																</script>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href='/product/get?product_id=${row.product_id}'>${row.product_title}</a>
                                                                    </h6>
                                                                    
                                                                    <p>선택 색상 : ${row.product_color}</p>
                                                                	<p>선택 수량 : ${row.product_qty} </p>
                                                                </div>
                                                            </td>
                                                            <fmt:formatDate var="resultRegDt" value="${row.purchase_date}" pattern="yyyy-MM-dd"/>
                                                            <td class="product-price"> ${resultRegDt} </td>
                                                            <td class="product-stock"><a class="move" href="/myInquiry/${row.purchase_id}" style="color:blue;">${row.purchase_id}</a></td>
                                                            
                                                            <td class="product-price">${row.product_price} 원</td>
                                                            <td class="product-price" id="review${varstatus.index}">
                                                            	<c:if test="${row.order_status eq 0 }">
                                                                	<a class="button extra-small button-black reviewModalBtn" href="${row.product_id}" data-review = "${varstatus.index}" data-order = "${row.order_id}"><span>작성하기</span></a>
                                                            	</c:if>
                                                            	<c:if test="${row.order_status ne 0 }">
                                                                	작성완료
                                                            	</c:if>
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- wishlist end -->
						<form id="actionForm" action="/myPurchase" method="get">
							<input type="hidden" name='pageNum' value='<c:out value ="${pageMaker.cri.pageNum}"/>'>
							<input type="hidden" name='amount' value='<c:out value ="${pageMaker.cri.amount}"/>'>
							<input type="hidden" name='keyword' id="keyword" value='<c:out value ="${pageMaker.cri.keyword}"/>'>
						</form>	
						<div class="mb-80">
			            	<div class="row">
			             		<div class="col-xs-12">
			                 		<!-- shop-pagination start -->
			                    	<ul class="shop-pagination box-shadow text-center ptblr-10-30">
                                	<c:if test = "${pageMaker.prev}">
                                		<li class="paginate_button"><a href="${pageMaker.startPage - 1}">
                                		<i class="zmdi zmdi-chevron-left"></i>
                                		</a></li>
                                	</c:if>
                                    
                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    	<c:if test="${num eq pageMaker.cri.pageNum}">
                                    		<li class="paginate_button active"><a href="${num}">${num}</a></li>
                                    	</c:if>
                                    	<c:if test="${num ne pageMaker.cri.pageNum}">
                                    		<li class="paginate_button"><a href="${num}">${num}</a></li>
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
		</div>

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
            	<input type="hidden" name="product_id">
            	<input type="hidden" name="order_id">
            </div><!-- .modal-body -->
            
            <div class="modal-footer">
            	<button id="reviewRegisterBtn" class="submit-btn-1 btn-hover-1" type="button">등록</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
    </div><!-- .modal-dialog -->
</div>
<!-- END review Modal -->
<%@include file="/WEB-INF/views/layout/foot.jsp" %>
<script type="text/javascript" src="/resources/js/review.js"></script>

<script>
$(document).ready(function(){
	
	// Setting Year, Month
	var keyword = $("#keyword").val();
	if(keyword != ''){
		var year = keyword.substr(0,4);
		var month = keyword.substr(4,2);
		$("#select_searchYearSel").val(year);
		$("#select_searchMonthSel").val(month);
		
	}
	
	// Pagination
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		
	});
	
	// Search by Year, Month
	$("#keywordButton").on("click",function(e){
		e.preventDefault();
		var a = $("#select_searchYearSel option:selected").val();
		var b = $("#select_searchMonthSel option:selected").val();
		if(a=="0" && b=="0"){
			actionForm.find("input[name='pageNum']").val(1);
			actionForm.find("input[name='keyword']").val("");
			actionForm.submit();
			return;
		}
		if(a=="0"){
			alert("년도를 선택해주세요.");
			return;
		}
		if(b=="0"){
			alert("월을 선택해주세요")
			return;
		}
		
		actionForm.find("input[name='pageNum']").val(1);
		actionForm.find("input[name='keyword']").val(""+a+b);
		actionForm.submit();
	});
	
	// Review
	var user = "";
	<sec:authorize access="isAuthenticated()">
		user ='<sec:authentication property="principal.username"/>';
	</sec:authorize>
		
	var reviewModal = $("#reviewModal");
	$('.reviewModalBtn').on("click", function(e){
		e.preventDefault();
		reviewModal.modal("show");
		reviewModal.find("input[name='review_reviewer']").val(user);
		reviewModal.find("textarea[name='review_content']").val("");
		reviewModal.find("button[id='reviewRegisterBtn']").attr("data-review",$(this).attr("data-review"));
		reviewModal.find("input[name='product_id']").val($(this).attr("href"));
		reviewModal.find("input[name='order_id']").val($(this).attr("data-order"));
	});
	
	// review register
	$("#reviewRegisterBtn").on("click",function(e){
		var id = "#review"+$(this).attr("data-review");
		var review = {
				review_content : reviewModal.find("textarea[name='review_content']").val(),
				review_reviewer : reviewModal.find("input[name='review_reviewer']").val(),
				review_rating : reviewModal.find("input[name='review_rating']:checked").val(),
				product_id : reviewModal.find("input[name='product_id']").val(),
				order_id : reviewModal.find("input[name='order_id']").val()
		};
		reviewService.add(review, function(result){
			alert("result: "+result);
			reviewModal.modal("hide");
			
			var a = id +" a";
			$(a).remove();
			$(id).append("작성완료");
		});
	});
});
</script>