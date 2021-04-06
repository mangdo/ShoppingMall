<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>

 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Wish list</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>Wishlist</li>
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
		
            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <ul class="cart-tab">
                            	<li>
                                    <a class="active" href="/mypage/wishList">
                                        <span>01</span>
                                        Wishlist
                                    </a>
                                </li>
                                <li>
                                    <a href="/purchase/viewCart">
                                        <span>02</span>
                                        Shopping cart
                                    </a>
                                </li>
                             
                                <li>
                                    <a href="#" onclick="alert('결제는 장바구니를 통해 가능합니다!')">
                                        <span>03</span>
                                        Checkout
                                    </a>
                                </li>
                                <li>
                                    <a href="#order-complete" onclick="alert('결제는 장바구니를 통해 가능합니다!')">
                                        <span>04</span>
                                        Order complete
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-10">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                
                                <!-- wishlist start -->                                
                                <div class="tab-pane active" id="wishlist">
                                    <div class="wishlist-content">
                                        
                                            <div class="table-content table-responsive mb-50">
                                                <table class="text-center">
                                                    <thead>
                                                        <tr>
                                                            <th class="product-thumbnail">product</th>
                                                            <th class="product-price">price</th>
                                                            <th class="product-stock">Stock status</th>
                                                            <th class="product-add-cart">add to cart</th>
                                                            <th class="product-remove">remove</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- tr -->
                                                      <c:forEach var="row" items="${list}"  varStatus="varstatus">
                                                                                                            
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                <img id = 'main-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'">
			                                            		<script>
			                                            			var imageName = encodeURIComponent('${row.product_imageList[0].image_uploadPath}'+'/s_'+'${row.product_imageList[0].image_uuid}'+'_'+'${row.product_imageList[0].image_name}');
			                                            			var realSrc = '/product/display?fileName='+imageName;
			                                            	
			                                        				document.getElementById('main-img${varstatus.index}').src= realSrc;
																</script>
                                                                    <!--<img src="/resources/img/cart/1.jpg" alt="">  -->
                                                                </div>
                                                                
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href='/product/get?product_id=${row.product_id}'>${row.product_title}</a>
                                                                    </h6>
                                                                    <p>Brand: ${row.product_brand}</p>
                                                                    <p>Model: ${row.product_type}</p>
                                                                    <p>Carrier: ${row.product_carrier}</p>
                                                                </div>
                                                            </td>
                                                            
                                                            <td class="product-price">${row.product_price}</td>
                                                            <td class="product-stock text-uppercase">in stock</td>
                                                            
                                                            <td class="product-add-cart">
                                                                <a href="#" title="Add To Cart">
                                                                    <button onclick="openModal(${row.product_id},${row.product_price})"><i class="zmdi zmdi-shopping-cart-plus"></i></button>
                                                                </a>
                                                            </td>
                                                            
                                                            <td class="product-remove">
                                                            	<form name="form1" action="/mypage/deleteWishList" method="post"> 
                                                            	 <input type="hidden" name="product_id" value="${row.product_id}"/>                                                                                                                   	
                                                                 <button type="submit"><i class="zmdi zmdi-close"></i></button>                                                                 
                                                                </form>                                                                 
                                                            </td>

                                                        </tr>
                                                        
                                                       </c:forEach>
                                                        
                                                    </tbody>
                                                </table>
                                            
                                            </div>
                                        
                                    </div>
                                </div>
                               
                                <!-- wishlist end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->
<%@include file="/WEB-INF/views/purchase/CartModal.jsp" %>
<%@include file="/WEB-INF/views/layout/foot.jsp" %>

<script type="text/javascript" src="/resources/js/cartModal.js"></script>
<script type="text/javascript">
	
var msg="${insertmsg}";

if(msg=="SUCCESS"){
	alert("성공적으로 추가되었습니다!");
	}else if(msg=="FAIL"){
	alert("이미 장바구니에 존재하는 상품입니다");
}

</script>