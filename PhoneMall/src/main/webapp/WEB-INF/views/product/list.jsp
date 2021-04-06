<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/layout/top.jsp" %>
        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">products</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>products</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->
        <!-- Start page content -->
        <div id="page-content" class="page-wrapper">
        	
            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-md-push-3 col-xs-12">
                            <div class="shop-content">
                                <!-- shop-option start -->
                                <div class="shop-option box-shadow mb-30 clearfix">
                                    <!-- Nav tabs -->
                                    <ul class="shop-tab f-left" role="tablist">
	                                    	<li class="active"> <a href="#grid-view" data-toggle="tab" class="gridView"><i class="zmdi zmdi-view-module"></i></a> </li>
                                        	<li> <a href="#list-view" data-toggle="tab" class = "listView"><i class="zmdi zmdi-view-list-alt"></i></a> </li>

                                        
                                    </ul>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    	<a class="button extra-small button-black f-right" id='regBtn' ><span style="height:30px;padding:4px 20px">Register</span></a>
                                    </sec:authorize>                            
                                </div>
                                <!-- shop-option end -->
                                <!-- Tab Content start -->
                                
                                <div class="tab-content">
                                	
                                    <!-- grid-view -->
                                    <div role="tabpanel" class="tab-pane active" id="grid-view">	
                                        <div class="row">
                                        
                                            <c:forEach items="${list}" var="product" varStatus="varstatus">
                                            
				                            <!-- product-item start -->
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="product-item" >
                                                
                                                    <div class="product-img" style="position:relative; padding-top:111%; display:block;" >
                                                        <a class ='move' href='<c:out value="${product.product_id}"/>'>
                                                        <img id = 'main-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'"
                                                        	style="position:absolute; top:0; width:100%;height:100%">
			                                            <script>
			                                            	var imageName = encodeURIComponent('${product.product_imageList[0].image_uploadPath}'+'/s_'+'${product.product_imageList[0].image_uuid}'+'_'+'${product.product_imageList[0].image_name}');
			                                            	var realSrc = '/product/display?fileName='+imageName;
			                                            	
			                                        		document.getElementById('main-img${varstatus.index}').src= realSrc;
														</script>
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                        	<a class ='move' href='<c:out value="${product.product_id}"/>'>
                                                            <c:out value="${product.product_title }"/></a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                        	<c:forEach var="i" begin="1" end="${product.product_rating }" >
                                                        		<a><i class="zmdi zmdi-star"></i></a>
                                                        		<c:set var="rating">${i}</c:set>
                                                        	</c:forEach>
                                                        	
                                                        	<c:if test="${ product.product_rating - rating >= 0.5 }">
                                                        		<a><i class="zmdi zmdi-star-half"></i></a>
                                                        	</c:if>
                                                        	<c:if test="${ product.product_rating - rating != 0 }">
	                                                        	<c:if test="${ product.product_rating - rating < 0.5 }">
	                                                        		<a><i class="zmdi zmdi-star-outline"></i></a>
	                                                        	</c:if>
                                                        	</c:if>
                                                        	<c:if test="${ product.product_rating - rating == 0 }">
		                                                    	<a><i class="zmdi zmdi-star-outline"></i></a>
		                                                   	</c:if>
		                                                   	<c:forEach var="i" begin="${product.product_rating+2}" end="5">
		                                                   		<a><i class="zmdi zmdi-star-outline"></i></a>
		                                                   	</c:forEach>
                                       						<b><c:out value="${product.product_rating }"/></b>&nbsp;(<c:out value="${product.review_count }"/>)               
                                                        </div>
                                                        
                                                                                                              
                                                        <h3 class="pro-price"><fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="3"/>원</h3>
                                                        <form name="wishListform" method="post" action="/product/insertWishList">
                                                        <ul class="action-button">                                                        
                                                            <li>       
                                                            	<input type="hidden" name="product_id" value="${product.product_id}"/>                                             
                                                                <a title="wishlist"><button type="submit" title="Wishlist"><i class="zmdi zmdi-favorite"></i></button></a>                                                                
                                                            </li>
                                                            <li>
                                                                <a href="#" data-toggle="modal" data-target="#productModal" title="Quickview"
                                                                 data-id="${product.product_id}" data-title="${product.product_title }" data-price="${product.product_price}" data-information="${product.product_information}">
                                                                	<i class="zmdi zmdi-zoom-in"></i>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart" onclick="openModal(${product.product_id},${product.product_price})"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            <!-- product-item end -->
                                        </div>
                                    </div>
                                    <!-- list-view -->
                                    <div role="tabpanel" class="tab-pane" id="list-view">
                                        <div class="row">
	                                        <c:forEach items="${list}" var="product" varStatus="varstatus">
			                                <!-- product-item start -->
                                            <div class="col-md-12">
                                                <div class="shop-list product-item">
                                                    <div class="product-img" style="position:relative; padding-top:35%; display:block;" >
                                                        <a class ='move' href='<c:out value="${product.product_id}"/>'>
                                                            <img id = 'main-img-listview${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/9.jpg'"
                                                            style="position:absolute; top:0; width:100%;height:100%">
                                                        <script>
			                                            	var imageName = encodeURIComponent('${product.product_imageList[0].image_uploadPath}'+'/s_'+'${product.product_imageList[0].image_uuid}'+'_'+'${product.product_imageList[0].image_name}');
			                                            	var realSrc = '/product/display?fileName='+imageName;
			                                            	
			                                        		document.getElementById('main-img-listview${varstatus.index}').src= realSrc;
														</script>
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="clearfix">
                                                            <h6 class="product-title f-left">
                                                            	<a class ='move' href='<c:out value="${product.product_id}"/>'>
                                                            	<c:out value="${product.product_title }"/></a>
                                                            </h6>
                                                            <div class="pro-rating f-right">
                                                                
                                                        	<c:forEach var="i" begin="1" end="${product.product_rating }" >
                                                        		<a><i class="zmdi zmdi-star"></i></a>
                                                        		<c:set var="rating">${i}</c:set>
                                                        	</c:forEach>
                                                        	
                                                        	<c:if test="${ product.product_rating - rating >= 0.5 }">
                                                        		<a><i class="zmdi zmdi-star-half"></i></a>
                                                        	</c:if>
                                                        	<c:if test="${ product.product_rating - rating < 0.5 }">
                                                        		<a><i class="zmdi zmdi-star-outline"></i></a>
                                                        	</c:if>
                                                        	<c:forEach var="i" begin="${product.product_rating+2}" end="5">
                                                        		<a><i class="zmdi zmdi-star-outline"></i></a>
                                                        	</c:forEach>
                                       						<b><c:out value="${product.product_rating }"/></b>&nbsp;(<c:out value="${product.review_count }"/>)               
                                                        
                                                            </div>
                                                        </div>
                                                        <h6 class="brand-name mb-30">
                                                        	<c:out value="${product.product_brand }"/> / <c:out value="${product.product_type }"/> / <c:out value="${product.product_carrier }"/>
                                                        </h6>
                                                        <h3 class="pro-price"><fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="3"/>원</h3>
                                                        <p><c:out value="${product.product_information }"/></p>
                                                        <ul class="action-button">
                                                            <li>
                                                                <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" data-toggle="modal" data-target="#productModal" title="Quickview"
                                                                 data-id="${product.product_id}" data-title="${product.product_title }" data-price="${product.product_price}" data-information="${product.product_information}">
                                                                	<i class="zmdi zmdi-zoom-in"></i>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart" onclick="openModal(${product.product_id},${product.product_price})"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- product-item end -->
	                                        </c:forEach>
                                        </div>                                        
                                    </div>
                                </div>
                                
                                <!-- Tab Content end -->
                                <!-- shop-pagination start -->
                                <ul class="shop-pagination box-shadow text-center ptblr-10-30">
                                	<c:if test = "${pageMaker.prev}">
                                		<li class="paginate_button"><a href="${pageMaker.startPage - 1}">
                                		<i class="zmdi zmdi-chevron-left"></i>
                                		</a></li>
                                	</c:if>
                                    
                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    	<c:if test="${num eq pageMaker.cri.pageNum}">
                                    		<li class="paginate_button active"><a href="${num}">${num}</a></li>
                                    	</c:if>
                                    	<c:if test="${num ne pageMaker.cri.pageNum}">
                                    		<li class="paginate_button"><a href="${num}">${num}</a></li>
                                    	</c:if>
                                    </c:forEach>
                                    
                                    <c:if test = "${pageMaker.next}">
                                    	<li class="paginate_button active">
                                    	<a href="${pageMaker.endPage + 1}">
                                    	<i class="zmdi zmdi-chevron-right">
                                    	</i></a></li>
                                	</c:if>
                                </ul>
                                <!-- shop-pagination end -->
                            </div>
                        </div>
                        
                        <!-- 사이드바 -->
                        <div class="col-md-3 col-md-pull-9 col-xs-12">
                            <!-- widget-search -->
                            <aside class="widget-search mb-30">
                                <form id='searchForm' action="/product/list" method='get'>
                                    <input type='hidden' name='pageNum' value='<c:out value ="${pageMaker.cri.pageNum}"/>'/>
                                    <input type="text" name = "keyword" placeholder="Search here..." value='<c:out value = "${pageMaker.cri.keyword}"/>'/>
                                    <button type="submit"><i class="zmdi zmdi-search"></i></button>
                                </form>
                            </aside>
                            <!-- widget-categories -->
                            <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Categories</h6>
                                <div id="cat-treeview" class="product-cat">
                                    <ul id ="category">
                                    	<c:set var ="category_open" value="closed"/>
                                    	<c:if test="${pageMaker.cri.brand eq 'SAMSUNG'}">
                                    		<c:set var ="category_open" value="open"/>
                                    	</c:if>
                                        <li class='<c:out value="${category_open}" />'>
                                        	<a href="SAMSUNG">SAMSUNG</a>
                                            <ul id="SAMSUNG">
                                                <li><a href="Phone">Phone</a></li>
                                                <li><a href="Tab">Tab</a></li>
                                                <li><a href="Watch">Watch</a></li>
                                            </ul>
                                        </li>
                                        <c:set var ="category_open" value="closed"/>
                                        <c:if test="${pageMaker.cri.brand eq 'APPLE'}">
                                    		<c:set var ="category_open" value="open"/>
                                    	</c:if>                                       
                                        <li class='<c:out value="${category_open}" />'>
                                        	<a href="APPLE">APPLE</a>
                                            <ul id="APPLE">
                                                <li><a href="Phone">Phone</a></li>
                                                <li><a href="Tab">Tab</a></li>
                                                <li><a href="Watch">Watch</a></li>
                                            </ul>
                                        </li>
                                        
                                        <c:set var ="category_open" value="closed"/>
                                        <c:if test="${pageMaker.cri.brand eq 'LG'}">
                                    		<c:set var ="category_open" value="open"/>
                                    	</c:if>
                                        <li class='<c:out value="${category_open}" />'>
                                        <a href="#">LG</a>
                                            <ul id="LG">
                                                <li><a href="Phone">Phone</a></li>
                                            </ul>
                                        </li>
                                        
                                        <c:set var ="category_open" value="closed"/>
                                        <c:if test="${pageMaker.cri.brand eq 'GOOGLE'}">
                                    		<c:set var ="category_open" value="open"/>
                                    	</c:if>
                                        <li class='<c:out value="${category_open}" />'>
                                        <a href="#">GOOGLE</a>
                                            <ul id="GOOGLE">
                                                <li><a href="Phone">Phone</a></li>
                                            </ul>
                                        </li>
                                        
                                        <c:set var ="category_open" value="closed"/>
                                        <c:if test="${pageMaker.cri.brand eq 'BlackBerry'}">
                                    		<c:set var ="category_open" value="open"/>
                                    	</c:if>
                                        <li class='<c:out value="${category_open}" />'>
                                        <a href="#">BlackBerry</a>
                                            <ul id="BlackBerry">
                                                <li><a href="Phone">Phone</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </aside>
                            <!-- shop-filter -->
                            <aside class="widget shop-filter box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Price</h6>
                                <div class="price_filter">
                                    <div class="price_slider_amount">
                                        <input type="submit" value="Range :" style="width:30%">
                                        <input type="text" id="amount" name="price"  placeholder="Add Your Price" style="width:70%;" /> 
                                    </div>
                                    
                                    <div id="slider-range"></div>
                                </div>
                            </aside>

                            <!-- operating-system -->
                            <aside class="widget operating-system box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">통신사</h6>
                                <form id='categoryForm' action="/product/list" method='get'>
                                	<input type='hidden' name='pageNum' value='<c:out value ="${pageMaker.cri.pageNum}"/>'/>
                                	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>

                                	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
                                	<input type='hidden' name='brand' value='<c:out value="${pageMaker.cri.brand}"/>'>
                                	
                                	<input type='hidden' name='priceStart' value='<c:out value="${pageMaker.cri.priceStart}"/>'>
                                	<input type='hidden' name='priceEnd' value='<c:out value="${pageMaker.cri.priceEnd}"/>'>
                                	
                                    <label><input type="radio" name="carrier" id = "SKT" value="SKT">&nbsp; SKT</label><br>
                                    <label><input type="radio" name="carrier" id ="KT" value="KT">&nbsp; KT</label><br>
                                    <label><input type="radio" name="carrier" id="LGU+" value="LGU+">&nbsp; LG U+</label><br>
                                    <label class="mb-0"><input type="radio" name="carrier" id="알뜰폰" value="알뜰폰">&nbsp; 알뜰폰</label><br>
                                </form>
                            </aside>
                            <!-- widget-product -->
                            <aside class="widget widget-product box-shadow">
                                <h6 class="widget-title border-left mb-20">recent products</h6>
                                
                                <c:forEach items="${recentList}" var="product" varStatus="varstatus">
                                <div class="product-item">
                                    <div class="product-img">
                                        <a class ='move' href='<c:out value="${product.product_id}"/>'>
                                        <img id = 'recent-img${varstatus.index}' alt="image error" onError ="this.src='/resources/img/product/4.jpg'">
		                               <script>
		                               	var imageName = encodeURIComponent('${product.product_imageList[0].image_uploadPath}'+'/s_'+'${product.product_imageList[0].image_uuid}'+'_'+'${product.product_imageList[0].image_name}');
		                               	var realSrc = '/product/display?fileName='+imageName;
		                               	
		                           		document.getElementById('recent-img${varstatus.index}').src= realSrc;
										</script>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <h6 class="product-title">
                                            <a class="move" href='<c:out value="${product.product_id}"/>'><c:out value="${product.product_title}"/></a>
                                        </h6>
                                        <h3 class="pro-price"><fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="3"/>원</h3>
                                    </div>
                                </div>
                                </c:forEach>
                            
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->
        </div>
        <!-- End page content -->

