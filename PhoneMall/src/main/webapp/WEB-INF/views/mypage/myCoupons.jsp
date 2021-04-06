<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layout/top.jsp" %>

        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">My Coupons</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li><a href="/myPurchase">myPurchase</a></li>
                                    <li><a href="/mypage/myInfo">MyInfo</a></li>
                                    <li><a href="/mypage/myReviews">myReviews</a></li>
                                    <li>MyCoupons</li>
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
						<div class= "col-md-12">
							<div class="section-title text-left mb-40">
								<h2 class="uppercase">my Coupons</h2>
								<h6>쿠폰을 등록하고 조회할 수 있습니다.</h6>
							</div>
						</div>
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
                    	<table style="width:730px;">
							  <c:forEach var="row" items="${list}"  varStatus="varstatus">
								<tr id="used" style="height: 250px; background-image: url('/resources/img/slider/slider-2/coupondesign2.png');">
									<input type="hidden" value="${row.used}" class="used">
									<td>
										<div style="padding-left:70px; z-index:0;  padding-bottom: 30px; color:rgb(255, 127, 0); font-size: 50px;" class="coupon_title">${row.coupon_List[0].coupon_name}</div>
										<div style="color:black; z-index:0;  padding-left:70px; font-size:15px;" class="coupon_description">${row.coupon_List[0].coupon_description}</div>
										<div style="z-index:0; color:black; padding-left:70px;" class="coupon_date"><fmt:formatDate var="resultRegDt" value="${row.startDate}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="resultRegDt2" value="${row.endDate}" pattern="yyyy-MM-dd"/>
									사용 기한: ${resultRegDt} ~ ${resultRegDt2}</div>
									
									</td>							    
								</tr>
							   </c:forEach> 
						</table>
						<br>
						<p>*모든 쿠폰은 중복 사용이 불가합니다*</p>	
						
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/layout/foot.jsp" %>
		
<script type="text/javascript">
var el =  document.getElementsByClassName("used");
console.log(el);
for(let i=0 ; i<el.length; i++) {
	if(el[i].value=="사용 완료"){
		el[i].parentNode.style.backgroundImage = "url('/resources/img/slider/slider-2/usedcoupondesign2.png')";
	}
	
	if(el[i].value=="기간 만료"){
		el[i].parentNode.style.backgroundImage = "url('/resources/img/slider/slider-2/expiredcoupondesign2.png')";
	}
	}

var msg="${msg}";

if(msg=="SUCCESS"){
	alert("쿠폰이 성공적으로 추가되었습니다!");
	}else if(msg=="FAIL"){
	alert("쿠폰 코드가 맞지 않습니다. 다시 확인해주세요");
}	



</script>	
					