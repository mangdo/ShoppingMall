<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>
<script src="/resources/js/vendor/jquery-3.1.1.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Login / Register</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li>Login / Register</li>
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

            <!-- LOGIN SECTION START -->
            <div class="login-section mb-80">
                <div class="container">
                    <div class="row">
                        <!-- new-customers -->
                        <div class="col-md-6">
                            <div class="new-customers">
                                <form id="my-form" action="/mypage/newCustomers" method="post">
                                    <h6 class="widget-title border-left mb-50">NEW CUSTOMERS</h6>
                                    <div class="login-account p-30 box-shadow">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="text" name="firstname" id="firstname" placeholder="First Name">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" name="lastname" id="lastname" placeholder="last Name">
                                            </div>
                                               <div class="col-sm-6">
                                                <input type="text" name="postalcode" id="sample4_postcode" placeholder="Postal Code...">                                                
                                            </div>
                                            <div class="col-sm-6">
                                            	<input type="button" class="submit-btn-1 btn-hover-1" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">                                  
                                            </div>
                                        </div>
                                        <input type="text" id="address" name="address" placeholder="Specific Address here...">
                                        <input type="text" id="phonenum" name="phonenum" placeholder="Phone here...">                                       
                                        <input type="text" id="email" name="email" placeholder="Email address here...">
                                        <input type="password" id="pass" name="userpw" placeholder="Password">
                                        <input type="password"  id="pass-check" placeholder="Confirm Password">
                                        <div class="checkbox">
                                            <label class="mr-10"> 
                                                <small>
                                                    <input type="checkbox" name="signup">Sign up for our newsletter!
                                                </small>
                                            </label>
                                            <label> 
                                                <small>
                                                    <input type="checkbox" name="signup">Receive special offers from our partners!
                                                </small>
                                            </label>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1" type="submit">Register</button>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1 f-right" type="reset">Clear</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- LOGIN SECTION END -->             

        </div>
        
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById('sample4_postcode').value = data.zonecode;
        }
    }).open();
}


window.onload=function(){
	document.getElementById('my-form').onsubmit=function(){
		var pass=document.getElementById('pass').value;
		var passCheck=document.getElementById('pass-check').value;
		var email=document.getElementById('email').value;
		var phonenum=document.getElementById('phonenum').value;
		var postalcode=document.getElementById('sample4_postcode').value;
		var address=document.getElementById('address').value;
		var firstname=document.getElementById('firstname').value;
		var lastname=document.getElementById('lastname').value;
		if(pass==''){
			alert('please fill out all elements!');
			return false;
		}
		if(passCheck==''){
			alert('please fill out all elements!');
			return false;
		}
		if(email==''){
			alert('please fill out all elements!');
			return false;
		}
		if(firstname==''){
			alert('please fill out all elements!');
			return false;
		}
		if(lastname==''){
			alert('please fill out all elements!');
			return false;
		}
		if(postalcode==''){
			alert('please fill out all elements!');
			return false;
		}
		if(address==''){
			alert('please fill out all elements!');
			return false;
		}
		if(phonenum==''){
			alert('please fill out all elements!');
			return false;
		}
		if(pass!=passCheck){
			alert('Please Check Password Again!');
			return false;
		}else{
			alert('Register Success! Now Please Log-In')
		}
	}
}
</script>



        <!-- End page content -->
<%@include file="/WEB-INF/views/layout/foot.jsp" %>

                             