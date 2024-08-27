<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="Constainer boxOne">
	<div class="form-group" style="width: 700px;">
		<h1>주문 번호</h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputOrderNum"
			value="${orderDetail.order_num}"
			required
			disabled
		/>
		<h1>주문 날짜</h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputOrderDate"
			value="${orderDetail.order_date}"
			required
			disabled
		/>
		<h1>아이디</h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputOrderMemberId"
			value="${orderDetail.member_id}"
			required
			disabled
		/>
		<hr>
		<h1>주문상태</h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputOrderPrice"
			value="${orderDetail.order_status}"
			required
			disabled
		/>
		<h1>주문 상세 정보</h1>
		<div class="container beforeOrderDetailInfo">
			<c:choose>
				<c:when test="${foodSize eq 0}">
					<h3>주문 정보가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th>종류</th>
								<th>이름</th>
								<th>개당 가격</th>
								<th>구매 개수</th>
								<th>가격 합</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach items="${orderFoodDetail}" var="foodList">
									<tr>
										<td>${foodList.food_num}</td>
										<td>${foodList.food_category}</td>
										<td>${foodList.food_name}</td>
										<td>${foodList.food_price}</td>
										<td>${foodList.food_count}</td>
										<td style="font-weight: bolder;">${foodList.total_price}</td>
									</tr>
								</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" >
									<h3 class="orderDetailH3">총 결제 가격 : ${orderDetail.order_price} 원</h3>
								</td>
							</tr>
						</tfoot>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>
		<h1>배송상태</h1>
		<input
			type="text"
			class="form-control form-control-lg"
			id="inputDeliveryStatus"
			value="${orderDetail.delivery_status}"
			required
			disabled
		/>
		<h1>배송 상세 정보</h1>
		<div class="container beforeDeliveryDetailInfo">
			<table class="table table-bordered">
					<tr>
						<th width="20%">이름</th>
						<td>${orderDetail.order_name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${orderDetail.order_phone}</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${orderDetail.order_post}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${orderDetail.delivery_address}</td>
					</tr>
			</table>
		</div>
		<hr>
		<div class="orderDetailBtn">
			<button
			type="button"
			class="btn btn-success correctionBtn"
			id="orderDetailUpdate"
			data-orderNum="${orderDetail.order_num}"
			>
			수정
			</button>
			<button
			type="button"
			class="btn btn-danger deleteBtn"
			id="orderDetailDelete"
			data-orderNum="${orderDetail.order_num}"
			>
			삭제
			</button>
		</div>
	</div>
</div>

