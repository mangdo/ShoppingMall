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
                                <h1 class="breadcrumbs-title">About Us</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>About Us</li>
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

            <!-- ABOUT SECTION START -->
            <div class="about-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-left ">
                                <h2 class="uppercase">about project</h2>
                                <h6 class="mb-40">프로젝트에 대한 간단한 설명입니다.</h6>
                            </div>
                        </div>
                    </div>                    
                    <div class="row">
                        <div class="col-md-5">
                            <div class="about-photo p-20 bg-img-1">
                                <img src="/resources/img/others/about.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="about-description mt-50">
                                <p>본 프로젝트는 Spring Framework를 이용한 쇼핑몰 웹 프로젝트입니다.</p>

                                <p>Back-end로 Java 8, Spring Framework 5.0.2, Maven 2.5.1, MyBatis 3.4.1 , MySQL, Spring Security 5.0.6을 사용하였고
									Front-end로 bootstrap 4, JQuery 3.1.1를 사용하였습니다.</p>
                                <p> 사용한 API로는 카카오 페이 API, 구글 지도 API, 카카오 메시지 API, 카카오 우편 서비스가 있습니다. 프로젝트 내에 @RestController와 Ajax를 이용하여 REST방식을 일부 적용하였습니다.</p>
                                <p> 사용 기술에 대한 더 자세한 내용은 아래 Github 링크를 참고해주세요. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ABOUT SECTION END --> 

            <!-- TEAM SECTION START -->
            <div class="team-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-left ">
                                <h2 class="uppercase">team member</h2>
                                <h6 class="mb-40">프로젝트를 진행한 팀원입니다.</h6>
                            </div>
                        </div>
                    </div>                
                    <div class="row">
                        <div class="active-team-member">
                            <!-- team-member start -->
                            <div class="col-md-12">
                                <div class="team-member box-shadow bg-shape">
                                    <div class="team-member-photo">
                                        <img src="/resources/img/team/1.png" alt="">
                                    </div>
                                    <div class="team-member-info pt-20">
                                        <h5 class="member-name"><a href="#">CHOI MIN SEO</a></h5>
                                        <p class="member-position">최민서</p>
                                        <p class="mb-20">&nbsp;&nbsp; 가톨릭대학교 정보통신 전자공학을 졸업하였고 재학 중 C, C++, Java, Python을 이용한 프로젝트를 진행하였습니다. 현재는 WEB 개발공부를 하고 있습니다.</p>
                                        <ul class="footer-social">
                                            <li>
                                                <a class="facebook" href="https://github.com/mangdo" title="Facebook"><i class="zmdi zmdi-github"></i></a>
                                            </li>
                                            <li>
                                                <a class="rss" href="https://doing7.tistory.com/" title="Tistory"><i class="zmdi zmdi-blogger"></i></a>
                                            </li>
                                        </ul>                                     
                                    </div>
                                </div>
                            </div>
                            <!-- team-member end -->
                            <!-- team-member start -->
                            <div class="col-md-12">
                                <div class="team-member box-shadow bg-shape">
                                    <div class="team-member-photo">
                                        <img src="/resources/img/team/2.png" alt="">
                                    </div>
                                    <div class="team-member-info pt-20">
                                        <h5 class="member-name"><a href="#">Nancy holland</a></h5>
                                        <p class="member-position">Chairman</p>
                                        <p class="mb-20">There are many variations of passages of brands available.There are many variations of passage of Lorem Ipsum available, but the in majority have suffered.</p>
                                        <ul class="footer-social">
                                            <li>
                                                <a class="facebook" href="" title="Facebook"><i class="zmdi zmdi-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a class="google-plus" href="" title="Google Plus"><i class="zmdi zmdi-google-plus"></i></a>
                                            </li>
                                            <li>
                                                <a class="twitter" href="" title="Twitter"><i class="zmdi zmdi-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a class="rss" href="" title="RSS"><i class="zmdi zmdi-rss"></i></a>
                                            </li>
                                        </ul>                                     
                                    </div>
                                </div>
                            </div>
                            <!-- team-member end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- TEAM SECTION END -->             
        </section>
        <!-- End page content -->

<%@include file="/WEB-INF/views/layout/foot.jsp" %>