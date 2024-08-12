<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="container">
    <hr>
    <h1>댓글 목록</h1>

</div>
<input type="text" id="replyInput">
<button id="qnaReplyBtn">댓글 달기</button>
    <c:forEach items="${inquiryDTOList}" var="list">
        <table id="${list.board_num}">
            <thead>
                <tr >
                    <th>작성자 : ${list.member_id}</th>
                    <th>작성일 : ${list.create_date}</th>
                    <td><button id="replyUpdate${list.board_num}" data-replyBoardNum="${list.board_num}">수정</button></td>
                    <td><button id="replyDelete${list.board_num}" data-replyBoardNum="${list.board_num}">삭제</button></td>
                    <!-- <c:if test="${list.member_id} eq ${member.member_id}"> -->
                    <!-- </c:if> -->
                </tr>
            </thead>
            <tbody>
                <td>  ↳ ${list.board_content}</td>
            </tbody>
        </table>
    </c:forEach>
