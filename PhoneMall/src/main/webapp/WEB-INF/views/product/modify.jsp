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
                                <form role="form" id="modify-form" action="/product/modify" method="post" enctype="multipart/form-data">
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

                                        <div class="col-lg-6">
                                        	<p class="color-title f-left">메인 사진</p>
											<ul class="newMainImageList" style="margin-left:80px;">
											<c:forEach items="${product.product_imageList }" var="image" varStatus ="vs">
												<c:if test="${image.image_type eq 'mainImage' }">
													<li>${image.image_name }<button type="button" data-index="${vs.index}"> x </button></li>
												</c:if>
											</c:forEach>
											</ul>
											
										</div>
										<div class="col-lg-6">
											<p class="color-title f-left">추가 사진</p>
											<input type="file" id='newSubImage' name='newSubImage' accept = "image/jpg, image/jpeg, image/png, image/gif" multiple
													style="margin-bottom:5px;">
                                        	<ul class="newSubImageList" style="margin-left:80px;">
											<c:forEach items="${product.product_imageList }" var="image" varStatus ="vs">
												<c:if test="${image.image_type eq 'subImage' }">
													<li>${image.image_name }
														<button type="button" data-index="${vs.index}"> x </button>
													</li>
												</c:if>
											</c:forEach>
											</ul>
                                        </div>
                                        
                                        <div class="col-lg-6">
											<p class="color-title f-left">통신사</p>
											<select class="custom-select" name = product_carrier>
												<option value="SKT">SKT</option>
												<option value="KT">KT</option>
												<option value="LGU+">LGU+</option>
												<option value="알뜰폰">알뜰폰</option>
											</select>
                                        </div>
                                        <div class="col-lg-6">
											<p class="color-title f-left">Brand</p>
											<select class="custom-select" name = product_brand>
												<option value="SAMSUNG">SAMSUNG</option>
												<option value="APPLE">APPLE</option>
												<option value="LG">LG</option>
												<option value="GOOGLE">GOOGLE</option>
												<option value="BlackBerry">BlackBerry</option>
											</select>
                                        </div>
                                        
                                        <div class="col-lg-6">
											<p class="color-title f-left">Type</p>
											<select class="custom-select" name = product_type>
												<option value="Phone">Phone</option>
												<option value="tab">tab</option>
												<option value="watch">watch</option>
											</select>   
                                        </div>
                                        
                                        <div class="col-lg-12">
                                        	<textarea class="custom-textarea mb-20" name="product_information" placeholder="제품 정보"><c:out value='${product.product_information}'/></textarea>
                                            <textarea class="custom-textarea" name="product_description" placeholder="제품 설명"><c:out value='${product.product_description}'/></textarea>
                                        	
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" data-oper='modify'>수정</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" style="background-color : #575757;" data-oper='remove'>삭제</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" style="background-color : #4FC1F0;" data-oper='list'>목록</button>
                                        </div>

                                    </div>
                                    <c:forEach items="${product.product_imageList }" var="image" varStatus="vs">
                                    	<input type='hidden' name="product_imageList[${vs.index }].image_uuid" value='${image.image_uuid }'>
										<input type='hidden' name="product_imageList[${vs.index }].image_uploadPath" value='${image.image_uploadPath }'>
										<input type='hidden' name='product_imageList[${vs.index }].image_name' value='${image.image_name}'>
										<input type='hidden' name='product_imageList[${vs.index }].image_type' value='${image.image_type }'>
										<input type='hidden' name='product_imageList[${vs.index }].product_id' value='${product.product_id}'>
                                    </c:forEach>
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
 var fileForm = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$","i");
 var maxSize = 5 * 1024 * 1024; //5MB
 
 function imageCheck(fileName, fileSize){
	var imgFile = $('#newMainImage').val();

	if(imgFile != "" && imgFile != null) {	    
	    if(!imgFile.match(fileForm)) {
	    	alert("이미지 파일(jpg|jpeg|png|gif)만 업로드 가능");
	        return false;
	    } else if(fileSize >= maxSize) {
	    	alert("파일 사이즈는 5MB까지 가능");
	        return false;
	    }
	}
	return true;
}
 
 $(document).ready(function(){
	 var formObj = $("#modify-form");
	 
	 $('.submit-btn-1').on("click",function(e){
		 e.preventDefault();
		 
		 var operation = $(this).data("oper");
		 		 
		 if(operation==='remove'){
			 
			formObj.attr("action","/product/remove");
			 
		 }else if(operation==='modify'){
			var str ="";
			// 메인 이미지 파일 체크
			if ($('#newMainImage').length) {
				var mainImage = $("input[name='newMainImage']");
				if(!imageCheck(mainImage[0].files.name, mainImage[0].files.size)){
					return false;
				}
				
				if(!mainImage.val()) {
					alert("메인 사진은 필수!");
				    return false;
				}
			}
			// subimage check
			var subImage = $("input[name='newSubImage']");
			if(subImage.val()){
				var images = subImage[0].files;
				for(var i = 0; i < images.length; i++){
					if(!imageCheck(images[i].name, images[i].size)){
						return false;
					}
				}
			}
		    $("input[name='colorList']:checked").each(function(i) {
		    	// 체크된 것만 값을 뽑아서 push in array
		    	str += "<input type ='hidden' name='product_colorList["+i+"].product_color' value='"+$(this).val()+"'>";
		    });
		    
		    
		    
		    formObj.append(str).submit();
		 
		 }else if(operation==='list'){
			 //move to list with empty form
			 formObj.attr("action","/product/list").attr("method","get");
			 formObj.empty();
		 }
		 formObj.submit();
	 });
	
	// Immediately-invoked function to get colorList 
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
		
	$('.newMainImageList').on("click","button",function(e){
		e.preventDefault();
		 
		var str ="<li><input type='file' id='newMainImage' name='newMainImage' accept = 'image/jpg, image/jpeg, image/png, image/gif' style='margin-bottom:5px;'></li>";
		$(this).closest("li").remove();
		$(".newMainImageList").append(str);
		
		var index = $(this).attr("data-index");
		var str = "<input type='hidden' name='product_imageList["+ index +"].image_type' value='deleteMain'>";

		
		formObj.append(str);
		
	});
	
	$('.newSubImageList li button').on("click",function(e){
		 e.preventDefault();
		 
		var index = $(this).attr("data-index");
		var str = "<input type='hidden' name='product_imageList["+ index +"].image_type' value='deleteSub'>";
		
		$(this).closest("li").remove();
		formObj.append(str);
	});
	
 });
 
 </script>