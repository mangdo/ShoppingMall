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
                        <div class="col">
					    	<div class="account_select01">
					        	<select id="select_searchYearSel" class="Searchselect_01" title="연도 선택">
					            	<option value="0" selected="">전체보기</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option>
					            </select><span style="color: #636363; font-weight: bold;"> 년</span>
					
					             <select id="select_searchMonthSel" class="Searchselect_01" title="월 선택">
					             	<option value="0" selected="">전체보기</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
					              </select><span style="color: #636363; font-weight: bold;"> 월</span>
					     	</div>
					
					        <div class="account_select02" style="width: 290px">
					        	<div class="order_search">
					            	<label for="search02" style="color: #636363; font-weight: bold;">주문검색</label>
					                <select id="select_searchTypeSel" class="Searchselect_01">
					                	<option value="1">주문상품</option><option value="2">주문번호</option><option value="3">수령인</option>
					                </select>
					        	</div>
					            <input class="keyword_search" type="text" title="검색어" onkeydown="">
					        </div>
						</div>
					</div>
					
					
					        
                    <div>
                    	<table class="table table-bordered" style="color:rgb(0, 0, 0);">
							<thead>
								<tr>
									<th scope="col" class="text-center">주문일</th>
									<th scope="col" class="text-center">주문번호</th>
									<th scope="col" class="text-center">수령인</th>
									<th scope="col" class="text-center">배송 주소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}"  varStatus="varstatus">
								<tr>
									<fmt:formatDate var="resultRegDt" value="${row.purchaseDate}" pattern="yyyy-MM-dd"/>
									<td align="center"> ${resultRegDt} </td>
									<td align="center"><a class="move" href="/myInquiry/${row.purchase_id}" style="color:blue;">${row.purchase_id}</a></td>
									<td align="center">${row.lastname} ${row.firstname}</td>
								    <td align="center">${row.address}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
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
					