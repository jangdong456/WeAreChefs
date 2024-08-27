<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <strong class="text-secondary mr-3">닉네임: ${getReplyUpdate.member_nickname}</strong>
                <strong class="text-secondary mx-3" style="border-left: 1px solid #ccc; padding-left: 10px;">작성일:
                    ${getReplyUpdate.create_date}</strong>
                <c:if test="${not empty getReplyUpdate.update_date}">
                    <strong class="text-secondary mx-3" style="border-left: 1px solid #ccc; padding-left: 10px;">수정일:
                        ${getReplyUpdate.update_date}</strong>
                </c:if>
            </div>
            <div>
                <button id="replyUpdateSubmit${getReplyUpdate.board_num}"
                    class="btn btn-outline-primary rounded-pill px-3 py-1"
                    data-replyBoardNum="${getReplyUpdate.board_num}">완료</button>
                <button id="replyUpdateCancel${getReplyUpdate.board_num}"
                    class="btn btn-outline-danger rounded-pill px-3 py-1 ml-2"
                    data-replyBoardNum="${getReplyUpdate.board_num}">취소</button>
            </div>
        </div>
        <div class="mt-3">
            <input type="text" id="replyUpdateInput${getReplyUpdate.board_num}"
                class="form-control border-2 border-secondary rounded-pill py-2 px-3 w-100"
                value="${getReplyUpdate.board_content}">
        </div>

        <!-- <thead>
    <tr>
        <th >닉네임 : ${getReplyUpdate.member_nickname}</th>
        <th>작성일 : ${getReplyUpdate.create_date}</th>
        <c:if test="${not empty getReplyUpdate.update_date}">
            <th>수정일 : ${getReplyUpdate.update_date}</th>    
        </c:if>
        <td><button id="replyUpdateSubmit${getReplyUpdate.board_num}" data-replyBoardNum="${getReplyUpdate.board_num}">등록</button></td>
        <td><button id="replyUpdateCancel${getReplyUpdate.board_num}" data-replyBoardNum="${getReplyUpdate.board_num}">취소</button></td>
    </tr>
</thead>
<tbody>
    <td><input type="text" id="replyUpdateInput${getReplyUpdate.board_num}" value="${getReplyUpdate.board_content}"></td>
</tbody> -->