<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- START QUICKVIEW PRODUCT -->
<div id="quickview-wrapper">
  <!-- Modal -->
  <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
              <div class="modal-body">
                  <div class="modal-product clearfix">
                      <div class="product-images">
                          <div class="main-image images">
                              <img alt="" id="quick-img"src="/resources/img/product/quickview.jpg">
                          </div>
                      </div><!-- .product-images -->
                      
                      <div class="product-info">
                          <h1 id ="quick-title"> </h1>
                          <div class="price-box-3">
                              <div class="s-price-box">
                                  <span class="new-price" id ="quick-price"> </span>
                              </div>
                          </div>
                          <a class ='see-all' id="quick-id" href=''>See all features</a>
                          <div class="quick-add-to-cart">
                              <form id="cartform" name="form1" action="/purchase/insertCart" method="post">
                                  <!-- plus-minus-pro-action -->
                                     <div class="plus-minus-pro-action clearfix" style="height:30px;">
                                         <div class="sin-plus-minus f-left clearfix">
                                             <p class="color-title f-left">Qty</p>
                                             <div class="numbers-row f-left">
                                      <input type="number" id="french-hens" name="product_qty" value="1" style="height:30px;">
                                  </div>
                                         </div>
                                         <div class="sin-plus-minus f-left clearfix" style="margin-left:30px;">
                                         	<input type="hidden" id="product_id" name="product_id" value="0"/>
                                         	<input type="hidden" id="product_price" name="product_price" value="0"/>
                                             <p class="color-title f-left">Color</p>
                                                 <select name="product_color" id ="product_color">
                                                 
												</select>
                                         </div>
                                     </div>
                                     <!-- plus-minus-pro-action end -->
                                     <br>
                                  <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                              </form>
                          </div>
                          <div id="quick-information" class="quick-desc"></div>
                          <div class="social-sharing">
                              <div class="widget widget_socialsharing_widget">
                                  <h3 class="widget-title-modal">Share this product</h3>
                                  <ul class="social-icons clearfix">
                                      <li>
                                          <a class="facebook" href="#" target="_blank" title="Facebook">
                                              <i class="zmdi zmdi-facebook"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="google-plus" href="#" target="_blank" title="Google +">
                                              <i class="zmdi zmdi-google-plus"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="twitter" href="#" target="_blank" title="Twitter">
                                              <i class="zmdi zmdi-twitter"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="pinterest" href="#" target="_blank" title="Pinterest">
                                              <i class="zmdi zmdi-pinterest"></i>
                                          </a>
                                      </li>
                                      <li>
                                          <a class="rss" href="#" target="_blank" title="RSS">
                                              <i class="zmdi zmdi-rss"></i>
                                          </a>
                                      </li>
                                      <li>
                                      	<a id="kakao-link-btn" href="#">
                                          <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" style="width:100%"/>
  									  	</a>
  									  </li>
                                  </ul>
                              </div>
                          </div>
                      </div><!-- .product-info -->
                     
                  </div><!-- .modal-product -->
              </div><!-- .modal-body -->
          </div><!-- .modal-content -->
      </div><!-- .modal-dialog -->
  </div>
  <!-- END Modal -->
</div>
<!-- END QUICKVIEW PRODUCT -->

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/quickViewModal.js"></script>