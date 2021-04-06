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
                            <h1 class="breadcrumbs-title">Access Denied Page</h1>
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
                	<div class="col-md-3"> </div>
                    <div class="col-md-6">
                        <div class="registered-customers">

                            <div class="login-account p-30 box-shadow">
                            <div class="section-title row text-center">
                            	<div class="col-md-4"> </div>
                            	<img class="col-md-4 mb-30" alt="access denied" src="/resources/img/icon/warning.png">
                            	
                            	<h2 class="uppercase col-md-12 ">결제 실패</h2>

                        		<h5 class="mb-10 col-md-12">
                        			주문하신 내역의 결제가 실패되어 
                        			<br>
                        			주문을 완료하지 못했습니다.
                        		</h5>
                        		<h5 class="mb-40 col-md-12">
                        			확인 후 다시 시도하시거나 고객센터로 연락주십시오.
                        		</h5>
                        		<div class="col-md-12">
                        			<a class="button extra-small button-black" id='regBtn'><span>결제 다시하기</span></a>
                        		</div>
                            </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- LOGIN SECTION END -->
    </div>
    <!-- End page content -->
	

<%@include file="/WEB-INF/views/layout/foot.jsp" %>