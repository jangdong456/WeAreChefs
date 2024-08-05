<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
<!-- Start -->
	<table class="table">
		<thead>
			<tr>
				<th>공지 번호</th>
				<th>회원 아이디</th>
				<th>공지 제목</th>
				<th>공지 작성일</th>
				<th>공지 수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${list}" var="list">
				<tr>
					<td>${list.board_num}</td>
				</tr>
			</c:forEach>
				
		</tbody>
	</table>


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
