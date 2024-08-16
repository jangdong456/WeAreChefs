<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  table, td, th {
    border: 1px solid black;
  }
  
	<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp" ></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
	<c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
	<div class="container">
		<div class="page-inner">
	<!--@@@@@@@@@------------------------- 시작 ----------------------------------------------->
            <div class="page-header">
              <h3 class="fw-bold mb-3">회원 정보</h3>
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
                  <a href="#">회원</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">회원 정보</a>
                </li>
              </ul>
            </div>
            <!-- 테이블 시작 -->
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title"></h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                            <th>아이디</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>레벨</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${memberListDesc}" var="memberListDesc">
                            <tr id="memberDetailTr" data-memberId="${memberListDesc.member_id}" style="cursor:pointer;">
                              <td>${memberListDesc.member_id}</td>
                              <td>${memberListDesc.member_mail}</td>
                              <td>${memberListDesc.member_phone}</td>
                              <td>${memberListDesc.member_name}</td>
                              <td>${memberListDesc.member_nickname}</td>
                              <td>${memberListDesc.member_lev}</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 테이블 끝 -->
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
