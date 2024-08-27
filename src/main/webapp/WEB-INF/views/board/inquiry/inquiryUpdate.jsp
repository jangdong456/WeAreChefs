<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${inquiryList}" var="ar">
  <tr class="centerTr">
    <th>${ar.board_num}</th>
    <th>${ar.member_nickname}</th>
    <th><a id="inquiryAtag${ar.board_num}" data-inquiryHit="${ar.board_num}" href="/board/${page}/detail?board_num=${ar.board_num}">${ar.board_title}</a></th>
    <th>${ar.create_date}</th>
    <th>${ar.update_date}</th>
    <th>${ar.hit}</th>
  </tr>
</c:forEach>