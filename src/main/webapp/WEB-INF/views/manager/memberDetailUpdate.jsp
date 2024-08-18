<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="form-group" style="width: 700px;">
	<h1>아이디</h1>
	<input
		type="text"
		class="form-control form-control-lg"
		id="inputMemberId"
		value="${memberDetail.member_id}"
	/>
	<h1>닉네임</h1>
	<input
		type="text"
		class="form-control form-control-lg"
		id="inputMemberNickname"
		value="${memberDetail.member_nickname}"
	/>
	<h1>이름</h1>
	<input
		type="text"
		class="form-control form-control-lg"
		id="inputMemberName"
		value="${memberDetail.member_name}"
	/>
	<h1>메일</h1>
	<input
		type="text"
		class="form-control form-control-lg"
		id="inputMemberMail"
		value="${memberDetail.member_mail}"
	/>
	<h1>연락처</h1>
	<input
		type="text"
		class="form-control form-control-lg"
		id="inputMemberPhone"
		value="${memberDetail.member_phone}"
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