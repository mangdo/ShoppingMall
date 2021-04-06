<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>	
	<!-- BREADCRUMBS SETCTION START -->
    <div class="breadcrumbs-section plr-200 mb-80">
        <div class="breadcrumbs overlay-bg">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="breadcrumbs-inner">
                            <h1 class="breadcrumbs-title">Order Complete</h1>
                            <ul class="breadcrumb-list">
                                <li><a href="/">Home</a></li>
                                <li>Order Complete</li>
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
                                    <a class="active" onclick="return false;">
                                        <span>03</span>
                                        Checkout
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="active"onclick="alert('결제는 장바구니를 통해 가능합니다!'); return false;">
                                        <span>04</span>
                                        Order complete
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-10 col-sm-12">
                            <!-- Tab panes -->
                            <div class="tab-content">
<!-- order-complete start -->
                                <div class="tab-pane active" id="order-complete">
                                    <div class="order-complete-content box-shadow">
                                        <div class="thank-you p-30 text-center">
                                            <h6 class="text-black-5 mb-0">Thank you. Your order has been received.</h6>
                                        </div>
                                        <div class="order-info p-30 mb-10">
                                            <ul class="order-info-list">
                                                <li>
                                                    <h6>order no</h6>
                                                    <p>${purchaseList[0].purchase_id}</p>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <!-- our order -->
                                            <div class="col-md-6">
                                                <div class="payment-details p-30">
                                                    <h6 class="widget-title border-left mb-20">our order</h6>
                                                    <table>
                                                    	<c:forEach var="row" items="${orderList}"  varStatus="varstatus">
                                                        <tr>
                                                            <td class="td-title-1">${row.product_title} x ${row.product_qty} (${row.product_color})</td>
                                                        </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td class="td-title-1">Cart Subtotal</td>
                                                            <td class="td-title-2">${purchaseList[0].total_money}</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-title-1">Coupon Discount</td>
                                                            <td class="td-title-2">${discount_amount}</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="order-total">Order Total</td>
                                                            <td class="order-total-price">${purchaseList[0].discount_result}</td>
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
                                                            ${purchaseList[0].address}
                                                        </li>
                                                        <li>
                                                            <span>email:</span>
                                                            ${purchaseList[0].email}
                                                        </li>
                                                        <li>
                                                            <span>phone : </span>
                                                            ${purchaseList[0].phonenum}
                                                        </li>
                                                        <li>
                                                        	<span>payment : </span>
                                                            ${purchaseList[0].paymentMethod}
                                                        </li>
                                                        <li>
                                                        	<span>name : </span>
                                                            ${purchaseList[0].firstname} ${purchaseList[0].lastname}
                                                        </li>
                                                    </ul>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
                                <!-- order-complete end -->
<%@include file="/WEB-INF/views/layout/foot.jsp" %>