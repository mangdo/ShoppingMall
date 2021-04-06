<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>

        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">My Info</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li><a href="/myPurchase">myPurchase</a></li>
                                    <li>MyInfo</li>
                                    <li><a href="/mypage/myReviews">myReviews</a></li>
                                    <li><a href="/mypage/myCoupon">MyCoupons</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="section-title text-left mb-40">
						<h2 class="uppercase">my info</h2>
						<h6 >개인 정보를 조회 및 변경 할 수 있습니다.</h6>
					</div>
					<a type="button" class="btn btn-primary btn-sm mb-10" href="/mypage/infoModify">회원 정보 변경하기</a>
        			<table class="table table-bordered" style="color:rgb(0, 0, 0);">
					  <tbody>
					    <tr>
					      <th scope="row">이메일</th>
					      <td><sec:authentication property="principal.user.email"/></td>
					    </tr>
					    <tr>
					      <th scope="row">이름</th>
					      <td><sec:authentication property="principal.user.lastname"/>  <sec:authentication property="principal.user.firstname"/></td>					  
					    </tr>
					    <tr>
					      <th scope="row">우편번호</th>
					      <td><sec:authentication property="principal.user.postalcode"/></td>
					    </tr>
					    <tr>
					      <th scope="row">주소</th>
					      <td><sec:authentication property="principal.user.address"/></td>
					    </tr>
					    <tr>
					      <th scope="row">휴대번호</th>
					      <td><sec:authentication property="principal.user.phonenum"/></td>
					    </tr>
					    
					  </tbody>
					</table>					
				</div>
			</div>
		</div>
		
<%@include file="/WEB-INF/views/layout/foot.jsp" %>        		