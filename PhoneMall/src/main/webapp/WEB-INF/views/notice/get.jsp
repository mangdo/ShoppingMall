<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@include file="/WEB-INF/views/layout/top.jsp" %>
<!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Single Blog</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Home</a></li>
                                    <li>Single Blog</li>
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

            <!-- BLOG SECTION START -->
            <div class="blog-section mb-50">
                <div class="container">
                	<div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-left ">
                                <h2 class="uppercase mb-40">Notice</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="blog-details-area">
                            
                                <div class="blog-share-tags box-shadow clearfix mb-60">
                                    <table class="table" style="margin-bottom:0px;">
										<thead>
											<tr>
		                                        <th class="share-tags-title" style="width:10%;">title</th>
		                                        <td style="color:#666666; border-bottom:2px solid #ddd;"><c:out value="${notice.notice_title }"/></td>
		                                    </tr>
										</thead>
		                                <tbody>
		                                    <!-- tr -->
		                                    
		                                    <tr>
		                                        <th class="share-tags-title">writer</th>
		                                        <td> <c:out value="${notice.notice_writer }"/></td>
		                                    </tr>
		                                    <tr>
		                                        <th class="share-tags-title">date</th>
		                                        <td> <fmt:formatDate value="${notice.notice_regDate }" type="both"/> </td>
		                                    </tr>
		                                   </tbody>
                                        </table>

                                </div>
                                
                                <!-- blog-details-photo -->
                                <div class="col-lg-12">
                                	<div class="col-lg-3"></div>
	                                <div class="col-lg-6 blog-details-photo bg-img-1 p-20 mb-30">
	                                    <img id="notice-img" onError ="this.src='/resources/img/blog/10.jpg'" alt="error"
	                                    style="width:100%;height:100%">
	                                    <script>
                                           	var imageName = encodeURIComponent('${notice.notice_image.image_uploadPath}'+'/'+'${notice.notice_image.image_uuid}'+'_'+'${notice.notice_image.image_name}');
                                           	var realSrc = '/product/display?fileName='+imageName;
                                       		document.getElementById('notice-img').src= realSrc;
										</script>
	                                    <div class="today-date bg-img-1">
	                                    	<fmt:setLocale value="en_US" scope="session"></fmt:setLocale>
											
	                                        <span class="meta-date"><fmt:formatDate value="${notice.notice_regDate }" pattern="dd"/></span>
	                                        <span class="meta-month"><fmt:formatDate value="${notice.notice_regDate }" pattern="MMM"/></span>
	                                    	<fmt:setLocale value="ko_kr" scope="session"></fmt:setLocale>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3"></div>
                                </div>
                                
                                <!-- blog-description -->
                                <div class="blog-description mb-60">                                  
                                    <p><pre style="background-color:transparent; border: none"> ${notice.notice_description} </pre>
                                	<a class="button extra-small button-white f-right" href='modify?notice_id=${notice.notice_id }'><span>수정</span></a>
                                	<a class="button extra-small button-white f-right" href='javascript:remove()'><span>삭제</span></a>
                                </div>
                                <hr style="border-bottom:2px solid #eeeeee">
                                <div class="text-center"> <a class="button extra-small button-black mb-20" href="list"><span>LIST</span></a></div>
								<table class="table table-bordered">
	                                <tbody>
	                                    <tr>
	                                        <th class="share-tags-title" style="width:10%"> &nbsp;&#9650;&nbsp;prev </th>
	                                        <td> 
		                                        <c:if test="${notice.prev_id ne null}">
		                                        	<a href="get?notice_id=${notice.prev_id}"><c:out value="${notice.prev_title}"/></a>
		                                        </c:if>
		                                        <c:if test="${notice.prev_id eq null}">이전글이 없습니다.</c:if>
	                                        </td>
	                                    </tr>
	                                    <tr style="border-bottom: 1px solid #ddd; ">
	                                        <th class="share-tags-title">&nbsp;&#9660;&nbsp;next </th>
	                                        <td> 
		                                        <c:if test="${notice.next_id ne null}">
		                                        	<a href="get?notice_id=${notice.next_id}"><c:out value="${notice.next_title}"/></a>
		                                        </c:if>
		                                        <c:if test="${notice.next_id eq null}">다음글이 없습니다.</c:if>
	                                        </td>
	                                    </tr>
	                                   </tbody>
	                               </table>
                            </div>
                        </div>
                     </div>
                 </div>
             </div>
         </section>
         
<form id='operForm' action='remove' method='post'>
	<input type="hidden" id='notice_id' name='notice_id' value='<c:out value="${ notice.notice_id}"/>'>
</form>

<%@include file="/WEB-INF/views/layout/foot.jsp" %>

<script>
$(document).ready(function(){
	function remove(){
		$("#operForm").submit();
	}
});
</script>