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
	<!--@------------------------------------------------------------------ Start Main -------------------------------------------------------------------------------->
	<div class="container">
		<div class="page-inner">
			
			<!--@------------------------------------------------------------- Start 첫줄 -------------------------------------------------------------->
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="card card-stats card-round">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-icon">
									<div
										class="icon-big text-center icon-primary bubble-shadow-small"
									>
										<i class="fas fa-users"></i>
									</div>
								</div>
								<div class="col col-stats ms-3 ms-sm-0">
									<div class="numbers">
										<p class="card-category">총 회원 수</p>
										<h4 class="card-title">${indexFirstRowInfo[0]} 명</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="card card-stats card-round">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-icon">
									<div
										class="icon-big text-center icon-info bubble-shadow-small"
									>
										<i class="fas fa-user-check"></i>
									</div>
								</div>
								<div class="col col-stats ms-3 ms-sm-0">
									<div class="numbers">
										<p class="card-category">금일 결제 완료</p>
										<h4 class="card-title">${indexFirstRowInfo[1]} 건</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="card card-stats card-round">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-icon">
									<div
										class="icon-big text-center icon-success bubble-shadow-small"
									>
										<i class="fas fa-luggage-cart"></i>
									</div>
								</div>
								<div class="col col-stats ms-3 ms-sm-0">
									<div class="numbers">
										<p class="card-category">금일 배송중</p>
										<h4 class="card-title">${indexFirstRowInfo[2]} 건</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="card card-stats card-round">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-icon">
									<div
										class="icon-big text-center icon-secondary bubble-shadow-small"
									>
										<i class="fas fa-exclamation"></i>
									</div>
								</div>
								<div class="col col-stats ms-3 ms-sm-0">
									<div class="numbers">
										<p class="card-category">재고 부족 품목</p>
										<h4 class="card-title">${indexFirstRowInfo[3]} 개</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--------------------------------------------------------------- End 첫줄 -------------------------------------------------------------->


			<!--@-------------------------------------------------------------- Start 두번째 줄 -------------------------------------------------------------->
			<c:forEach var="list" items="${monthTotalPurchase}" >
				<c:set var="i" value="${i+1}"/>
				<input type="hidden" id="${list.pur_month}" value="${list.pur_count}">
			</c:forEach>
			<div class="row">
				<!-- 메인 차트 -->
				<div class="col-md-8">
					<div class="card card-round">
						<div class="card-header">
							<div class="card-head-row">
								<div class="card-title">연간 가계 차트</div>
							</div>
						</div>
						<div class="card-body">
							<div class="chart-container" style="min-height: 375px">
								<canvas id="statisticsChart"></canvas>
							</div>
							<div id="myChartLegend"></div>
						</div>
					</div>
				</div>
				<!-- 우측 상단 일간 차트-->
				<div class="col-md-4">
					<div class="card card-primary card-round">
						<div class="card-header">
							<div class="card-head-row">
								<div class="card-title">주간 매출액</div>
								<div class="card-tools">&*4주간총매출액
								</div>
							</div>
							<!--&* 주간 날짜 넣어줘야함-->
							<div class="card-category">&*최근 한달날짜</div>
						</div>
						<div class="card-body pb-0">
							<div class="mb-4 mt-4">
								<!-- &* 주간 매출 넣어줘야함-->
								<h1>&nbsp;</h1>
							</div>
							<div class="pull-in">
								<canvas id="dailySalesChart"></canvas>
							</div>
						</div>
					</div>
					<div class="card card-round">
						<div class="card-body pb-0">
							<div class="h1 fw-bold float-end text-primary">&*일간총매출액</div>
							<h2 class="mb-1">일간 매출액</h2>
							<div class="pull-in sparkline-fix">
								<div id="lineChart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- --------------------------------------------------End 두번째 줄 ----------------------------------->
			<!--@--------------------------------------------------Start 하단 3번쨰 목록-------------------------------------------------------->
			<div class="row">

				<!--@--------------------------------------------------Start 신규 유저 목록-------------------------------------------------------->
				<div class="col-md-4">
					<div class="card card-round">
						<div class="card-body">
							<div class="card-head-row card-tools-still-right">
								<div class="card-title">신규 유저 목록</div>

							</div>

							<div class="card-list py-4">
							 	<!--@ Start 프로필 1세트 -->
							 	<c:forEach items="${memberListDesc}" var="memberListDesc" begin="0" end="7" step="1">
									<div class="item-list">
										<div class="avatar">
											<img
												src="/resources/img/avatar.jpg"
												alt="..."
												class="avatar-img rounded-circle"
											/>
										</div>
										<div class="info-user ms-3">
											<div class="username">${memberListDesc.member_id}</div>
											<div class="status">${memberListDesc.member_nickname}</div>
										</div>
										<button class="btn btn-icon btn-link op-8 me-1">
											<i class="far fa-envelope"></i>
										</button>
										<button class="btn btn-icon btn-link btn-danger op-8">
											<i class="fas fa-ban"></i>
										</button>
									</div>
								</c:forEach>
								<!--@ End 프로필 1세트 -->
							</div>
						</div>
					</div>
				</div>
				<!----------------------------------------------------End 신규 유저 목록-------------------------------------------------------->

				<!--@--------------------------------------------------Start 신규 주문 목록-------------------------------------------------------->
				<div class="col-md-8">
					<div class="card card-round">
						<div class="card-header">
							<div class="card-head-row card-tools-still-right">
								<div class="card-title">최신 주문 정보</div>
							</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<!-- Projects table -->
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">주문 번호</th>
											<th scope="col" class="text-end">주문자 아이디</th>
											<th scope="col" class="text-end">주문 날짜</th>
											<th scope="col" class="text-end">주문 금액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
										<tr>
											<th scope="row">
												<button
													class="btn btn-icon btn-round btn-success btn-sm me-2"
												>
													<i class="fa fa-check"></i>
												</button>
												&* 주문 번호
											</th>
											<td class="text-end">&*주문자 아이디</td>
											<td class="text-end">&*주문 날짜</td>
											<td class="text-end">&*주문 금액</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- index 밑에 있어야 한느 것들임..-->
	<c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
	<!-- Index Js-->
  <script src="/resources/js/jerry/memberindex.js"></script>
	
	<!-- Chart JS -->
	<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
	<script src="/resources/assets/js/plugin/jsvectormap/world.js"></script>

	<!-- Sweet Alert -->
	<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>


	

	<!-- js 파일들을 연결해주는 부분인듯 -->
	<script src="/resources/assets/js/setting-demo.js"></script>
	<!-- Index 중간에 보이는 메인 차트-->
	<script src="/resources/assets/js/demo.js"></script>
	<!-- Index 중간에 보이는 우측의 작은 차트-->
	<script>
		$("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
			type: "line",
			height: "70",
			width: "100%",
			lineWidth: "2",
			lineColor: "#177dff",
			fillColor: "rgba(23, 125, 255, 0.14)",
		});

		$("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
			type: "line",
			height: "70",
			width: "100%",
			lineWidth: "2",
			lineColor: "#f3545d",
			fillColor: "rgba(243, 84, 93, .14)",
		});

		$("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
			type: "line",
			height: "70",
			width: "100%",
			lineWidth: "2",
			lineColor: "#ffa534",
			fillColor: "rgba(255, 165, 52, .14)",
		});
	</script>
</body>
</html>
