<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
FORM {
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
margin-left: 0px
}
</style>

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
            <li class="breadcrumb-item active text-white">List</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
        <div class="container-fluid mt-5 py-5">
            <div class="container py-5">
                <div class="table-responsive">
<!-- 	                <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
							<label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
							<select name="kind" class="form-select"
								id="inlineFormSelectPref p-1">
								<option value="board_title">문의 제목</option>
								<option value="member_id">회원 아이디</option>
							</select>
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
			      			<a href="/board/${page}/add" class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">add</a>
                        </div>
                    </div>
-->					<div class="row justify-content-md-center">
						<div class="text-center">
							<form method="get" action="./list">
								<select name="kind">
									<option value="board_title">문의 제목</option>
									<option value="member_id">회원 아이디</option>
								</select>
								<input type="search" name="search">
								<button type="submit">검색</button>
								<a href="/board/${page}/add" class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">add</a>
							</form>
						</div>
					</div>
                    <!-- Add a태그는 부분은 관리자만 보이도록 해야함-->
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">문의번호</th>
                            <th scope="col">회원아이디</th>
                            <th scope="col">문의제목</th>
                            <th scope="col">문의작성일</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${inquiryList}" var="ar">
                            	<tr>
                            		<th>${ar.board_num}</th>
                            		<th>${ar.member_id}</th>
                            		<th><a href="/board/${page}/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
                            		<th>${ar.create_date}</th>
                           		</tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <hr>
                h1
                <div class="text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
		   					 <a href="./list?page=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}" class="rounded ${pager.pre?'':'disabled'}" >&laquo;</a>
		                     <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">	
		                         <a href="./list?page=${i}&search=${pager.search}&kind=${pager.kind}" class="rounded">${i}</a>
		                     </c:forEach>
		                     <a href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}" class="rounded ${pager.next?'':'disabled'}">&raquo;</a>
						</ul>
					</nav>
                </div>
            </div>
        </div>
        <!-- Cart Page End -->


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
