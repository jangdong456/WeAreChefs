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
        <h1 class="text-center text-white display-6">Notice</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
<!--             <li class="breadcrumb-item"><a href="N">Pages</a></li>-->
            <li class="breadcrumb-item"><a href="./list">Notice</a></li>
            <li class="breadcrumb-item active text-white">Detail</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
    <table class="table">
        <thead>
	        <tr>
	            <th scope="col">공지번호</th>
	            <th scope="col">회원아이디</th>
	            <th scope="col">공지제목</th>
	            <th scope="col">공지작성일</th>
	            <th scope="col">공지수정일</th>
	        </tr>
        </thead>
        <tbody>
          	<tr>
          		<th>${noticeDetail.board_num}</th>
          		<th>${noticeDetail.member_id}</th>
          		<th>${noticeDetail.board_title}</th>
          		<th>${noticeDetail.create_date}</th>
          		<th>${noticeDetail.update_date}</th>
         	</tr>
        </tbody>
    </table>
    <h1>${noticeDetail.board_content} 내용</h1>	


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
