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
                                <h1 class="breadcrumbs-title">Contact</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>Contact</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper">

            <!-- ADDRESS SECTION START -->
            <div class="address-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-pin"></i>
                                <h6>House 06, Road 01, Katashur, Mohammadpur,</h6>
                                <h6>Dhaka-1207, Bangladesh</h6>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-phone"></i>
                                <h6>(+880) 1945 082759</h6>
                                <h6>(+880) 1945 082759</h6>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-email"></i>
                                <h6>companyname@gmail.com</h6>
                                <h6>info@domainname.com</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ADDRESS SECTION END --> 
            
            <!-- GOOGLE MAP SECTION START -->
            <div class="google-map-section">
                <div class="container-fluid">
                    <div class="google-map plr-185">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
            <!-- GOOGLE MAP SECTION END -->
            
            <!-- MESSAGE BOX SECTION START -->
            <div class="message-box-section mt--50 mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="message-box box-shadow white-bg">
                                <form id="contact-form" action="mail.php" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4 class="blog-section-title border-left mb-30">get in touch</h4>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="name" placeholder="Your name here">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="email" placeholder="Your email here">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="subject" placeholder="Subject here">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="phone" placeholder="Your phone here">
                                        </div>
                                        <div class="col-md-12">
                                            <textarea class="custom-textarea" name="message" placeholder="Message"></textarea>
                                            <button class="submit-btn-1 mt-30 btn-hover-1" type="submit">submit message</button>
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