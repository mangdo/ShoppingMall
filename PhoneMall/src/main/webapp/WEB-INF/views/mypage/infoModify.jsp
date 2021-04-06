<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="/WEB-INF/views/layout/top.jsp" %>


        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">My Info Modify</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="/">Home</a></li>
                                    <li><a href="/myPurchase">myPurchase</a></li>
                                    <li><a href="/mypage/myInfo">MyInfo</a></li>
                                    <li><a href="/mypage/myReviews">myReviews</a></li>
                                    <li><a href="/mypage/myCoupon">MyCoupons</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->
        <div class="container">
        	<div class="row">
        		<div class="col-md-12 mb-40">
        			<div class="section-title text-left mb-40">
						<h2 class="uppercase">my info modify</h2>
						<h6 >개인 정보를 변경 합니다.</h6>
					</div>
        			<form id="form1" action='<c:url value="/mypage/update"/>' method="post">
        			  <table class="table table-bordered" style="color:rgb(0, 0, 0);">
					    <tbody>
					      <tr>
					        <th scope="row">이메일</th>
					        <td><input onclick="alert('email은 수정이 불가합니다!')" name="email" value="<sec:authentication property="principal.user.email"/>" readonly="readonly"></td>
					      </tr>
					      <tr>
					        <th scope="row">이름</th>
					        <td><input name="lastname" id="lastname" value="<sec:authentication property="principal.user.lastname"/>">  <input name="firstname" id="firstname" value="<sec:authentication property="principal.user.firstname"/>"></td>					  
					      </tr>
					      <tr>
					        <th scope="row">우편번호</th>
					        <td><input name="postalcode" id="sample4_postcode" value="<sec:authentication property="principal.user.postalcode"/>">  <input type="button" class="submit-btn-1 btn-hover-1" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
					      </tr>
					      <tr>
					        <th scope="row">주소</th>
					        <td><input name="address" id="address" size="50" value="<sec:authentication property="principal.user.address"/>"></td>
					      </tr>
					      <tr>
					        <th scope="row">휴대번호</th>
					        <td><input name="phonenum" id="btnUpdate" size="50" value="<sec:authentication property="principal.user.phonenum"/>"></td>
					      </tr>	    
					    </tbody>
					  </table>
					  <button class="btn-lg btn-primary f-right" type="submit" onClick="alert('Success! Now Please login again!')">확인</button>
					</form>				
				</div>
			</div>
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
	document.getElementById('form1').onsubmit=function(){
		var phonenum=document.getElementById('phonenum').value;
		var postalcode=document.getElementById('sample4_postcode').value;
		var address=document.getElementById('address').value;
		var firstname=document.getElementById('firstname').value;
		var lastname=document.getElementById('lastname').value;
		
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
	}
}
</script>
		
		
<%@include file="/WEB-INF/views/layout/foot.jsp" %>        		