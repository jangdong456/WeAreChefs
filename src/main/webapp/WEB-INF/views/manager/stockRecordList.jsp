<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp"></c:import>
		</head>

		<body>
			<c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
			<c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
			<div class="container">
				<div class="page-inner">
					<div class="page-header">
						<h3 class="fw-bold mb-3">재고 구매 기록</h3>
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
								<a href="#">재고</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">재고 구매 기록</a>
							</li>
						</ul>
					</div>
					<!--@@@@@@@@@------------------------- 시작 ---------------------------------------------->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">구매 목록</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables" class="display table table-striped table-hover">
											<thead>
												<tr>
													<th> 결제 날짜</th>
													<th style="width: 20%">주문 번호</th>
													<th> 결제 금액</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${stockRecordList}" var="list">
													<tr onclick="location.href='/manager/stockRecordDetail?buying_num=${list.buying_num}'"
														style="cursor:pointer;">
														<td>${list.buying_date}</td>
														<td>${list.buying_num}</td>
														<td>${list.buying_total_price}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
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
			<script src="/resources/js/jerry/orderList.js"></script>
			<!-- 검색 및 정렬 -->
			<script>
				$(document).ready(function () {
					$("#basic-datatables").DataTable({});

					$("#multi-filter-select").DataTable({
						pageLength: 5,
						initComplete: function () {
							this.api()
								.columns()
								.every(function () {
									let column = this;
									let select = $(
										'<select class="form-select"><option value=""></option></select>'
									)
										.appendTo($(column.footer()).empty())
										.on("change", function () {
											let val = $.fn.dataTable.util.escapeRegex($(this).val());

											column
												.search(val ? "^" + val + "$" : "", true, false)
												.draw();
										});

									column
										.data()
										.unique()
										.sort()
										.each(function (d, j) {
											select.append(
												'<option value="' + d + '">' + d + "</option>"
											);
										});
								});
						},
					});

					// Add Row
					$("#add-row").DataTable({
						pageLength: 5,
					});


				});
			</script>
			<div id="loadingSpinner"
				style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
				<img src="/resources/assets/img/catReloading.gif" alt="Loading...">
			</div>
		</body>

		</html>