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
					            	<option value="0" selected="">전체보기</option><option value="2020">2020</option><option value="2019">2019</option>
					            </select><span style="color: #636363; font-weight: bold;"> 년</span>
					
					             <select id="select_searchMonthSel" class="Searchselect_01" title="월 선택">
					             	<option value="0" selected="">전체보기</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
					              </select><span style="color: #636363; font-weight: bold;"> 월</span>
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
                                                            <th class="product-add-cart">주문금액(수량)</th>
                                                            <th class="product-remove">후기작성</th>
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
                                                            <td class="product-price">
                                                                <a class="button extra-small button-black" id='regBtn' ><span style="height:30px;padding:4px 20px">후기등록</span></a>
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
<script src="/resources/js/vendor/jquery-3.1.1.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		
	});
</script>	
					