<!-- modal -->
<div class="modal fade" id ="myModal" tabindex="-1" role ="dialog"
aria-lablelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type = "button" class = "close" data-dimiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class= "modal-title" id ="myModalLabel">Modal Title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class = "modal-footer">
				<button type ="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 상품 클릭 후 이동 -->
<form id='actionForm' action="/product/get" method='get'>
 	<input type='hidden' name='product_id' value=''>
</form>
<%@include file = "/WEB-INF/views/purchase/CartModal.jsp" %>
<%@include file="/WEB-INF/views/layout/foot.jsp" %>


<%@include file="/WEB-INF/views/product/QuickViewModal.jsp" %>
<script type="text/javascript" src="/resources/js/cartModal.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(reusult){
		//모달창은 한번만 보여주도록 history를 사용한다.
		if(result ==='' || history.state){
			return;
		}
		
		if(parseInt(result)>0){
			$(".modal-body").html("게시글"+parseInt(result)+" 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click",function(){
		self.location = "/product/register";
	});
	
	// 개별 상품 조회
	var actionForm = $("#actionForm");
	$(".move").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='product_id']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	// 검색
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click",function(e){
		var word = $.trim(searchForm.find("input[name='keyword']").val());
		if(!word || word==""){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='keyword']").val(word);
		e.preventDefault();
		
		searchForm.submit();
	});
	
	// 페이징 처리
	var categoryForm = $("#categoryForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		
		console.log('click');
		
		// 숫자 버튼눌렀을때 그 숫자값(href)을 pageNum값으로 바꾼다.
		categoryForm.find("input[name='pageNum']").val($(this).attr("href"));
		categoryForm.submit();
		
	});
	
	// 카테고리 선택	
	$("#category li ul li a").on("click",function(e){
		e.preventDefault();
		
		var word = $.trim(searchForm.find("input[name='keyword']").val());
		categoryForm.find("input[name='keyword']").val(word);
		
		categoryForm.find("input[name='pageNum']").val("1");
		categoryForm.find("input[name='type']").val($(this).attr("href"));
		categoryForm.find("input[name='brand']").val($(this).closest('ul').attr("id"));
		
		categoryForm.submit();
	});

	// 통신사 선택
	$("#categoryForm input[type='radio']").on("click", function(e){
		e.preventDefault();
		
		var word = $.trim(searchForm.find("input[name='keyword']").val());
		categoryForm.find("input[name='keyword']").val(word);
		categoryForm.find("input[name='pageNum']").val("1");
		
		categoryForm.submit();
	})
	
	// 통신사 선택 유지
	var carrier = "${pageMaker.cri.carrier}";
	switch(carrier){
	case "SKT":
		document.getElementById('SKT').checked = true;
		break;
	case "KT":
		document.getElementById('KT').checked = true;
		break;
	case "LGU+":
		document.getElementById('LGU+').checked = true;
		break;
	case "알뜰폰":
		document.getElementById('알뜰폰').checked = true;
		break;
	
	}
	
	// 가격대 설정
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 4000000,
      values: [ "${pageMaker.cri.priceStart}", "${pageMaker.cri.priceEnd}" ],
      step:10000,
      slide: function( event, ui ) {
        $( "#amount" ).val( numberWithCommas(ui.values[ 0 ]) + "원 ~ " + numberWithCommas(ui.values[ 1 ]) +"원");
      },
      change: function( event, ui){
    	  console.log("change");
    	  categoryForm.find("input[name='pageNum']").val("1");
  		  var word = $.trim(searchForm.find("input[name='keyword']").val());
		  categoryForm.find("input[name='keyword']").val(word);
    	  categoryForm.find("input[name='priceStart']").val(ui.values[0]);
    	  categoryForm.find("input[name='priceEnd']").val(ui.values[1]);
    	  categoryForm.submit();
      }
    });
	
	// 가격대 설정유지
    $( "#amount" ).val( numberWithCommas($( "#slider-range" ).slider( "values", 0 )) +
      "원 ~ " + numberWithCommas($( "#slider-range" ).slider( "values", 1 )) +"원" );
	
	// gridView ListView 탭 유지
	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
		// 클릭한 탭이 보이기전에 실행
		// localStorage에 activeTab이라는 이름으로 저장
		localStorage.setItem('activeTab', $(e.target).attr('href'));
	});
	
	var activeTab = localStorage.getItem('activeTab');
	if(activeTab){
		$('a[data-toggle="tab"][href="' + activeTab + '"]').tab('show');
	}
	
	
});
	
var msg="${msg}";

if(msg=="SUCCESS"){
	alert("성공적으로 추가되었습니다!");
	}else if(msg=="FAIL"){
	alert("이미 위시리스트에 존재하는 상품입니다");
}

var msg="${insertmsg}";

if(msg=="SUCCESS"){
	alert("성공적으로 추가되었습니다!");
	}else if(msg=="FAIL"){
	alert("이미 장바구니에 존재하는 상품입니다");
}	

</script>
