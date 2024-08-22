<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${memberDetail.member_type eq '일반회원'}"> <div class="Constainer boxOne" style="margin: 0;"></c:when>
	<c:otherwise><div class="Constainer boxTwo" style="margin: 0;"></c:otherwise>
</c:choose>

	<div class="form-group" style="width: 700px;">
		<h1>아이디 <span class="foreHtag" id="confirmMemberId"></span></h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputMemberId"
			value="${memberDetail.member_id}"
			disabled
		/>
		<h1>비밀번호 <span class="foreHtag" id="confirmMemberPw"></span></h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputMemberPwd"
			value="${memberDetail.member_pwd}"
			required
		/>	
		<h1>닉네임 <span class="foreHtag" id="confirmMemberNickname"></span></h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputMemberNickname"
			value="${memberDetail.member_nickname}"
			required
		/>
		<h1>이름 <span class="foreHtag" id="confirmMemberName"></span></h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputMemberName"
			value="${memberDetail.member_name}"
			required
		/>
		<h1>메일 <span class="foreHtag" id="confirmMemberMail"></span></h1>
		<input
			type="email"
			class="form-control form-control-lg"
			id="inputMemberMail"
			value="${memberDetail.member_mail}"
			required
		/>
		<h1>연락처 <span class="foreHtag" id="confirmMemberPhone"></span></h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputMemberPhone"
			value="${memberDetail.member_phone}"
			required
		/>
		<h1>권한 등급</h1>
		<select
			class="form-select"
			id="inputMemberLev"
			required
		>
			<c:choose>
				<c:when test="${memberDetail.member_lev eq 0}">
					<option selected>0</option>
					<option>1</option>
					<option>2</option>
				</c:when>
				<c:when test="${memberDetail.member_lev eq 1}">
					<option>0</option>
					<option selected>1</option>
					<option>2</option>
				</c:when>
				<c:when test="${memberDetail.member_lev eq 2}">
					<option>0</option>
					<option>1</option>
					<option selected>2</option>
				</c:when>
			</c:choose>
		</select>
	</div>
	<button
		type="button"
		class="btn btn-success correctionBtn"
		id="completeBtn"
	>
		완료
	</button>
	<button
		type="button"
		class="btn btn-danger deleteBtn"
		id="cancelBtn"
	>
		취소
	</button>
</div>