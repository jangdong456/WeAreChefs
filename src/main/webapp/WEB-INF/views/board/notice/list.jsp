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
            <li class="breadcrumb-item active text-white">List</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
        <div class="container-fluid mt-5 py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">공지번호</th>
                            <th scope="col">회원아이디</th>
                            <th scope="col">공지제목</th>
                            <th scope="col">공지작성일</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${noticeList}" var="ar">
                            	<tr>
                            		<th>${ar.board_num}</th>
                            		<th>${ar.member_id}</th>
                            		<th><a href="/board/notice/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
                            		<th>${ar.create_date}</th>
                           		</tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                   
                    <!-- Add a태그는 부분은 관리자만 보이도록 해야함-->
			        <a href="/board/notice/add" class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">add</a>
                </div>
            </div>
        </div>
        <!-- Cart Page End -->


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
