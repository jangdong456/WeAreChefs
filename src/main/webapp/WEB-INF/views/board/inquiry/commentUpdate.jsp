<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<thead>
    <tr>
        <th >작성자 : ${getReplyUpdate.member_id}</th>
        <th>작성일 : ${getReplyUpdate.create_date}</th>
        <td><button id="replyUpdateSubmit${getReplyUpdate.board_num}" data-replyBoardNum="${getReplyUpdate.board_num}">등록</button></td>
        <td><button id="replyUpdateCancel${getReplyUpdate.board_num}" data-replyBoardNum="${getReplyUpdate.board_num}">취소</button></td>
    </tr>
</thead>
<tbody>
    <td><input type="text" id="replyUpdateInput${getReplyUpdate.board_num}" value="${getReplyUpdate.board_content}"></td>
</tbody>
