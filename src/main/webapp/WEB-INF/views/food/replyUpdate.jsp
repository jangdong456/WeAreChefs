<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

         <textarea class="form-control areaContext" cols="30" rows="8" id="updateContent" data-reply-num="${dto.food_reply_num}" data-reply-writer="${dto.member_id}">${dto.reply_content}</textarea>
         <p class="mt-2">*별점 수정하기</p>
                                                    <c:choose>
                                                    	<c:when test="${dto.food_rating=='1'}">
	                                                    <div class="d-flex mb-3">
	                                                        <i class="fa fa-star text-secondary stars" id="firstUpdate"></i>
	                                                        <i class="fa fa-star stars" id="secondUpdate"></i>
	                                                        <i class="fa fa-star stars" id="thirdUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fourthUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fifthUpdate"></i>
	                                                    </div>
	                                                    </c:when>
                                                    	<c:when test="${dto.food_rating=='2'}">
	                                                    <div class="d-flex mb-3">
	                                                        <i class="fa fa-star text-secondary stars" id="firstUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="secondUpdate"></i>
	                                                        <i class="fa fa-star stars" id="thirdUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fourthUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fifthUpdate"></i>
	                                                    </div>
	                                                    </c:when>
	                                                    <c:when test="${dto.food_rating=='3'}">
	                                                    <div class="d-flex mb-3">
	                                                        <i class="fa fa-star text-secondary stars" id="firstUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="secondUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="thirdUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fourthUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fifthUpdate"></i>
	                                                    </div>
	                                                    </c:when>
                                                    	<c:when test="${dto.food_rating=='4'}">
	                                                    <div class="d-flex mb-3">
	                                                        <i class="fa fa-star text-secondary stars" id="firstUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="secondUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="thirdUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="fourthUpdate"></i>
	                                                        <i class="fa fa-star stars" id="fifthUpdate"></i>
	                                                    </div>
	                                                    </c:when>
	                                                    <c:otherwise>
	                                                 	<div class="d-flex mb-3">
	                                                        <i class="fa fa-star text-secondary stars" id="firstUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="secondUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="thirdUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="fourthUpdate"></i>
	                                                        <i class="fa fa-star text-secondary stars" id="fifthUpdate"></i>
	                                                    </div>
	                                                    </c:otherwise>
	                                                </c:choose>
			<input type="hidden" id="updateStarValue">
             <div class="button-container justify-content-end" align="right" >
             <p class="updateReply" data-reply-num="${dto.food_reply_num}" id="newUpdate">수정 완료</p>
         </div>