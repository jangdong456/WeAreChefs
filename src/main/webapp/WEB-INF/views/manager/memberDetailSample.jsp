<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
  <c:when test="${memberDetail.member_type eq '일반회원'}"> <div class="Constainer boxOne" style="margin: 0;"></c:when>
  <c:otherwise><div class="Constainer boxTwo" style="margin: 0;"></c:otherwise>
</c:choose>
  <div class="form-group" style="width: 700px;">
    <h1>아이디</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberId"
      value="${memberDetail.member_id}"
      required
      disabled
    />
    <h1>비밀번호</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberPw"
      value="${memberDetail.member_pwd}"
      required
      disabled
    />
    <h1>닉네임</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberNickname"
      value="${memberDetail.member_nickname}"
      required
      disabled
    />
    <h1>이름</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberName"
      value="${memberDetail.member_name}"
      required
      disabled
    />
    <h1>메일</h1>
    <input
      type="email"
      class="form-control form-control-lg"
      id="inputMemberMail"
      value="${memberDetail.member_mail}"
      required
      disabled
    />
    <h1>연락처</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberPhone"
      value="${memberDetail.member_phone}"
      required
      disabled
    />
    <h1>권한 등급</h1>
    <input
      type="text"
      class="form-control form-control-lg"
      id="inputMemberLev"
      value="${memberDetail.member_lev}"
      required
      disabled
    />
  </div>
  <button
    type="button"
    class="btn btn-success correctionBtn"
    id="updateBtn"
  >
    수정
  </button>
  <button
  type="button"
  class="btn btn-danger deleteBtn"
  id="deleteBtn"
  >
    삭제
  </button>
</div>