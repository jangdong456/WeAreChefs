<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

				.centerTr {
					text-align: center;
				}
			</style>

		</head>

		<body>
			<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
			<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
			<input type="hidden" id="whatPage" value="${page}">
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
					<div>
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
-->
						<div class="row justify-content-md-center">
							<form method="get" action="./list">
								<div style="display: flex; justify-content: space-between; align-items: center;">
									<div style="text-align: center; flex-grow: 1;">
										<select name="kind" style="height: 40px; padding: 5px; border-radius: 5px; border: 1px solid #ccc;">
											<option value="board_title">문의 제목</option>
											<option value="member_id">회원 아이디</option>
										</select>
										<input type="search" name="search"
											style="height: 40px; width: 500px; padding: 5px; border-radius: 5px; border: 1px solid #ccc; margin-left: 10px;">
										<button type="submit"
											style="height: 40px; padding: 5px 15px; border-radius: 5px; border: none; background-color: #81c408; color: white; margin-left: 10px; cursor: pointer;">
											검색
										</button>
									</div>
									<c:if test="${page == 'fna'}">
										<c:if test="${memberJ.member_lev > 0}">
											<div>
												<a href="/board/${page}/add"
													class="btn border-secondary rounded-pill px-4 py-3 text-primary ml-1" type="button">add</a>
											</div>
										</c:if>
									</c:if>
									<c:if test="${page == 'qna'}">
										<div>
											<a href="/board/${page}/add"
												class="btn border-secondary rounded-pill px-4 py-3 text-primary ml-1" type="button">add</a>
										</div>
									</c:if>
								</div>
							</form>

						</div>
						<!-- Add a태그는 부분은 관리자만 보이도록 해야함-->
						<table class="table">
							<thead>
								<tr class="centerTr">
									<th style="width: 5%;">번호</th>
									<th style="width: 15%;">닉네임</th>
									<th style="width: 50%;">문의제목</th>
									<th style="width: 10%;">문의작성일</th>
									<th style="width: 10%;">문의수정일</th>
									<th style="width: 10%;">조회수</th>
								</tr>
							</thead>
							<tbody id="inquiryTbody">
								<c:forEach items="${inquiryList}" var="ar">
									<tr class="centerTr">
										<th>${ar.board_num}</th>
										<th>${ar.member_nickname}</th>
										<th><a id="inquiryAtag${ar.board_num}" data-inquiryHit="${ar.board_num}"
												href="/board/${page}/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
										<th>${ar.create_date}</th>
										<th>${ar.update_date}</th>
										<th>${ar.hit}</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
		</body>
		<script>
			let inquiryTbody = document.getElementById("inquiryTbody");
			let page = document.getElementById("whatPage").value

			inquiryTbody.addEventListener("click", (e) => {
				let id = e.target.getAttribute("id");
				let dataInquiryHit = e.target.getAttribute("data-inquiryHit");
				let aId = "inquiryAtag" + dataInquiryHit;
				console.log("id : " + id);
				console.log("data : " + dataInquiryHit);
				console.log("aId : " + aId);
				if (id == aId) {
					fetch("/board/" + page + "/hitUpdate?board_num=" + dataInquiryHit, {
						method: "GET"
					})
						.then(r => r.text())
						.then(r => {
							console.log("실행");
							console.log(r);
							inquiryTbody.innerHTML = r
							console.log("됨");
						})
				}
			})
		</script>

		</html>