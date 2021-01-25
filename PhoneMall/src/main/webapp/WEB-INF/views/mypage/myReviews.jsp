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
                        <h1 class="breadcrumbs-title">My Reviews</h1>
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

<div id="page-content" class="page-wrapper">

	<!-- LOGIN SECTION START -->
	<div class="login-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
					<div class="section-title text-left ">
						<h2 class="uppercase">my reviews</h2>
						<h6 class="mb-40">블라블라</h6>
					</div>
					<ul class="box-shadow p-30">
					
					<!-- 한번더 -->
					<li class="p-20" style="border-bottom: 2px solid #999999;">
							<div class="row">
							<div class="product-img col-sm-2 col-xs-3 col-md-1">
	                            <a class ='move' href='#'>
	                                <img id = 'main-img-listview' alt="image error" src ="/resources/img/product/9.jpg" onError ="this.src='/resources/img/product/9.jpg'">
	                            </a>
	                        </div>
	                        <div class="col-md-11">
								<div class="row" >
				                    <h6 class="widget-title">
			                       	<a class ='move' href='#'>상품제목</a>
			                        </h6>
			                        
			                        		                        
			                        <h6 class="brand-name mb-15">
			                   		 APPLE / phone / SKT
			                   	    </h6>
								</div>
							</div>
							</div>
							<hr style="margin:15px; margin-left:0px">
							<div>
								<div class="pro-rating">
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-half"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
		                        </div>
		                        hello, this is good.
							</div>
					</li>
										
					<!-- 한번더 -->
					<li class="p-20" style="border-bottom: 2px solid #999999;">
							<div class="row">
							<div class="product-img col-sm-2 col-xs-3 col-md-1">
	                            <a class ='move' href='#'>
	                                <img id = 'main-img-listview' alt="image error" src ="/resources/img/product/9.jpg" onError ="this.src='/resources/img/product/9.jpg'">
	                            </a>
	                        </div>
	                        <div class="col-md-11">
								<div class="row" >
				                    <h6 class="widget-title">
			                       	<a class ='move' href='#'>상품제목</a>
			                        </h6>
			                        
			                        		                        
			                        <h6 class="brand-name mb-15">
			                   		 APPLE / phone / SKT
			                   	    </h6>
								</div>
							</div>
							</div>
							<hr style="margin:15px; margin-left:0px">
							<div>
								<div class="pro-rating">
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-half"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
		                        </div>
		                        hello, this is good.
							</div>
					</li>
					
					<!-- 한번더 -->
					<li class="p-20" style="border-bottom: 2px solid #999999;">
							<div class="row">
							<div class="product-img col-sm-2 col-xs-3 col-md-1">
	                            <a class ='move' href='#'>
	                                <img id = 'main-img-listview' alt="image error" src ="/resources/img/product/9.jpg" onError ="this.src='/resources/img/product/9.jpg'">
	                            </a>
	                        </div>
	                        <div class="col-md-11">
								<div class="row" >
				                    <h6 class="widget-title">
			                       	<a class ='move' href='#'>상품제목</a>
			                        </h6>
			                        
			                        		                        
			                        <h6 class="brand-name mb-15">
			                   		 APPLE / phone / SKT
			                   	    </h6>
								</div>
							</div>
							</div>
							<hr style="margin:15px; margin-left:0px">
							<div>
								<div class="pro-rating">
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-half"></i></a>
		                           <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
		                        </div>
		                        hello, this is good.
							</div>
							
							<div class="media mt-10" style="background-color:#f6f6f6; padding:15px">
								<div class="media-body">
									<div class="clearfix"> 
										<h6 class="media-heading">판매자</h6>
										<p class="mb-10">2021/01/23 22:38:05</p>
										<p class="mb-0">답글을 단다</p>									
									</div>
								</div>
							</div>
					</li>
				</ul>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
                        


<%@include file="/WEB-INF/views/layout/foot.jsp" %>