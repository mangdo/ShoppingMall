<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layout/top.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Login</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>Login</li>
                                    <li><a href="/mypage/newCustomers">Register</a></li>
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
                        <div class="col-md-6">
                            <div class="registered-customers">
                            	<div class="section-title text-left">
                            		<h2 class="uppercase">Login</h2>
                            		<h6 class="mb-40">로그인을 통해 더 편리하고 다양한 기능을 즐기세요.</h6>
                            	</div>
                                <form id="my-form" action='<c:url value="/mypage/login"/>' method="post">
                                    <div class="login-account p-30 box-shadow">
                                        <p><c:out value = "${error}"/></p>
                                    
                                        <h2><c:out value = "${logout}"/></h2>
                                        	<input type="text" name="email" placeholder="Email">                                    
                                        	<input type="password" name="userpw" placeholder="Password">
                                     
                                        <p><a href="/mypage/newCustomers">아이디가 없으시다면 회원가입을 해주세요!</a></p>
                                        <button class="submit-btn-1 btn-hover-1" type="submit">로그인</button>
                                        <button class="submit-btn-1 btn-hover-1" type="button" style="background-color : #575757;"onClick="location.href='/mypage/newCustomers'">회원가입</button>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_crsf.token}"  />
                                    	</div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- LOGIN SECTION END -->
        </div>
        <!-- End page content -->
<%@include file="/WEB-INF/views/layout/foot.jsp" %>

                             