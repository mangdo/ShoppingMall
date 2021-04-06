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
                                <h1 class="breadcrumbs-title">My purchase details</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li><a href="/myPurchase">MyPurchase</a></li>
                                    <li><a href="/mypage/myInfo">MyInfo</a></li>
                                    <li><a href="/mypage/myReviews">MyReviews</a></li>
                                    <li><a href="/mypage/myCoupon">MyCoupons</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->
        <!-- 	주문 조회/변경/취소 -->
        <div class="container">
        	<div class="row">
        		<div class="col-md-12 mb-30">
        			<div class="section-title text-left mb-20">
						<h2 class="uppercase">주문 상세 조회</h2>
						<h6 >기본 정보와 배송 정보를 확인할 수 있습니다.</h6>
					</div>
        			<table class="table table-bordered" style="color:rgb(0, 0, 0);">
					  <tbody>
					    <tr>
					      <th scope="row">주문하신 분</th>
					      <td>${purchaseInfo[0].firstname} ${purchaseInfo[0].lastname}</td>
					     </tr>
					     <tr>
					      <th scope="row">주문 번호</th>
					      <td>${purchaseInfo[0].purchase_id}</td>
					     </tr>
					     <tr>
					      <th scope="row">배송 상태</th>
					      <td>배송 완료   <br/><a class="button extra-small button-black mb-20" href="#"><span>배송추적 </span> </a></td>
					    </tr>
					    <tr>
					      <th scope="row">배송 주소</th>
					      <td>${purchaseInfo[0].address}</td>
					     </tr>
					     <tr>
					      <th scope="row">전화번호</th>
					      <td>${purchaseInfo[0].phonenum}</td>
					     </tr>
					  </tbody>
					</table>
        		</div>
        		<div class="col-md-12">
        			<div class="section-title text-left mb-20">
						<h2 class="uppercase">결제 조회</h2>
						<h6>결제 정보를 확인 할 수 있습니다.</h6>
					</div>
        			<table class="table table-bordered" style="color:rgb(0, 0, 0);">
					  <tbody>
					    <tr>
					      <th scope="row">주문상품</th>
					      <td><c:forEach var="row" items="${orderList}"  varStatus="varstatus"><a href='/product/get?product_id=${row.product_id}'>${row.product_title}</a> x ${row.product_qty} (${row.product_color})<br/></c:forEach></td> <!-- 주문 상품 명 표시 -->
					     </tr>
					     <tr>
					      <th scope="row">총 주문 금액</th>
					      <td>${purchaseInfo[0].discount_result}</td>
					     </tr>
					     <tr>
					      <th scope="row">결제 방법</th>
					      <td>${purchaseInfo[0].paymentMethod}</td>
					    </tr>
					  </tbody>
					</table>
        		</div>
        	</div>
        </div>
        
<%@include file="/WEB-INF/views/layout/foot.jsp" %>