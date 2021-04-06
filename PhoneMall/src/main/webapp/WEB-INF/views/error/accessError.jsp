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
                            	<img class="col-md-4 mb-30" alt="access denied" src="/resources/img/icon/lock.png">
                            	
                            	<h2 class="uppercase col-md-12 "><c:out value="${msg}"/></h2>
                        		<h4 class="mb-40 col-md-12">접근 권한이 없습니다.
                        			<br>
                        			담당자에게 문의하여 주시길 바랍니다.
                        		</h4>
                        		
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