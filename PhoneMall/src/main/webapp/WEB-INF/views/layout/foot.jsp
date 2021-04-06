<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
    
<!-- START FOOTER AREA -->
        <footer id="footer" class="footer-area section">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="plr-185">
                        <div class="footer-top-inner gray-bg">
                            <div class="row">
                                <div class="col-lg-4 col-md-5 col-sm-4">
                                    <div class="single-footer footer-about">
                                        <div class="footer-logo">
                                            <img src="/resources/img/logo/logo.png" alt="">
                                        </div>
                                        <div class="footer-brief">
                                            <p>본 프로젝트는 Spring Framework을 이용한 쇼핑몰 웹 프로젝트입니다.</p>
                                            <p>Java8, Spring Framework 5.0, MyBatis, MySQL, Spring Security, bootstrap4, JQuery 3.0, 카카오와 구글 API를 사용하였으며 REST방식을 일부 적용하였습니다.</p>
                                        </div>
                                        <ul class="footer-social">
                                            <li>
                                                <a class="facebook" href="https://github.com/mangdo/shoppingMallProject" title="github"><i class="zmdi zmdi-github"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-2 hidden-md hidden-sm">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">Menu</h4>
                                        <ul class="footer-menu">
                                            <li>
                                                <a href="/product/list"><i class="zmdi zmdi-circle"></i><span>Products</span></a>
                                            </li>
                                            <li>
                                                <a href="/notice/list"><i class="zmdi zmdi-circle"></i><span>Notice</span></a>
                                            </li>
                                            <li>
                                                <a href="/about"><i class="zmdi zmdi-circle"></i><span>About Us</span></a>
                                            </li>
                                            <li>
                                                <a href="/contact"><i class="zmdi zmdi-circle"></i><span>Contact</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-3 col-sm-4">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">my page</h4>
                                        <ul class="footer-menu">
                                            <li>
                                                <a href="/myPurchase"><i class="zmdi zmdi-circle"></i><span>My Purchase</span></a>
                                            </li>
                                            <li>
                                                <a href="/mypage/myReviews"><i class="zmdi zmdi-circle"></i><span>My Reviews</span></a>
                                            </li>
                                            <li>
                                                <a href="/mypage/myCoupon"><i class="zmdi zmdi-circle"></i><span>My Coupon</span></a>
                                            </li>
                                            <li>
                                                <a href="/mypage/myInfo"><i class="zmdi zmdi-circle"></i><span>My Info</span></a>
                                            </li>
                                            <li>
                                                <a href="/mypage/wishList"><i class="zmdi zmdi-circle"></i><span>My Wishlist</span></a>
                                            </li>
                                            <li>
                                                <a href="/purchase/viewCart"><i class="zmdi zmdi-circle"></i><span>My Cart</span></a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">Get in touch</h4>
                                        <div class="footer-message">
                                            <form class="contact-form" action="/mail/send" method="post">
                                                <input type="text" name="name" placeholder="Your name here...">
                                                <input type="text" name="email" placeholder="Your email here...">
                                                <textarea class="height-80" name="message" placeholder="Your messege here..."></textarea>
                                                <button class="submit-btn-1 mt-20 btn-hover-1" type="submit">submit message</button> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </footer>
        <!-- END FOOTER AREA --> 
    </div>
    <!-- Body main wrapper end -->


    <!-- Placed JS at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="/resources/js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- jquery.nivo.slider js -->
    <script src="/resources/lib/js/jquery.nivo.slider.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="/resources/js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="/resources/js/main.js"></script>

	<!-- cartPreview -->
	<sec:authorize access="isAuthenticated()">
		<script src="/resources/js/ajax-cartPreview.js"></script>
	</sec:authorize>
	
	<!-- ajax-mail js -->
    <script src="/resources/js/ajax-mail.js"></script>
	<script>
	// 검색
	var topSearchForm = $("#topSearchForm");
	
	$("#topSearchForm button").on("click",function(e){
		var word = $.trim(topSearchForm.find("input[name='keyword']").val());
		if(!word || word==""){
			alert("키워드를 입력하세요");
			return false;
		}
		
		topSearchForm.find("input[name='pageNum']").val("1");
		topSearchForm.find("input[name='keyword']").val(word);
		e.preventDefault();
		
		topSearchForm.submit();
	});

	</script>
</body>

</html>