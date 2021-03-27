<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>	

    <!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-12">
                            <ul class="cart-tab">
                            	<li>
                                    <a class="active" href="/mypage/wishList">
                                        <span>01</span>
                                        Wishlist
                                    </a>
                                </li>
                                <li>
                                    <a class="active" href="/purchase/viewCart">
                                        <span>02</span>
                                        Shopping cart
                                    </a>
                                </li>
                             
                                <li>
                                    <a href="#" onclick="alert('결제는 장바구니를 통해 가능합니다!'); return false;">
                                        <span>03</span>
                                        Checkout
                                    </a>
                                </li>
                                <li>
                                    <a href="#" onclick="alert('결제는 장바구니를 통해 가능합니다!')" >
                                        <span>04</span>
                                        Order complete
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-10 col-sm-12">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- shopping-cart start -->
                                <div class="tab-pane active" id="shopping-cart">
                                    <div class="shopping-cart-content">
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
                                                      <c:forEach var="row" items="${list}"  varStatus="varstatus">
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                    <img id = 'main-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'">
                                                                </div>
                                                                <script>
			                                            			var imageName = encodeURIComponent('${row.product_imageList[0].image_uploadPath}'+'/s_'+'${row.product_imageList[0].image_uuid}'+'_'+'${row.product_imageList[0].image_name}');
			                                            			var realSrc = '/product/display?fileName='+imageName;
			                                            	
			                                        				document.getElementById('main-img${varstatus.index}').src= realSrc;
																</script>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="product-title-2">
                                                                        <a href='/product/get?product_id=${row.product_id}'>${row.product_title}</a>
                                                                    </h6>
                                                                    <p>Brand: ${row.product_brand}</p>
                                                                    <p>Model: ${row.product_type}</p>
                                                                    <p> Color: ${row.product_color}</p>
                                                                </div>
                                                            </td>
                                                            
                                                            <td class="product-price">${row.product_price}</td>
                                                            
                                                            <td class="product-quantity" style="color:black;">${row.product_qty}</td>
                                                            
                                                            <td class="product-subtotal">${row.total_price}</td>
                                                            
                                                            <td class="product-remove">
                                                              	<form name="deleteForm" action="/purchase/deleteCart" method="post" > 
                                                            	 	<input type="hidden" name="product_id" value="${row.product_id}"/>
                                                            	 	<input type="hidden" name="product_color" value="${row.product_color}"/>                                                                                                                   	
                                                                 	<button type="submit"><i class="zmdi zmdi-close"></i></button>                                                                 
                                                              	</form>                                                                 
                                                            </td>
                                                             
                                                        </tr>
                                                        </c:forEach>                                                 
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                
                                                <div class="col-md-6">
                    	  							<form name="form5" action="/mypage/searchAndInsertCoupon" method="GET">
                            							<div class="coupon-discount box-shadow p-30 mb-50">
                                 							<h6 class="widget-title border-left mb-20">coupon discount</h6>
                                 							<p>Enter your coupon code if you have one!</p>
                                 							<input type="text" name="coupon_code" placeholder="Enter your code here."/>
                                 							<button id="coupon_list" class="submit-btn-1 black-bg btn-hover-2" type="submit">쿠폰 등록하기</button>
                                 							<button type="button" id="modal_opne_btn" class="submit-btn-1 black-bg btn-hover-2" style="float:right;" onclick="openModal()">보유한 쿠폰 보기</button>
                            							</div>
                          							</form>
                       							</div>
                                                <div class="col-md-6">
                                                <form name="form3" id="checkoutform" action="/purchase/checkout" method="post">
                                                    <div class="payment-details box-shadow p-30 mb-50">
                                                    
                                                        <h6 class="widget-title border-left mb-20">payment details</h6>
                                                        <table>
                                                            <tr>
                                                                <td class="td-title-1">Cart Subtotal</td>
                                                                <td class="td-title-2">${total_money}</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Coupon Discount</td>
                                                                <td class="td-title-2">${discount}</td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Vat</td>
                                                                <td class="td-title-2">$00.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total">Order Total</td>
                                                                <td class="order-total-price">${discount_result}</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total"><button id="tocheckout2" class="submit-btn-1 black-bg btn-hover-2">결제하기</button></td>
                                                            </tr>
                                                            <input type="hidden" name="discount_value" value="${discount}"/>
                                                            <input type="hidden" name="coupon_id" value="${couponID_input}"/>
                                                        </table>
                                                       
                                                    </div>
                                                    </form>
                                                </div>
                                            </div>
                                            
                                      <!-- Modal -->
										<div class="modal fade" id="myModal" style="margin:0;" tabindex="-1" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
														<div class="modal-header">		
														</div>
														<div class="modal-body" style="color:black;">
															
															<table class="table table-bordered" style="color:rgb(0, 0, 0);">
															<tbody>
							  									<c:forEach var="row" items="${coupon_list}"  varStatus="varstatus">
																<tr>
																	<td align="center">${row.coupon_List[0].coupon_name}</td>
																	<td align="center">${row.coupon_List[0].coupon_description}</td>
																	<fmt:formatDate var="resultRegDt" value="${row.startDate}" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate var="resultRegDt2" value="${row.endDate}" pattern="yyyy-MM-dd"/>
																	<form name="couponForm" id="couponform" method="post" action="/purchase/couponApply">
																	<td align="center">${resultRegDt} ~ ${resultRegDt2}
																		<input type="hidden" id="coupon_id" value="${row.coupon_id}" name="CouponID">
																		<input type="hidden" value="${row.endDate}" name="endDate">
																		<input type="hidden" value="${row.coupon_List[0].price_limit}" name="price_limit">
																		<input type="hidden" value="${row.coupon_List[0].discount}" name="discount">
																	</td>
																	<td align="center"><button id="useCoupon" class="submit-btn-1 black-bg btn-hover-2">사용</button></td>
																	</form>								    
																</tr>
							   									</c:forEach> 
															</tbody>
															</table>
														</div>
														<div class="modal-footer">
														 모든 쿠폰은 중복 사용이 불가합니다           
															<button type="button" id="modal_close_btn" class="btn btn-default" data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div> 
                                    </div>
                                </div>
                                <!-- shopping-cart end -->
                                <!-- wishlist start -->
                                <div class="tab-pane" id="wishlist">
                                    <div class="wishlist-content">
                                        <form action="#">
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
                                                            <td class="product-stock text-uppercase">in stock</td>
                                                            <td class="product-add-cart">
                                                                <a href="#" title="Add To Cart">
                                                                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                                </a>
                                                            </td>
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
                                                            <td class="product-stock text-uppercase">in stock</td>
                                                            <td class="product-add-cart">
                                                                <a href="#" title="Add To Cart">
                                                                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                                </a>
                                                            </td>
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
                                                            <td class="product-stock text-uppercase">in stock</td>
                                                            <td class="product-add-cart">
                                                                <a href="#" title="Add To Cart">
                                                                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                                </a>
                                                            </td>
                                                            <td class="product-remove">
                                                                <a href="#"><i class="zmdi zmdi-close"></i></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- wishlist end -->
                                <!-- checkout start -->
                                <div class="tab-pane" id="checkout">
                                    <div class="checkout-content box-shadow p-30">
                                        <form action="#">
                                            <div class="row">
                                                <!-- billing details -->
                                                <div class="col-md-6">
                                                    <div class="billing-details pr-10">
                                                        <h6 class="widget-title border-left mb-20">billing details</h6>
                                                        <input type="text"  placeholder="Your Name Here...">
                                                        <input type="text"  placeholder="Email address here...">
                                                        <input type="text"  placeholder="Phone here...">
                                                        <input type="text"  placeholder="Company neme here...">
                                                        <select class="custom-select">
                                                            <option value="defalt">country</option>
                                                            <option value="c-1">Australia</option>
                                                            <option value="c-2">Bangladesh</option>
                                                            <option value="c-3">Unitd States</option>
                                                            <option value="c-4">Unitd Kingdom</option>
                                                        </select>
                                                        <select class="custom-select">
                                                            <option value="defalt">State</option>
                                                            <option value="c-1">Melbourne</option>
                                                            <option value="c-2">Dhaka</option>
                                                            <option value="c-3">New York</option>
                                                            <option value="c-4">London</option>
                                                        </select>
                                                        <select class="custom-select">
                                                            <option value="defalt">Town/City</option>
                                                            <option value="c-1">Victoria</option>
                                                            <option value="c-2">Chittagong</option>
                                                            <option value="c-3">Boston</option>
                                                            <option value="c-4">Cambridge</option>
                                                        </select>
                                                        <textarea class="custom-textarea" placeholder="Your address here..."></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- our order -->
                                                    <div class="payment-details pl-10 mb-50">
                                                        <h6 class="widget-title border-left mb-20">our order</h6>
                                                        <table>
                                                            <tr>
                                                                <td class="td-title-1">Dummy Product Name x 2</td>
                                                                <td class="td-title-2">$1855.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Dummy Product Name</td>
                                                                <td class="td-title-2">$555.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Cart Subtotal</td>
                                                                <td class="td-title-2">$2410.00</td>
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
                                                                <td class="order-total-price">$2425.00</td>
                                                            </tr>
                                                        </table>
                                                    </div> 
                                                    <!-- payment-method -->
                                                    <div class="payment-method">
                                                        <h6 class="widget-title border-left mb-20">payment method</h6>
                                                        <div id="accordion">
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#bank-transfer" >
                                                                    direct bank transfer
                                                                    </a>
                                                                </h4>
                                                                <div id="bank-transfer" class="panel-collapse collapse in" >
                                                                    <div class="payment-content">
                                                                    <p>Lorem Ipsum is simply in dummy text of the printing and type setting industry. Lorem Ipsum has been.</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                    cheque payment
                                                                    </a>
                                                                </h4>
                                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                                    <div class="payment-content">
                                                                        <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" >
                                                                    paypal
                                                                    </a>
                                                                </h4>
                                                                <div id="collapseThree" class="panel-collapse collapse" >
                                                                    <div class="payment-content">
                                                                        <p>Pay via PayPal; you can pay with your credit card if you don't have a PayPal account.</p>
                                                                        <ul class="payent-type mt-10">
                                                                            <li><a href="#"><img src="/resources/img/payment/1.png" alt=""></a></li>
                                                                            <li><a href="#"><img src="/resources/img/payment/2.png" alt=""></a></li>
                                                                            <li><a href="#"><img src="/resources/img/payment/3.png" alt=""></a></li>
                                                                            <li><a href="#"><img src="/resources/img/payment/4.png" alt=""></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- payment-method end -->
                                                    <button class="submit-btn-1 mt-30 btn-hover-1" type="submit">place order</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- checkout end -->
                                <!-- order-complete start -->
                                <div class="tab-pane" id="order-complete">
                                    <div class="order-complete-content box-shadow">
                                        <div class="thank-you p-30 text-center">
                                            <h6 class="text-black-5 mb-0">Thank you. Your order has been received.</h6>
                                        </div>
                                        <div class="order-info p-30 mb-10">
                                            <ul class="order-info-list">
                                                <li>
                                                    <h6>order no</h6>
                                                    <p>m 2653257</p>
                                                </li>
                                                <li>
                                                    <h6>order no</h6>
                                                    <p>m 2653257</p>
                                                </li>
                                                <li>
                                                    <h6>order no</h6>
                                                    <p>m 2653257</p>
                                                </li>
                                                <li>
                                                    <h6>order no</h6>
                                                    <p>m 2653257</p>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <!-- our order -->
                                            <div class="col-md-6">
                                                <div class="payment-details p-30">
                                                    <h6 class="widget-title border-left mb-20">our order</h6>
                                                    <table>
                                                        <tr>
                                                            <td class="td-title-1">Dummy Product Name x 2</td>
                                                            <td class="td-title-2">$1855.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-title-1">Dummy Product Name</td>
                                                            <td class="td-title-2">$555.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-title-1">Cart Subtotal</td>
                                                            <td class="td-title-2">$2410.00</td>
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
                                                            <td class="order-total-price">$2425.00</td>
                                                        </tr>
                                                    </table>
                                                </div>         
                                            </div>
                                            <div class="col-md-6">
                                                <div class="bill-details p-30">
                                                    <h6 class="widget-title border-left mb-20">billing details</h6>
                                                    <ul class="bill-address">
                                                        <li>
                                                            <span>Address:</span>
                                                            28 Green Tower, Street Name, New York City, USA
                                                        </li>
                                                        <li>
                                                            <span>email:</span>
                                                            info@companyname.com
                                                        </li>
                                                        <li>
                                                            <span>phone : </span>
                                                            (+880) 19453 821758
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="bill-details pl-30">
                                                    <h6 class="widget-title border-left mb-20">billing details</h6>
                                                    <ul class="bill-address">
                                                        <li>
                                                            <span>Address:</span>
                                                            28 Green Tower, Street Name, New York City, USA
                                                        </li>
                                                        <li>
                                                            <span>email:</span>
                                                            info@companyname.com
                                                        </li>
                                                        <li>
                                                            <span>phone : </span>
                                                            (+880) 19453 821758
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- order-complete end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->
             	
      
<%@include file="/WEB-INF/views/layout/foot.jsp" %>
<script type="text/javascript">

	var couponModal = $("#myModal");
	function openModal() {
		couponModal.modal('show');
	};


	document.getElementById("tocheckout2").onclick = function() {
		var total_money = '<c:out value="${total_money}"/>';
		console.log(total_money);
		if(total_money == 0){
		
			alert('적어도 한 개의 제품이 장바구니에 존재해야 결제 가능합니다!');
			return false;
		}
    	document.getElementById("checkoutform").submit();
	}

	
	
	if(document.getElementById("useCoupon")!=null){
	document.getElementById("useCoupon").onclick = function() {
		var total_money = '<c:out value="${total_money}"/>';
		console.log(total_money);
		if(total_money == 0){
			alert('적어도 한 개의 제품이 장바구니에 존재해야 쿠폰을 사용할 수 있습니다!');
			return false;
		}
    	document.getElementById("couponform").submit();
	}
	}

var msg="${msg}";

if(msg=="SUCCESS"){
	alert("쿠폰이 성공적으로 추가되었습니다!");
	}else if(msg=="FAIL"){
	alert("쿠폰 코드가 맞지 않습니다. 다시 확인해주세요");
}

var msg="${couponmsg}";

if(msg=="FAIL"){
	alert("결제 금액이 쿠폰 적용 가능 금액보다 적습니다");
}
</script> 