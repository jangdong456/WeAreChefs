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
				<h3 class="fw-bold mb-3">주문 목록</h3>
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
						<a href="#">주문 목록</a>
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
			<div class="card-body">
				<div class="table-responsive">
					<table
						id="add-row"
						class="display table table-striped table-hover"
					>
						<thead>
							<tr>
								<th style="width: 30%">주문 번호</th>
								<th style="width: 20%">주문자 ID</th>
								<th> 결제 금액</th>
								<th> 주문 상태</th>
								<th style="width: 8%">결체 취소 승인</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh1</td>
								<td>Edinburgh222</td>
								<td>
									<div class="form-button-action">
										<button
											type="button"
											data-bs-toggle="tooltip"
											title="결제 취소 승인"
											class="btn btn-link btn-primary btn-lg"
											data-original-title="Edit Task"
										>
											<i class="fas fa-check"></i>
										</button>
										<button
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
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">Multi Filter Select</h4>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table
						id="multi-filter-select"
						class="display table table-striped table-hover"
					>
						<thead>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>2011/04/25</td>
								<td>$320,800</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!--@@@@@@@@@-------------------------- 끝 ----------------------------------------------->
		</div>
	</div>
	<!-- index 밑에 있어야 한느 것들임..-->
	<c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
  <!-- Detail 이동 -->
  <script src="/resources/js/jerry/memberDetail.js"></script>
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

      let action =
        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      $("#addRowButton").click(function () {
        $("#add-row")
          .dataTable()
          .fnAddData([
            $("#addName").val(),
            $("#addPosition").val(),
            $("#addOffice").val(),
            action,
          ]);
        $("#addRowModal").modal("hide");
      });
    });
  </script>

</body>
</html>
