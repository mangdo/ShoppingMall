<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
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
                                    <a class="active" href="#">
                                        <span>03</span>
                                        Checkout
                                    </a>
                                </li>
                                <li>
                                    <a href="#" onclick="return false;">
                                        <span>04</span>
                                        Order complete
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-10 col-sm-12">
                            <!-- Tab panes -->
                            <div class="tab-content">

                                <!-- checkout start -->
                                <div class="tab-pane active" id="checkout">
                                    <div class="checkout-content box-shadow p-30">
                                            <div class="row">
                                                <!-- billing details -->
                                                <form id="orderform2" name="orderform" method="post" action="/purchase/orderInsert">
                                                  <div class="col-md-6">
                                                    <div class="billing-details pr-10">
                                                        <h6 class="widget-title border-left mb-20">billing details</h6>
                                                        <input type="text" name="email" placeholder="Email" value="<sec:authentication property="principal.user.email"/>">
                                                        <input type="hidden" name="firstname" value ="<sec:authentication property="principal.user.firstname"/>">
                                                        <input type="hidden" name="lastname" value ="<sec:authentication property="principal.user.lastname"/>">
                                                        <input type="text" placeholder="Name" value="<sec:authentication property="principal.user.lastname"/>  <sec:authentication property="principal.user.firstname"/>">
                                                        <input type="text" name="phonenum" placeholder="phone number" value="<sec:authentication property="principal.user.phonenum"/>">
                                                        <input type="text" name="postalcode" placeholder="Postalcode" value="<sec:authentication property="principal.user.postalcode"/>">
                                                        <input type="text" name="address" placeholder="Address" value="<sec:authentication property="principal.user.address"/>">
                                                        <textarea name="memo" class="custom-textarea" placeholder="If you have any special memo, write here"></textarea>
                                                    	<input type="hidden" name="used_coupon" value="${coupon_id}"/>
                                                    	<input type="hidden" name="total_money" value="${total_money}"/>
                                                    	<input type="hidden" name="discount_result" value="${discount_result}"/>
                                                    </div>
                                                  </div>
                                                </form>
                                                <div class="col-md-6">
                                                    <!-- our order -->
                                                    
                                                    <div class="payment-details pl-10 mb-50">
                                                        <h6 class="widget-title border-left mb-20">our order</h6>
                                                        <table>
                                                        	<c:forEach var="row" items="${list}"  varStatus="varstatus">
                                                            <tr>
                                                                <td class="td-title-1">${row.product_title} x ${row.product_qty} (${row.product_color})</td>
                                                                <td class="td-title-2">${row.total_price}</td>
                                                            </tr>
                                                            <c:set var="qty">${varstatus.count}</c:set>
                                                            </c:forEach>
                                                            <tr>
                                                                <td class="td-title-1">Cart Subtotal</td>
                                                                <td class="td-title-2">${total_money}</td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Coupon</td>
                                                                <td class="td-title-2">${discount_value}</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Vat</td>
                                                                <td class="td-title-2">$00.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total">Order Total</td>
                                                                <td class="order-total-price">${discount_result}</td>
                                                            </tr>
                                                        </table>
                                                      </div>
                                                    </div>
                                                    </div>
                                                    <!-- payment-method -->
                                                    <div class="payment-method">
                                                        <h6 class="widget-title border-left mb-20">payment method</h6>
                                                        <div id="accordion">
                                                            <div class="panel">
                                                                <h4 class="payment-title box-shadow">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" >
                                                                    kakaopay
                                                                    </a>
                                                                </h4>
                                                                <div id="collapseThree" class="panel-collapse collapse" >
                                                                    <div class="payment-content">
                                                                        <p>Pay via PayPal; you can pay with your credit card if you don't have a PayPal account.</p>
                                                                        <ul class="payent-type mt-10">
                                                                            <li><input type="radio" name="payment" value="kakaopay"><img src="/resources/img/payment/kakaopay-icon.png" alt="KakaoPay"></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- payment-method end -->
                                                    <button id="complete" class="submit-btn-1 mt-30 btn-hover-1">place order</button>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <!-- checkout end -->
                            </div>
                        </div>
                    </div>
            
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->
             	
      
<%@include file="/WEB-INF/views/layout/foot.jsp" %>
<script type="text/javascript">
$("#complete").on("click", function(e){
	var orderform = $("#orderform2");
	
	if(!$('input:radio[name="payment"]').is(':checked')){
		alert("결제 방법을 선택해주세요.");
		return;
	}
	//상품수량
	orderform.append($('<input/>', {type: 'hidden', name: 'purchase_qty', value: ${qty} }));
	
	//상품명
	if(${qty}>1){
		orderform.append($('<input/>', {type: 'hidden', name: 'purchase_name', value:'${list[0].product_title}'+'외 '+String((${qty}-1))+'개'}));
	}else{
		orderform.append($('<input/>', {type: 'hidden', name: 'purchase_name', value:'${list[0].product_title}'}));
	}
	//상품총액
	orderform.append($('<input/>', {type: 'hidden', name: 'purchase_price', value: ${discount_result} }));
	orderform.submit();
});
</script> 