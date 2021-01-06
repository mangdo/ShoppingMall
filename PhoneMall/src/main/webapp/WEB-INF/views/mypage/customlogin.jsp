<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>
<script src="/resources/js/vendor/jquery-3.1.1.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Login / Register</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>Login / Register</li>
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
                                <h6 class="widget-title border-left mb-50">REGISTERED CUSTOMERS</h6>
                                <form action='<c:url value="/mypage/login"/>' method="post">
                                    <div class="login-account p-30 box-shadow">
                                        <p>If you have an account with us, Please log in.</p>
                                        <h3><c:out value = "${error}"/></h3>
                                    
                                        <h2><c:out value = "${logout}"/></h2>
                                        	<input type="text" name="email" placeholder="Email">                                    
                                        	<input type="password" name="userpw" placeholder="Password">
                                     
                                        <p><small><a href="/mypage/newCustomers">If you don't have account, please join us!</a></small></p>
                                        <button class="submit-btn-1 btn-hover-1" type="submit">login</button>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_crsf.token}"  />
                                    	</div>
                                </form>
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

                             