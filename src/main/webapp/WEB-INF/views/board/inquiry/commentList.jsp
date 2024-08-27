<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="mb-4">
        <hr>
        <h2 class="text-primary">댓글 목록</h2>
    </div>

    <div class="mb-4">
        <span id="alBtn" data-alBtn="${member.member_id}" class="d-flex align-items-center">
            <input type="text" id="replyInput"
                class="form-control border-2 border-secondary rounded-pill py-2 px-3 "  style="width: 1100px;" placeholder="댓글을 입력하세요">
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
                                data-replyBoardNum="${list.board_num}">수정</button>
                            <button id="replyDelete${list.board_num}"
                                class="btn btn-outline-danger rounded-pill px-3 py-1 ml-2"
                                data-replyBoardNum="${list.board_num}">삭제</button>
                        </c:if>
                    </div>
                </c:if>
            </div>
            <div class="mt-3">
                <p class="mb-0">↳ ${list.board_content}</p>
            </div>
        </div>
    </c:forEach>
