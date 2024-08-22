<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <c:forEach items="${noticeList}" var="ar">
    <tr class="centerTr">
      <th>${ar.board_num}</th>
      <th>${ar.member_nickname}</th>
      <th><a id="noticeListAtag${ar.board_num}" data-noticeHit="${ar.board_num}" href="/board/notice/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
      <th>${ar.create_date}</th>
      <th>${ar.update_date}</th>
      <th>${ar.hit}</th>
    </tr>
  </c:forEach>