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
            <li class="breadcrumb-item active text-white">Update</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
    
	<div class="container-fluid py-5">
    	<div class="container py-5">
	    	<form method="post" action="./update">
	    		<input type="hidden" name="board_num" value="${inquiryDetail.board_num}">
	            <div class="form-item">
	               <label class="form-label my-3">공지 제목</label>
	               <input type="text" name="board_title" class="form-control" value="${inquiryDetail.board_title}">
	            </div>
	            <div class="form-item">
	               <label class="form-label my-3">공지 내용</label>
	               <textarea name="board_content" class="form-control" cols="30" rows="11">${inquiryDetail.board_content}</textarea>
	            </div>
	            <hr>
	            <button type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary">수정완료</button>
			</form>
    	</div>
     </div>
<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
