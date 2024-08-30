<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<style>
				.centerTr {
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
							<tr class="centerTr">
								<th style="width: 5%;">번호</th>
								<th style="width: 15%;">닉네임</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 10%;">작성일</th>
								<th style="width: 10%;">수정일</th>
								<th style="width: 10%;">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr class="centerTr">
								<th id="qnaBoardNum" data-qnaBoardNum="${inquiryDetail.board_num}">${inquiryDetail.board_num}</th>
								<th>${inquiryDetail.member_nickname}</th>
								<th>${inquiryDetail.board_title}</th>
								<th>${inquiryDetail.create_date}</th>
								<th>${inquiryDetail.update_date}</th>
								<th>${inquiryDetail.hit}</th>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						${inquiryDetail.board_content}
					</div>
					<hr>
					<c:if test="${page == 'fna'}">
						<c:if test="${member.member_lev > 0}">
							<div style="text-align: right;">
								<a class="btn border-secondary rounded-pill px-4 py-3 text-primary"
									href="/board/${page}/update?board_num=${inquiryDetail.board_num}">Update</a>
								<a class="btn border-secondary rounded-pill px-4 py-3 text-primary"
									href="/board/${page}/delete?board_num=${inquiryDetail.board_num}">Delete</a>
							</div>
						</c:if>
					</c:if>
					<c:if test="${page == 'qna'}">
						<div style="text-align: right;">
							<a class="btn border-secondary rounded-pill px-4 py-3 text-primary"
								href="/board/${page}/update?board_num=${inquiryDetail.board_num}">Update</a>
							<a class="btn border-secondary rounded-pill px-4 py-3 text-primary"
								href="/board/${page}/delete?board_num=${inquiryDetail.board_num}&member_id=${inquiryDetail.member_nickname}">Delete</a>
						</div>
					</c:if>

					<!-- 댓글 목록-->
					<div id="commentList" class="container my-5">
						<c:if test="${inquiryDetail.board_type eq 2}">
							<div class="mb-4">
								<hr>
								<h2 class="text-primary">댓글 목록</h2>
							</div>

							<div class="mb-4">
								<span id="alBtn" data-alBtn="${memberJ.member_id}" class="d-flex align-items-center">
									<input type="text" id="replyInput"
										class="form-control border-2 border-secondary rounded-pill py-2 px-3 " style="width: 1100px;"
										placeholder="댓글을 입력하세요">
									<button id="qnaReplyBtn"
										class="btn btn-primary border-2 border-secondary rounded-pill text-white ml-3 px-4 py-2">댓글
										달기</button>
								</span>
							</div>

							<c:forEach items="${inquiryDTOList}" var="list">
								<div id="${list.board_num}" class="mb-4 p-3 border rounded bg-light">
									<div class="d-flex justify-content-between align-items-center">
										<div class="d-flex align-items-center">
											<strong class="text-secondary mr-3">닉네임: ${list.member_nickname}</strong>
											<strong class="text-secondary mx-3" style="border-left: 1px solid #ccc; padding-left: 10px;">작성일:
												${list.create_date}</strong>
											<c:if test="${not empty list.update_date}">
												<strong class="text-secondary mx-3"
													style="border-left: 1px solid #ccc; padding-left: 10px;">수정일: ${list.update_date}</strong>
											</c:if>
										</div>
										<c:if test="${list.member_id eq member.member_id}">
											<div>
												<c:if test="${empty list.del}">
													<button id="replyUpdate${list.board_num}"
														class="btn btn-outline-primary rounded-pill px-3 py-1"
														data-replyBoardNum="${list.board_num}" style="text-align: right;">수정</button>
													<button id="replyDelete${list.board_num}"
														class="btn btn-outline-danger rounded-pill px-3 py-1 ml-2"
														data-replyBoardNum="${list.board_num}" style="text-align: right;">삭제</button>
												</c:if>
											</div>
										</c:if>
									</div>
									<div class="mt-3">
										<p class="mb-0">↳ ${list.board_content}</p>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

					<!-- <div id="commentList">
						<c:if test="${inquiryDetail.board_type eq 2}">
							<div class="container">
								<hr>
								<h1>댓글 목록</h1>

							</div>
							<span id="alBtn" data-alBtn="${member.member_id}">
								<input type="text" id="replyInput">
								<button id="qnaReplyBtn">댓글 달기</button>
							</span>
							<c:forEach items="${inquiryDTOList}" var="list">
								<table id="${list.board_num}">
									<thead>
										<tr>
											<th>닉네임 : ${list.member_nickname}</th>
											<th>작성일 : ${list.create_date}</th>
											<c:if test="${not empty list.update_date}">
												<th>수정일 : ${list.update_date}</th>
											</c:if>
											<c:if test="${list.member_id eq member.member_id}">
												<c:if test="${empty list.del}">
													<td><button id="replyUpdate${list.board_num}"
															data-replyBoardNum="${list.board_num}">수정</button></td>
													<td><button id="replyDelete${list.board_num}"
															data-replyBoardNum="${list.board_num}">삭제</button></td>
												</c:if>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<td> ↳ ${list.board_content}</td>
									</tbody>
								</table>
							</c:forEach>
						</c:if>
					</div> -->
				</div>
			</div>
			<!-- End -->
			<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
			<script src="/resources/js/jerry/QnaReply.js"></script>
		</body>

		</html>