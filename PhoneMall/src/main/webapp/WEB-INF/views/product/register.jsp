<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layout/top.jsp" %>

 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Product Register Form</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Product</a></li>
                                    <li>Register Form</li>
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
                                <form role="form" action="/product/register" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4 class="blog-section-title border-left mb-30">제품 등록</h4>
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="text" name="product_title" placeholder="Product Tittle">
                                        </div>
                                        <div class="col-lg-12">
                                            <input type="text" name="product_price" placeholder="Product Price">
                                        </div>
                                        <div class="col-lg-12">
                                        	<div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">Color</p>
                                                    <div class="widget-color f-left">
                                                        <ul>
                                                            <li class="color-1">
                                                            	<input type="checkbox" id="product_colorList" value = "pink"> &nbsp;
                                                            </li>
                                                            <li class="color-2">
                                                                <input type="checkbox" id="product_colorList" value = "brown"> &nbsp;                                              
                                                            </li>
                                                            <li class="color-3">
                                                            	<input type="checkbox" id="product_colorList" value = "red"> &nbsp;
                                                            </li>
                                                            <li class="color-4">
                                                            	<input type="checkbox" id="product_colorList" value = "blue"> &nbsp;
                                                            </li>
                                                            <li class="color-5">
                                                            	<input type="checkbox" id="product_colorList" value = "lightGreen"> &nbsp;
                                                            </li>
                                                            <li class="color-6">
                                                            	<input type="checkbox" id="product_colorList" value = "green"> &nbsp;
                                                            </li>
                                                        </ul>
                                                        <br/>
                                                    </div>
                                                </div>
                                        	</div>
                                        </div>
                                        
                                        <div class="col-lg-6">
											<p class="color-title f-left">Image</p>
											<input type="file" id='main_image' name='uploadImage' accept = "image/jpg, image/jpeg, image/png, image/gif" multiple>
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
                                            <textarea class="custom-textarea mb-20" name="product_information" placeholder="제품 정보"></textarea>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            <textarea class="custom-textarea" name="product_description" placeholder="제품 설명"></textarea>
                                        </div>
                                      
                                        <div class="col-lg-12">
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="submit">등록</button>
                                        	<button class="submit-btn-1 mt-30 btn-hover-1" type="reset" style="background-color : #575757;">초기화</button>
                                        </div>
                                    </div>
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
 
<script>
// 업로드 가능한 파일인지 확인
var fileForm = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$","i");
var maxSize = 5 * 1024 * 1024; //5MB

function imageCheck(fileName, fileSize){
	var imgFile = $('#main_image').val();

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
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
	    
		// 이미지 파일 체크
		var inputImage = $("input[name='uploadImage']");
		var images = inputImage[0].files;
		for(var i = 0; i < images.length; i++){
			if(!imageCheck(images[i].name, images[i].size)){
				return false;
			}
		}
		if(!inputImage.val()) {
			alert("첨부파일은 필수!");
		    $("#main_image").focus();
		    return false;
		}
		
	    var str ="";
	    $("input[id='product_colorList']:checked").each(function(i) {
	    	// 색깔이 체크된 것만 값을 뽑아서 배열에 push
	    	str += "<input type ='hidden' name='product_colorList["+i+"].product_color' value='"+$(this).val()+"'>";
	    });

	    formObj.append(str).submit();
	});
	
});

</script>