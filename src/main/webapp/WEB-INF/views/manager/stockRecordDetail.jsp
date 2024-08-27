<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp"></c:import>
			<style>
				.boxOne {
					width: 700px;
					background-color: white;
					border-radius: 10px;
					margin: 50px auto;
					/* 자동으로 수평 중앙 정렬 및 상단에 50px 여백 추가 */
					position: relative;
					/* 상대적 위치로 설정 */
				}

				.beforeOrderDetailInfo {
					width: 675px;
					background-color: #F5F5F5;
				}

				.beforeDeliveryDetailInfo {
					width: 675px;
					background-color: #F5F5F5;
				}

				.orderDetailH3 {
					height: 26px;
					text-align: right;
					font-weight: bolder;
				}

				.orderDetailBtn {
					text-align: right;
				}

				.correctionBtn {
					position: relative;
				}

				.deleteBtn {
					position: relative;
				}

				.deliveryTh {
					width: 60px;
				}

				.inputDeliveryInfo {
					height: 20px;
					width: 470px;
				}
				.stockDetailText{
					text-align: center;
				}
			</style>
		</head>

		<body>
			<c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
			<c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
			<div class="container">
				<div class="page-inner">
					<div class="page-header">
						<h3 class="fw-bold mb-3">주문&배송 목록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home">
								<a href="/manager/index">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="/manager/orderList">주문</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">주문&배송 세부사항</a>
							</li>
						</ul>
					</div>
					<!--@@@@@@@@@------------------------- 시작 ----------------------------------------------->
					<div id="orderDetail">
						<div class="Constainer boxOne">
							<div class="form-group" style="width: 700px;">
								<h1>구매 번호</h1>
								<input type="text" class="form-control form-control-lg" id="inputOrderNum"
									value="${stockBuyingDetailBig.buying_num}" required disabled />
								<h1>구매 날짜</h1>
								<input type="text" class="form-control form-control-lg" id="inputOrderDate"
									value="${stockBuyingDetailBig.buying_date}" required disabled />
								<hr>
								<h1>구매 상세 정보</h1>
								<div class="container beforeOrderDetailInfo">
									<table class="table table-bordered">
										<thead>
											<tr class="stockDetailText">
												<th>재료번호</th>
												<th>종류</th>
												<th>이름</th>
												<th>가격(개)</th>
												<th>개수</th>
												<th>합</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${stockBuyingDetailSmall}" var="list">
												<tr class="stockDetailText">
													<td>${list.food_num}</td>
													<td>${list.food_category}</td>
													<td>${list.food_name}</td>
													<td>${list.food_one_price}</td>
													<td>${list.food_count}</td>
													<td style="font-weight: bolder;">${list.food_price}</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="6">
													<h3 class="orderDetailH3">총 구매 가격 : ${stockBuyingDetailBig.buying_total_price} 원</h3>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
								<hr>
							</div>
						</div>
					</div>


					<!--@@@@@@@@@-------------------------- 끝 ----------------------------------------------->
				</div>
			</div>
			<!-- index 밑에 있어야 한느 것들임..-->
			<c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
			<!-- Sweet Alert -->
			<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
			<!-- Datatables -->
			<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
			<!--orderDetail-->
			<script src="/resources/js/jerry/orderDetail.js"></script>



		</body>

		</html>