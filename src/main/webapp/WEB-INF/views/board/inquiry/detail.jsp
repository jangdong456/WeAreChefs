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
	          		<th>${inquiryDetail.board_num}</th>
	          		<th>${inquiryDetail.member_id}</th>
	          		<th>${inquiryDetail.board_title}</th>
	          		<th>${inquiryDetail.create_date}</th>
	          		<th>${inquiryDetail.update_date}</th>
	         	</tr>
	        </tbody>
	    </table>
	    <div>
			<textarea disabled name="text" class="form-control" cols="30" rows="11">${inquiryDetail.board_content}</textarea>
		</div>
		<!-- & Todo Start : 이부분은 관리자 레벨만 보이도록 해야함. -->
		<hr>
		<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/${page}/update?board_num=${inquiryDetail.board_num}">Update</a>
		<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/${page}/delete?board_num=${inquiryDetail.board_num}">Delete</a>
		<!-- & Todo Final : 이부분은 관리자 레벨만 보이도록 해야함. -->
		
		<c:if test="${inquiryDetail.board_type eq 2}">
			<div class="container"t>
				<hr>
				<h1>댓글</h1>
			</div>
		</c:if>
	</div>
	</div>


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
