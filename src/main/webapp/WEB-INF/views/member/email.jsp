<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <div class="form-group email-form">
        <label for="email">이메일</label>
        <div class="input-group">
            <input type="text" class="form-control" id="test" name="userEmail1" placeholder="이메일" >
            <select class="form-control" id="userEmail2" name="userEmail2"  >
                <option>@gmail.com</option>
                <option>@naver.com</option>
            </select>
        </div>
    
    <div class="input-group-addon">
       <button type="button" class="btn btn-primary" id="mailBtn">본인인증</button>
    </div>
       <div class="mail-check-box">
    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
    </div>
       <span id="mail-check-warn"></span>
    </div>
    <script src="/resources/member/js/email.js"></script>
</body>
</html>
