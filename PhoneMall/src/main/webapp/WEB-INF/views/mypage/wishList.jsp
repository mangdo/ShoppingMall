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
                                <h1 class="breadcrumbs-title">Wishlist</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Home</a></li>
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
                                <!-- shopping-cart start -->
                                <div class="tab-pane" id="shopping-cart">
                                    <div class="shopping-cart-content">
                                        <form action="#">
                                            <div class="table-content table-responsive mb-50">
                                                <table class="text-center">
                                                    <thead>
                                                        <tr>
                                                            <th class="product-thumbnail">product</th>
                                                            <th class="product-price">price</th>
                                                            <th class="product-quantity">Quantity</th>
                                                            <th class="product-subtotal">total</th>
                                                            <th class="product-remove">remove</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- tr -->
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                    <img src="/resources/img/cart/1.jpg" alt="">
                                                                </div>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href="#">dummy product name</a>
                                                                    </h6>
                                                                    <p>Brand: Brand Name</p>
                                                                    <p>Model: Grand s2</p>
                                                                    <p> Color: Black, White</p>
                                                                </div>
                                                            </td>
                                                            <td class="product-price">$560.00</td>
                                                            <td class="product-quantity">
                                                                <div class="cart-plus-minus f-left">
                                                                    <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                                </div> 
                                                            </td>
                                                            <td class="product-subtotal">$1020.00</td>
                                                            <td class="product-remove">
                                                                <a href="#"><i class="zmdi zmdi-close"></i></a>
                                                            </td>
                                                        </tr>
                                                        <!-- tr -->
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                    <img src="/resources/img/cart/2.jpg" alt="">
                                                                </div>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href="#">dummy product name</a>
                                                                    </h6>
                                                                    <p>Brand: Brand Name</p>
                                                                    <p>Model: Grand s2</p>
                                                                    <p> Color: Black, White</p>
                                                                </div>
                                                            </td>
                                                            <td class="product-price">$560.00</td>
                                                            <td class="product-quantity">
                                                                <div class="cart-plus-minus f-left">
                                                                    <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                                </div> 
                                                            </td>
                                                            <td class="product-subtotal">$1020.00</td>
                                                            <td class="product-remove">
                                                                <a href="#"><i class="zmdi zmdi-close"></i></a>
                                                            </td>
                                                        </tr>
                                                        <!-- tr -->
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                    <img src="/resources/img/cart/3.jpg" alt="">
                                                                </div>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href="#">dummy product name</a>
                                                                    </h6>
                                                                    <p>Brand: Brand Name</p>
                                                                    <p>Model: Grand s2</p>
                                                                    <p> Color: Black, White</p>
                                                                </div>
                                                            </td>
                                                            <td class="product-price">$560.00</td>
                                                            <td class="product-quantity">
                                                                <div class="cart-plus-minus f-left">
                                                                    <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                                </div> 
                                                            </td>
                                                            <td class="product-subtotal">$1020.00</td>
                                                            <td class="product-remove">
                                                                <a href="#"><i class="zmdi zmdi-close"></i></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="coupon-discount box-shadow p-30 mb-50">
                                                        <h6 class="widget-title border-left mb-20">coupon discount</h6>
                                                        <p>Enter your coupon code if you have one!</p>
                                                        <input type="text" name="name" placeholder="Enter your code here.">
                                                        <button class="submit-btn-1 black-bg btn-hover-2" type="submit">apply coupon</button>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="payment-details box-shadow p-30 mb-50">
                                                        <h6 class="widget-title border-left mb-20">payment details</h6>
                                                        <table>
                                                            <tr>
                                                                <td class="td-title-1">Cart Subtotal</td>
                                                                <td class="td-title-2">$155.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Shipping and Handing</td>
                                                                <td class="td-title-2">$15.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Vat</td>
                                                                <td class="td-title-2">$00.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total">Order Total</td>
                                                                <td class="order-total-price">$170.00</td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="culculate-shipping box-shadow p-30">
                                                        <h6 class="widget-title border-left mb-20">culculate shipping</h6>
                                                        <p>Enter your coupon code if you have one!</p>
                                                        <div class="row">
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Country">
                                                            </div>
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Region / State">
                                                            </div>
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Post code">
                                                            </div>
                                                            <div class="col-md-12">
                                                                <button class="submit-btn-1 black-bg btn-hover-2">get a quote</button>   
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- shopping-cart end -->
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
<!-- option Modal -->
<!-- Modal -->
<div class="modal fade" id="optionModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <form name="form1" action="/purchase/insertCart" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            	<h4 class="modal-title">옵션 선택</h4>
            </div>
            <div class="modal-body">
            	<div id="hiddenInput"></div>
				<table>
					<thead style="color: black;">
						<tr>
							<td>수량</td>
							<td>색깔</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="cart-plus-minus f-left" style="text-align:center;">
                                      <input type="text" value="02" name="product_qty" class="cart-plus-minus-box">
                                </div>
							</td>
							<td>
								<div id="colorSelectBox" style="border:black;">
                                     <select name="product_color" id="select2">
									 </select>
                                </div>
							</td>
						</tr>
				   </tbody>
				</table>
            </div><!-- .modal-body -->
            <div class="modal-footer">
            	<button id="AddToCartBtn" class="submit-btn-1 btn-hover-1" type="submit">Add to Cart</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
       </form>
    </div><!-- .modal-dialog -->
</div>
<!-- END Modal -->
<%@include file="/WEB-INF/views/layout/foot.jsp" %>


<script type="text/javascript">
var optionModal = $("#optionModal");
function openModal(product_id,product_price) {
	
	optionModal.modal('show');
	var price = product_price;
	var id = product_id;
	
	$.getJSON("/product/getColorList",{product_id : id}, function(arr){
		 console.log(arr);
		 str="";
		 str2 = "";
		 str3 = "";
		 $(arr).each(function(i, color){
			console.log(color.product_color);
			str = str + "<option value='"+color.product_color+"'>"+color.product_color+"</option>";
		
		 });
		 str2 = str2 + "<input type='hidden' name='product_id' value='"+product_id+"'/>"
		 str3 = str3 + "<input type='hidden' name='product_price' value='"+price+"'/>"
		 $("#select2").empty().append(str);
		 $("#hiddenInput").empty().append(str2);
		 $("#hiddenInput").append(str3)
	 });
	
	};
</script>