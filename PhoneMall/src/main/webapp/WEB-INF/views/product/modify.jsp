<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/layout/top.jsp" %>


 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Product Modify Form</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Product</a></li>
                                    <li>Modify Form</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->   

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper section">

            <!-- MESSAGE BOX SECTION START -->
            <div class="message-box-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="message-box box-shadow white-bg">
                                <form role="form" id="modify-form" action="/product/modify" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4 class="blog-section-title border-left mb-30">제품 수정/삭제</h4>
                                        </div>
                                        <div class="col-lg-12">
                                        	<input type="hidden" name="product_id" value="<c:out value='${product.product_id}'/>">
                                            <input type="text" name="product_title" value="<c:out value='${product.product_title}'/>">
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="text" name="product_price" value="<c:out value='${product.product_price}'/>">
                                        </div>
                                        <div class="col-lg-12">
                                        	<div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">Color</p>
                                                    <div class="widget-color f-left">
                                                        <ul>
                                                            <li class="color-1">
                                                            	<input type="checkbox" id="pink" name="colorList" value = "pink"> &nbsp;
                                                            </li>
                                                            <li class="color-2">
                                                                <input type="checkbox" id="brown" name= "colorList" value = "brown"> &nbsp;                                              
                                                            </li>
                                                            <li class="color-3">
                                                            	<input type="checkbox" id="red" name="colorList" value = "red"> &nbsp;
                                                            </li>
                                                            <li class="color-4">
                                                            	<input type="checkbox" id="blue" name="colorList" value = "blue"> &nbsp;
                                                            </li>
                                                            <li class="color-5">
                                                            	<input type="checkbox" id="lightGreen" name="colorList" value = "lightGreen"> &nbsp;
                                                            </li>
                                                            <li class="color-6">
                                                            	<input type="checkbox" id="green" name="colorList" value = "green"> &nbsp;
                                                            </li>
                                                        </ul>
                                                        <br/>
                                                    </div>
                                                </div>
                                        	</div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            <textarea class="custom-textarea" name="product_description" placeholder="제품 설명"><c:out value='${product.product_description}'/></textarea>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" data-oper='modify'>수정</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" style="background-color : #575757;" data-oper='remove'>삭제</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" style="background-color : #4FC1F0;" data-oper='list'>목록</button>
                                        </div>

                                    </div>
                                    
                                    <!-- 목록페이지로 보내기위해서 -->
                                    <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
									<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
                                
                                </form>
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- MESSAGE BOX SECTION END -->               
        </section>
        <!-- End page content -->

 <%@include file="/WEB-INF/views/layout/foot.jsp" %>
 
 <script type="text/javascript">
 $(document).ready(function(){
	 var formObj = $("#modify-form");
	 
	 $('button').on("click",function(e){
		 e.preventDefault();
		 
		 var operation = $(this).data("oper");
		 
		 console.log(operation);
		 
		 if(operation==='remove'){
			 
			 formObj.attr("action","/product/remove");
			 
		 }else if(operation==='modify'){
			 var str ="";
			 
		    $("input[name='colorList']:checked").each(function(i) {
		    	// 체크된 것만 값을 뽑아서 배열에 push
		    	str += "<input type ='hidden' name='product_colorList["+i+"].product_color' value='"+$(this).val()+"'>";
		    });

		    formObj.append(str).submit();
		 
		 }else if(operation==='list'){
			 
			 //move to list
			 //pageNum과 amount를 제외한 <form>의 내용은 지운다.
			 formObj.attr("action","/product/list").attr("method","get");
			 var pageNumTag = $("input[name='pageNum']").clone();
			 var amountTag = $("input[name='amount']").clone();
			 
			 formObj.empty();
			 formObj.append(pageNumTag);
			 formObj.append(amountTag)
		 }
		 
		 formObj.submit();
	 });
	
	// colorList를 가져오는 즉시실행함수
	 (function(){
		 var id = '<c:out value = "${product.product_id}"/>';
		 
		 $.getJSON("/product/getColorList",{product_id : id}, function(arr){
			 console.log(arr);
			 str="";
			 
			 $(arr).each(function(i, color){
				
				if(color.product_color=="pink")
					$("input:checkbox[id='pink']").prop("checked", true);
				else if (color.product_color=="brown")
					$("input:checkbox[id='brown']").prop("checked", true);
				else if (color.product_color=="red")
					$("input:checkbox[id='red']").prop("checked", true);
				else if (color.product_color=="blue")
					$("input:checkbox[id='blue']").prop("checked", true);
				else if (color.product_color=="lightGreen")
					$("input:checkbox[id='lightGreen']").prop("checked", true);
				else if (color.product_color=="green")
					$("input:checkbox[id='green']").prop("checked", true);
				
			 });			 
		 }); 
	 })();
	
	
 });
 
 </script>