<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp"></c:import>
			<style type="text/css">
				.MouseShadow:hover {
					box-shadow: 4px 4px 40px #ddd;
				}

				.MouseBlack:hover {
					background: #F5F5F5;
					border-radius: 10px;
				}

				.textCenter {
					text-align: center;
				}
			</style>
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
							<div class="MouseShadow card card-stats card-round" onClick="location.href='/manager/memberInfo'"
								style="cursor:pointer;">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-primary bubble-shadow-small">
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
							<div class="MouseShadow card card-stats card-round" onClick="location.href='/manager/orderList'"
								style="cursor:pointer;">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-info bubble-shadow-small">
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
							<div class="MouseShadow card card-stats card-round" onClick="location.href='/manager/orderList'"
								style="cursor:pointer;">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-success bubble-shadow-small">
												<i class="fas fa-times"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">결제 취소 요청</p>
												<h4 class="card-title">${indexFirstRowInfo[2]} 건</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="MouseShadow card card-stats card-round" onClick="location.href='/manager/stockList'"
								style="cursor:pointer;">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-secondary bubble-shadow-small">
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


					<!--@-------------------------------------------------------------- Start 두번째 줄(차트) -------------------------------------------------------------->
					<!-- 1년 매출 차트 정보-->
					<c:forEach items="${monthSales}" var="list" begin="0" end="11">
						<input type="hidden" class="purSales" value="${list.pur_price}">
					</c:forEach>
					<c:forEach items="${monthExpends}" var="list" begin="0" end="11">
						<input type="hidden" class="purExpends" value="${list.pur_price}">
					</c:forEach>
					<c:forEach items="${monthEarns}" var="list" begin="0" end="11">
						<input type="hidden" class="purEarns" value="${list.pur_price}">
					</c:forEach>

					<!--일별 회원가입-->
					<input type="hidden" class="dailyMember" value="${dailyMember.day_0}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_1}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_2}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_3}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_4}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_5}">
					<input type="hidden" class="dailyMember" value="${dailyMember.day_6}">

					<!--일별 매출-->
					<input type="hidden" class="dailySales" value="${dailySales.day_0}">
					<input type="hidden" class="dailySales" value="${dailySales.day_1}">
					<input type="hidden" class="dailySales" value="${dailySales.day_2}">
					<input type="hidden" class="dailySales" value="${dailySales.day_3}">
					<input type="hidden" class="dailySales" value="${dailySales.day_4}">
					<input type="hidden" class="dailySales" value="${dailySales.day_5}">
					<input type="hidden" class="dailySales" value="${dailySales.day_6}">

					<!--주간 매출 차트 정보-->
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
										<div class="card-title">주간 회원 가입</div>
										<div class="card-tools">
										</div>
									</div>
									<!--&* 주간 날짜 넣어줘야함-->
									<div class="card-category"></div>
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
									<div class="h1 fw-bold float-end text-primary"></div>
									<h2 class="mb-1">주간 매출</h2>
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
											<div class="MouseBlack item-list"
												onClick="location.href='/manager/memberDetail?member_id=${memberListDesc.member_id}'"
												style="cursor:pointer;">
												<div class="avatar">
													<img src="/resources/img/avatar.jpg" alt="..." class="avatar-img rounded-circle" />
												</div>
												<div class="info-user ms-3">
													<div class="username">${memberListDesc.member_id}</div>
													<div class="status">${memberListDesc.member_nickname}</div>
												</div>
												<div>
													<div>${memberListDesc.join_date}</div>
												</div>
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
										<table class="table table-hover align-items-center mb-0 ">
											<thead class="thead-light">
												<tr class="textCenter">
													<th scope="col">주문 번호</th>
													<th scope="col" class="text-end">주문자 아이디</th>
													<th scope="col" class="text-end">주문 날짜</th>
													<th scope="col" class="text-end">주문 금액</th>
													<th scope="col" class="text-end">주문 상태</th>
												</tr>

											</thead>
											<tbody>
												<c:forEach items="${orderListDesc}" var="order" begin="0" end="9" step="1">
													<tr onmouseover="style.background='#F5F5F5'"
														onclick="location.href='/manager/orderDetail?order_num=${order.order_num}'"
														style="cursor:pointer;">
														<th scope="row">
															<c:choose>
																<c:when test="${order.order_status eq '결제완료'}">
																		<button class="btn btn-icon btn-round btn-success btn-sm me-2">
																			<i class="fa fa-check"></i> 
																		</button>
																	</c:when>
																	<c:when test="${order.order_status eq '결제취소요청'}">
																		<button class="btn btn-icon btn-round btn-danger btn-sm me-2">
																			<i class="fa fa-dollar-sign"></i> 
																		</button>
																	</c:when>
																	<c:when test="${order.order_status eq '결제취소'}">
																		<button class="btn btn-icon btn-round btn-warning btn-sm me-2">
																			<i class="fas fa-hand-holding-usd"></i> 
																		</button>
																	</c:when>
																	<c:otherwise>
																	<button class="btn btn-icon btn-round btn-black btn-sm me-2">
																		<i class="fas fa-hand-holding"></i> 
																	</button>
																	</c:otherwise>
																</c:choose>
															${order.order_num}
														</th>
														<td class="text-end textCenter">${order.member_id}</td>
														<td class="text-end textCenter">${order.order_date}</td>
														<td class="text-end textCenter">${order.order_price}</td>
														<td class="text-end textCenter">${order.order_status}</td>
													</tr>
												</c:forEach>
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
			<script src="/resources/js/jerry/memberIndex.js"></script>


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
				let dailySales = document.getElementsByClassName("dailySales");

				$("#lineChart").sparkline([dailySales[6].value, dailySales[5].value, dailySales[4].value, dailySales[3].value, dailySales[2].value, dailySales[1].value, dailySales[0].value], {
					type: "line",
					height: "70",
					width: "100%",
					lineWidth: "2",
					lineColor: "#177dff",
					fillColor: "rgba(23, 125, 255, 0.14)",
				});

				$("#lineChart2").sparkline([500, 125, 122, 105, 110, 124, 115], {
					type: "line",
					height: "70",
					width: "100%",
					lineWidth: "2",
					lineColor: "#f3545d",
					fillColor: "rgba(243, 84, 93, .14)",
				});

				$("#lineChart3").sparkline([105, 103, 123, 100, 600, 105, 115], {
					type: "line",
					height: "70",
					width: "100%",
					lineWidth: "2",
					lineColor: "#ffa534",
					fillColor: "rgba(255, 165, 52, .14)",
				});
			</script>

			<!--	api로 값을 추가할 때 사용함.	<script src="/resources/js/jerry/fetch.js"></script>-->
		</body>

		</html>