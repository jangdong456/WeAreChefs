<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<style type="text/css">
				li {
					display: inline;
				}

				.centerTr {
					text-align: center;
				}

				.rightDiv {
					display: inline;
					text-align: right;
				}

				.centerDiv {
					display: inline;
					text-align: center;
				}
			</style>
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
						<form method="get" action="./list">
							<div style="display: flex; justify-content: space-between; align-items: center;">
									<div style="text-align: center; flex-grow: 1;">
											<select name="kind" style="height: 40px; padding: 5px; border-radius: 5px; border: 1px solid #ccc;">
													<option value="board_title">제목</option>
													<option value="member_nickname">닉네임</option>
											</select>
											<input type="search" name="search" value="${pager.search}" style="height: 40px; width: 500px; padding: 5px; border-radius: 5px; border: 1px solid #ccc; margin-left: 10px;">
											<button type="submit" style="height: 40px; padding: 5px 15px; border-radius: 5px; border: none; background-color: #81c408; color: white; margin-left: 10px; cursor: pointer;">
													검색
											</button>
									</div>
									<c:if test="${member.member_lev > 0 }">
											<div>
													<a href="/board/notice/add" class="btn border-secondary rounded-pill px-4 py-3 text-primary ml-1" type="button">add</a>
											</div>
									</c:if>
							</div>
					</form>
						<table class="table">
							<thead>
								<tr class="centerTr">
									<th style="width: 5%;">번호</th>
									<th style="width: 15%;">닉네임</th>
									<th style="width: 50%;">제목</th>
									<th style="width: 10%;">작성일</th>
									<th style="width: 10%;">수정일</th>
									<th style="width: 10%;">조회수</th>
								</tr>
							</thead>
							<tbody id="noticeListTbody">
								<c:forEach items="${noticeList}" var="ar">
									<tr class="centerTr">
										<th>${ar.board_num}</th>
										<th>${ar.member_nickname}</th>
										<th><a id="noticeListAtag${ar.board_num}" data-noticeHit="${ar.board_num}" href="/board/notice/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
										<th>${ar.create_date}</th>
										<th>${ar.update_date}</th>
										<th>${ar.hit}</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Add a태그는 부분은 관리자만 보이도록 해야함-->
					</div>
					<hr>
					<div class="text-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<a href="./list?page=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}"
									class="btn rounded ${pager.pre?'':'disabled'}">&laquo;</a>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
									<a href="./list?page=${i}&search=${pager.search}&kind=${pager.kind}" class="rounded">${i}</a>
								</c:forEach>
								<a href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}"
									class="btn rounded ${pager.next?'':'disabled'}">&raquo;</a>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- Cart Page End -->


			<!-- End -->
			<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
			<script>
				let noticeListTbody = document.getElementById("noticeListTbody");

				noticeListTbody.addEventListener("click", (e)=>{
					let id = e.target.getAttribute("id");
					let dataNoticeHit = e.target.getAttribute("data-noticeHit");
					let aId = "noticeListAtag" + dataNoticeHit;
					console.log("id : " + id);
					console.log("data : " + dataNoticeHit);
					console.log("aId : " + aId);
					if(id = aId){
						fetch("/board/notice/hitUpdate?board_num="+dataNoticeHit, {
						method:"GET"
					})
					.then(r=>r.text())
					.then(r=>{
						console.log("실행");
						console.log(r);
						noticeListTbody.innerHTML = r
						console.log("됨");
					})
					}
				})
			</script>
		</body>

		</html>