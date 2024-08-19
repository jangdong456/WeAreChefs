<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
	<style>
		.form-container {
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
		
		.form-wrapper {
			width: 100%;
			max-width: 600px;
			margin: 0 auto;
		}
		
		.form-item {
			margin-bottom: 15px;
		}
		
		.form-control {
				width: 100%;
		}

		#join_span {
			color: red;
		}

	</style>
</head>
<body>
    <c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
	
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">로그인</h1>
	</div>
	
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="form-container">
				<div class="form-wrapper">
					<form action="#" method="post">
						<div class="row g-5">
							<div class="col-12 ">
								<div class="row">
									
								<div class="form-item">
									<label class="form-label my-3">아이디<sup>*</sup></label> 
									<input type="text" class="form-control member_join" id="member_id" name="member_id">
								</div>
								<div class="form-item">
									<label class="form-label my-3">비밀번호<sup>*</sup></label>
									<input type="text" class="form-control member_join" id="member_pwd" name="member_pwd">
								</div>

								<div class="row g-4 text-center align-items-center justify-content-center pt-4">
									<button id="login_btn" type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">로그인</button>
								</div>

								<div class="row g-4 text-center align-items-center justify-content-center pt-4">
									<img src="/resources/member/img/kakao_login_medium_narrow.png" id="img">
								</div>

								<div class="form-item">
									<a href="join">회원가입</a>
								</div>
							</div>
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div> 
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script src="/resources/member/js/getcode.js"></script>
</body>
</html>
<!-- placeholder="House Number Street Name" -->