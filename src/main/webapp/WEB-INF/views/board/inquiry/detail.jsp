<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

</head>
<body>
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
<!-- Start -->
	<!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Inquiry</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="./list">${page}</a></li>
            <li class="breadcrumb-item active text-white">Detail</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
    <div class="container-fluid py-5">
    <div class="container py-5">
	    <table class="table">
	        <thead>
		        <tr>
		            <th scope="col">문의번호</th>
		            <th scope="col">회원아이디</th>
		            <th scope="col">문의제목</th>
		            <th scope="col">문의작성일</th>
		            <th scope="col">문의수정일</th>
		        </tr>
	        </thead>
	        <tbody>
	          	<tr>
	          		<th id="qnaBoardNum" data-qnaBoardNum="${inquiryDetail.board_num}">${inquiryDetail.board_num}</th>
	          		<th>${inquiryDetail.member_id}</th>
	          		<th>${inquiryDetail.board_title}</th>
	          		<th>${inquiryDetail.create_date}</th>
	          		<th>${inquiryDetail.update_date}</th>
	         	</tr>
	        </tbody>
	    </table>
	    <div class="text-center">
			${inquiryDetail.board_content}
		</div>
		<!-- & Todo Start : 이부분은 관리자 레벨만 보이도록 해야함. -->
		<hr>
		<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/${page}/update?board_num=${inquiryDetail.board_num}">Update</a>
		<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/${page}/delete?board_num=${inquiryDetail.board_num}">Delete</a>
		<!-- & Todo Final : 이부분은 관리자 레벨만 보이도록 해야함. -->
		
		<div id="commentList">
			<c:if test="${inquiryDetail.board_type eq 2}">
        <div class="container">
            <hr>
            <h1>댓글 목록</h1>

        </div>
        <input type="text" id="replyInput">
        <button id="qnaReplyBtn">댓글 달기</button>
            <c:forEach items="${inquiryDTOList}" var="list">
                <table id="${list.board_num}">
                    <thead>
                        <tr >
                            <th>작성자 : ${list.member_id}</th>
                            <th>작성일 : ${list.create_date}</th>
														<c:if test="${not empty list.update_date}">
															<th>수정일 : ${list.update_date}</th>    
														</c:if>
														<c:if test="${empty list.del}">
															<td><button id="replyUpdate${list.board_num}" data-replyBoardNum="${list.board_num}">수정</button></td>
															<td><button id="replyDelete${list.board_num}" data-replyBoardNum="${list.board_num}">삭제</button></td>
														</c:if>
													<!-- <c:if test="${list.member_id} eq ${member.member_id}"> -->
													<!-- </c:if> -->
                        </tr>
                    </thead>
                    <tbody>
                        <td>  ↳ ${list.board_content}</td>
                    </tbody>
                </table>
            </c:forEach>
    		</c:if>
		</div>
	</div>
	</div>
<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script src="/resources/js/jerry/QnaReply.js"></script>
</body>
</html>
