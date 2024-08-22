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

	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">회원가입</h1>
	</div>
	
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="form-container">
				<div class="form-wrapper">
					<form action="join" method="post" id="joinForm">
						<div class="row g-5">
							<div class="col-12 ">
								<div class="row">
									<div class="col-md-12 col-lg-6">
										<div class="form-item w-100 " id="name_span">
											<label class="form-label my-3">이름<sup>*</sup></label>
											<input type="text" class="form-control member_join" id="member_name" name="member_name">
										</div>					
									</div>
								</div>
								
								<div class="form-item" id="nick_name_span">
									<label class="form-label my-3">닉네임<sup>*</sup></label>
									<input type="text" class="form-control member_join" id="member_nickname" name="member_nickname" maxlength="10">
									<button id="nickNameCheck" type="button" class="btn border-secondary py-2 px-4 text-uppercase w-80 text-primary">중복확인</button>
								</div>

								<div class="form-item">
									<label class="form-label my-3">아이디<sup>*</sup></label> 
									<input type="text" class="form-control member_join" id="member_id" name="member_id" maxlength="12">
									<button id="idCheck" type="button" class="btn border-secondary py-2 px-4 text-uppercase w-80 text-primary">중복확인</button>
								</div>
								<div class="form-item">
									<label class="form-label my-3">비밀번호<sup>*</sup></label>
									<input type="password" class="form-control member_join" id="member_pwd" name="member_pwd" maxlength="12">
								</div>
								<div class="form-item">
									<label class="form-label my-3">비밀번호확인<sup>*</sup></label>
									<input type="text" class="form-control member_join" id="pwdCheck" maxlength="12">
								</div>
								<div class="form-item">
									<label class="form-label my-3">이메일<sup>*</sup></label>
									<input type="text" class="form-control member_join" id="membere_mail" name="membere_mail">
								</div>
								<button id="emailNumCheck" type="button" class="btn border-secondary py-2 px-4 text-uppercase w-80 text-primary">이메일 인증하기</button>

								<div class="form-item">
									<label class="form-label my-3">전화번호<sup>*</sup></label>
									<input type="text" class="form-control member_join" id="member_phone" name="member_phone" maxlength="13">
									<button id="phoneCheck" type="button" class="btn border-secondary py-2 px-4 text-uppercase w-80 text-primary">중복확인</button>
								</div>

								<input type="hidden" class="form-control member_join" id="member_lev" name="member_lev" value="0">

								<div class="row g-4 text-center align-items-center justify-content-center pt-4">
									<button id="join_btn" type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">회원가입</button>
								</div>
							</div>
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div> 
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script src="/resources/member/js/join.js"></script>
<script src="/resources/member/js/email.js"></script>
</body>
</html>
<!-- placeholder="House Number Street Name" -->