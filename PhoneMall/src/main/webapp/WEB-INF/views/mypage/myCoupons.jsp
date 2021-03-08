<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layout/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                    <li><a href="/myCoupon">MyCoupons</a></li>
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
					<div>
                    	<div class="col-md-6">
                    	  <form name="form1" action="/mypage/searchAndInsertCoupon" method="GET">
                            <div class="coupon-discount box-shadow p-30 mb-50">
                                 <h6 class="widget-title border-left mb-20">coupon discount</h6>
                                 <p>Enter your coupon code if you have one!</p>
                                 <input type="text" name="coupon_code" placeholder="Enter your code here."/>
                                 <button id="coupon_list" class="submit-btn-1 black-bg btn-hover-2" type="submit">register</button>
                            </div>
                          </form>
                        </div>
                    	<table class="table table-bordered" style="color:rgb(0, 0, 0);">
							<thead>
								<tr>
									<th scope="col" class="text-center" style="width:200px;">쿠폰명</th>
									<th scope="col" class="text-center" style="width:400px;">쿠폰 내용</th>
									<th scope="col" class="text-center" style="width:300px;">사용 가능 기한</th>
									<th scope="col" class="text-center">사용 가능 여부</th>									
								</tr>
							</thead>
							<tbody style="font-size:20px;">
								
							  <c:forEach var="row" items="${list}"  varStatus="varstatus">
								<tr>
									<td align="center">${row.coupon_List[0].coupon_name}</td>
									<td align="center">${row.coupon_List[0].coupon_description}</td>
									<fmt:formatDate var="resultRegDt" value="${row.startDate}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="resultRegDt2" value="${row.endDate}" pattern="yyyy-MM-dd"/>
									<td align="center">${resultRegDt} ~ ${resultRegDt2}</td>
									<td align="center">${row.used}</td>								    
								</tr>
							   </c:forEach> 
							</tbody>
						</table>
						
						<p>*모든 쿠폰은 중복 사용이 불가합니다*</p>	
						<div class="mb-80">
							<div>${msg}</div>
			            	<div class="row">
			             		<div class="col-xs-12">
			                 		<!-- shop-pagination start -->
			                    	<ul class="shop-pagination box-shadow text-center ptblr-10-30">
			                    		<li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
			                    		<li><a href="#">01</a></li>
			                     		<li><a href="#">02</a></li>
			                     		<li><a href="#">03</a></li>
			                     		<li><a href="#">...</a></li>
			                     		<li><a href="#">05</a></li>
			                      		<li class="active"><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
			                     	</ul>
			                     	<!-- shop-pagination end -->
			                    	</div>
			                 </div> 
			              </div> 
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript">
		window.onload = function() {
			var header = document.getElementById('coupon_list');
			var message = "${msg}";
			var url = "${url}";
			console.log(message);
			header.onclick = function() { 
				alert(message); 
				
				}
			};

</script>	
					