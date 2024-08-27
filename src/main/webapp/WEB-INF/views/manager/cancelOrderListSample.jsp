<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${cancelOrderList}" var="list">
  <tr style="cursor:pointer;">
    <td>${list.order_date}</td>
    <td>${list.order_num}</td>
    <td>${list.member_id}</td>
    <td>${list.order_price}</td>
    <td>${list.order_status}</td>
    <td>
      <div class="form-button-action">
        <button
          id="cancelOk${list.order_num}"
          data-cancel="${list.order_num}"
          type="button"
          data-bs-toggle="tooltip"
          title="결제 취소 승인"
          class="btn btn-link btn-primary btn-lg"
          data-original-title="Edit Task"
        >
          <i class="fas fa-check"></i>
        </button>
        <button
        id="cancelNo${list.order_num}"
        data-cancel="${list.order_num}"
          type="button"
          data-bs-toggle="tooltip"
          title="결제 취소 거절"
          class="btn btn-link btn-danger"
          data-original-title="Remove"
        >
          <i class="fa fa-times"></i>
        </button>
      </div>
    </td>
  </tr>
</c:forEach>