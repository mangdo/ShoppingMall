<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layout/top.jsp" %>

 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Product Register Form</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Product</a></li>
                                    <li>Register Form</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->   

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper section">

            <!-- MESSAGE BOX SECTION START -->
            <div class="message-box-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="message-box box-shadow white-bg">
                                <form action="/product/register" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4 class="blog-section-title border-left mb-30">제품 등록</h4>
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="text" name="product_title" placeholder="Product Tittle">
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="text" name="product_price" placeholder="Product Price">
                                        </div>
                                        <div class="col-lg-12">
                                        	<div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">Color</p>
                                                    <div class="widget-color f-left">
                                                        <ul>
                                                            <li class="color-1">
                                                            	<input type="checkbox" id="color" name="color"> &nbsp;
                                                            </li>
                                                            <li class="color-2">
                                                                <input type="checkbox" id="color" name="color"> &nbsp;                                              
                                                            </li>
                                                            <li class="color-3">
                                                            	<input type="checkbox" id="color" name="color"> &nbsp;
                                                            </li>
                                                            <li class="color-4">
                                                            	<input type="checkbox" id="color" name="color"> &nbsp;
                                                            </li>
                                                            <li class="color-5">
                                                            	<input type="checkbox" id="color" name="color"> &nbsp;
                                                            </li>
                                                            <li class="color-6">
                                                            	<input type="checkbox" id="color" name="color"> &nbsp;
                                                            </li>
                                                        </ul>
                                                        <br/>
                                                    </div>
                                                </div>
                                        	</div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            <textarea class="custom-textarea" name="product_description" placeholder="제품 설명"></textarea>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit">등록</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="reset" style="background-color : #575757;">초기화</button>
                                        </div>

                                    </div>
                                </form>
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- MESSAGE BOX SECTION END -->               
        </section>
        <!-- End page content -->
 
 
 <%@include file="/WEB-INF/views/layout/foot.jsp" %>