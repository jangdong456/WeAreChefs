<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <textarea class="form-control areaContext" cols="30" rows="8" id="adminReplyArea"
            data-reply-num="${dto.food_reply_num}"></textarea>
        <div class="button-container justify-content-end" align="right">
            <p class="updateReply mt-3 adminComplete" data-reply-num="${dto.food_reply_num}"
                data-admin-num="${dto.food_num}" id="adminComplete">답글달기</p>
        </div>