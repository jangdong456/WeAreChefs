<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp" ></c:import>
	<style>
		.boxOne{
			width: 720px;
			height: 650px;
			background-color:white;
			border-radius: 10px;
			position: absolute;
			top:55%;
			left:50%;
			transform: translate(-50%,-50%);
		}
		.correctionBtn{
			position:absolute;
			right: 13.0%;
		}
		.deleteBtn{
			position:absolute;
			right: 2.8%;
		}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
	<c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
	<div class="container">
		<div class="page-inner">
	<!--@@@@@@@@@------------------------- 시작 ----------------------------------------------->
	        <div class="page-header">
	          <h3 class="fw-bold mb-3">회원 세부 정보</h3>
	          <ul class="breadcrumbs mb-3">
	            <li class="nav-home">
	              <a href="/manager/index">
	                <i class="icon-home"></i>
	              </a>
	            </li>
	            <li class="separator">
	              <i class="icon-arrow-right"></i>
	            </li>
	            <li class="nav-item">
	              <a href="/manager/memberInfo">회원</a>
	            </li>
	            <li class="separator">
	              <i class="icon-arrow-right"></i>
	            </li>
	            <li class="nav-item">
	              <a href="#">회원 세부 정보</a>
	            </li>
	          </ul>
	        </div>
					<div class="container boxOne" id="divDetail" style="margin: 0;">
						<div class="form-group" style="width: 700px;">
							<h1>아이디</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberId"
								value="${memberDetail.member_id}"
								disabled
							/>
							<h1>닉네임</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberNickname"
								value="${memberDetail.member_nickname}"
								disabled
							/>
							<h1>이름</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberName"
								value="${memberDetail.member_name}"
								disabled
							/>
							<h1>메일</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberMail"
								value="${memberDetail.member_mail}"
								disabled
							/>
							<h1>연락처</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberPhone"
								value="${memberDetail.member_phone}"
								disabled
							/>
							<h1>권한 등급</h1>
							<input
								type="text"
								class="form-control form-control-lg"
								id="inputMemberLev"
								value="${memberDetail.member_lev}"
								disabled
							/>
						</div>
						<button
							type="button"
							class="btn btn-success correctionBtn"
							id="alert_demo_7"
						>
							수정
						</button>
						<button
						type="button"
						class="btn btn-danger deleteBtn"
						id="alert_demo_8"
						>
							삭제
						</button>
					</div>


	<!--@@@@@@@@@-------------------------- 끝 ----------------------------------------------->
		</div>
	</div>
	<!-- index 밑에 있어야 한느 것들임..-->
	<c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Sweet Alert -->
	<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
	<!-- Kaiadmin JS -->
	<script src="/resources/assets/js/kaiadmin.min.js"></script>
	<!-- Kaiadmin DEMO methods -->
	<script src="/resources/assets/js/setting-demo2.js"></script>
	<script src="/resources/js/jerry/memberDetailUpdate.js"></script>

</body>
</html>
