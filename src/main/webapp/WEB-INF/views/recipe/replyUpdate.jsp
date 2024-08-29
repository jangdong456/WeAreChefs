<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-group mb-3">
    <textarea class="form-control replyUpdateTextarea" cols="30" rows="8" name="board_content" style="width:650px; height: 70px;"
    id="updateContent2" data-reply-num="${dto.recipe_reply_num}">${dto.board_content}</textarea>

    <button type="button" class="btn btn-outline-secondary updateReply" data-reply-num="${dto.recipe_reply_num}" id="newUpdate2" data-num-mId="${dto.member_id}">완료</button>
</div>