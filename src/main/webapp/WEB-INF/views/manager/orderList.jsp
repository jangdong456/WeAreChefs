<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp" ></c:import>
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
						<a href="#">주문</a>
					</li>
					<li class="separator">
						<i class="icon-arrow-right"></i>
					</li>
					<li class="nav-item">
						<a href="#">주문&배송 목록</a>
					</li>
				</ul>
			</div>
	<!--@@@@@@@@@------------------------- 시작 ---------------------------------------------->
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<h4 class="card-title">결제 취소 요청 목록</h4>
				</div>
			</div>
			<div  class="card-body">
				<div class="table-responsive">
					<table
						id="add-row"
						class="display table table-striped table-hover"
					>
						<thead>
							<tr>
								<th> 결제 날짜</th>
								<th style="width: 20%">주문 번호</th>
								<th style="width: 10%">주문자 ID</th>
								<th> 결제 금액</th>
								<th> 주문 상태</th>
								<th style="width: 8%">결체 취소 승인</th>
							</tr>
						</thead>
						<tbody id="cancelList">
							<c:forEach items="${cancelOrderList}" var="list">
								<tr>
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
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">주문&배송 목록</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table
							id="basic-datatables"
							class="display table table-striped table-hover"
						>
							<thead>
								<tr>
									<th> 결제 날짜</th>
									<th style="width: 20%">주문 번호</th>
									<th style="width: 10">주문자 ID</th>
									<th> 결제 금액</th>
									<th> 주문 상태</th>
									<th> 배송 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderList}" var="list">
									<tr onclick="location.href='/manager/orderDetail?order_num=${list.order_num}'">
										<td>${list.order_date}</td>
										<td>${list.order_num}</td>
										<td>${list.member_id}</td>
										<td>${list.order_price}</td>
										<td>${list.order_status}</td>
										<td>${list.delivery_status}</td>
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
  <!-- orderList Js -->
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

</body>
</html>
