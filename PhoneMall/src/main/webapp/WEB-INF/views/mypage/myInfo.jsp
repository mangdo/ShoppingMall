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
                                <h1 class="breadcrumbs-title">MyInfo</h1>
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
        <div class="container">
        	<div class="row">
        		<div class="col">
        			<h2>* 개인 정보 조회/변경</h2>
        			<table class="table table-bordered" style="color:rgb(0, 0, 0);">
					  <tbody>
					    <tr>
					      <th scope="row">아이디</th>
					      <td>id</td>
					    </tr>
					    <tr>
					      <th scope="row">이름</th>
					      <td>Jacob <a type="button" class="btn btn-primary btn-sm" href="#">변경하기</a></td>
					    </tr>
					    <tr>
					      <th scope="row">비밀번호</th>
					      <td>Jacob <a type="button" class="btn btn-primary btn-sm" href="#">변경하기</a></td>
					    </tr>
					    <tr>
					      <th scope="row">이메일 주소</th>
					      <td>Jacob <a type="button" class="btn btn-primary btn-sm" href="#">변경하기</a></td>
					    </tr>
					    <tr>
					      <th scope="row">주소</th>
					      <td>Jacob <a type="button" class="btn btn-primary btn-sm" href="#">변경하기</a></td>
					    </tr>
					    <tr>
					      <th scope="row">휴대번호</th>
					      <td>Jacob <a type="button" class="btn btn-primary btn-sm" href="#">변경하기</a></td>
					    </tr>
					    
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		
<%@include file="/WEB-INF/views/layout/foot.jsp" %>        		