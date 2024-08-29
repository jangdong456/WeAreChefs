<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">

			<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

			<style type="text/css">
				#thumbImg {
					height: 500px;
					width: 500px;
					object-fit: cover;
				}

				.container1 {
					display: flex;
					align-items: center;
					justify-content: center;

				}

				.image-container,
				.info-container {
					margin: 10px;
				}

				.info-container {
					max-width: 600px;
					/* 너비를 600px로 조정 (원하는 너비로 설정) */
				}

				#contentDiv {
					width: 1100px;
				}

				#detailLine {
					color: green
				}

				.starRate {
					cursor: pointer;
					/* 커서를 포인터 모양으로 변경 */
				}

				.button-container {
					display: flex;
					gap: 10px;
					/* 버튼 사이의 간격을 설정 */
					text-decoration: underline;
				}

				.updateReply {
					cursor: pointer;
				}

				.deleteReply {
					cursor: pointer;
				}

				.areaContext {
					border: 2px solid rgb(39, 160, 28);
				}

				.stars {
					cursor: pointer;
				}

				.adminReply {
					cursor: pointer;
				}
			</style>

		</head>

		<body>
			<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

			<!-- Single Page Header start -->
			<div class="container-fluid page-header py-5">
				<h1 class="text-center text-white display-6">상점 둘러보기</h1>
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="/food/list">Store</a></li>
					<li class="breadcrumb-item active text-white">Detail</li>
				</ol>
			</div>
			<!-- Single Page Header End -->

			<div class="container1">
				<div class="image-container">

					<img src="/resources/upload/foods/${map.dto.storeImgFileDTO.file_name}" class="img-fluid rounded"
						alt="Image" id="thumbImg">

				</div>
				<div class="info-container">
					<h4 class="fw-bold mt-5 mb-3">🫑We Are Chefs 홈페이지에 오신걸 환영합니다🥦</h4>
					<h2 class="fw-bold mb-3"> <br /></h2>
					<p class="mb-3">*카테고리 : ${map.dto.food_category}</p>
					<h2 class="fw-bold mb-3">${map.dto.food_name}</h2>
					<h5>
						<c:choose>
							<c:when test="${map.avg<2}">
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								(${map.avg})
							</c:when>
							<c:when test="${map.avg<3}">
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								(${map.avg})
							</c:when>
							<c:when test="${map.avg<4}">
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								(${map.avg})
							</c:when>
							<c:when test="${map.avg<5}">
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star"></i>
								(${map.avg})
							</c:when>
							<c:when test="${map.avg==5}">
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								<i class="fa fa-star text-secondary"></i>
								(${map.avg})
							</c:when>
							<c:when test="${empty map.avg}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								(아직 후기가 없어요😎)
							</c:when>
						</c:choose>
					</h5>
					<h3 class="fw-bold mb-3" id="buyPrice" data-buy-price="${map.dto.food_price}">${map.dto.food_price}원
					</h3>
					<h5 class="fw-bold mb-3"> <br /></h5>
					<h5 class="fw-bold mb-3">
						<구매수량>
					</h5>

					<div class="input-group quantity mb-3" style="width: 100px;">

						<div class="input-group-btn" id="minusBtn">
							<button class="btn btn-sm btn-minus rounded-circle bg-light border">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<input type="text" class="form-control form-control-sm text-center border-0" id="buyCount"
							style="background-color: transparent;border: 0px;">
						<div class="input-group-btn" id="plusBtn">
							<button class="btn btn-sm btn-plus rounded-circle bg-light border">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<c:choose>
						<c:when test="${map.dto.food_stock<1}">
							<a href="#none"
								class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary disabled">
								<i class="fa fa-shopping-bag me-2 text-primary"></i> 품절입니다
							</a>
						</c:when>
						<c:otherwise>
							<a href="#none" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"
								id="cartAdd">
								<i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기
							</a>
						</c:otherwise>
					</c:choose>
				</div>

				<form action="/food/cartAdd" method="get" id="cartFrm">
					<input type="hidden" name="cart_count" id="cartCount">
					<input type="hidden" name="food_num" value="${map.dto.food_num}">
				</form>




			</div>

			<div class="container justify-content-center text-center">
				<hr class="border border-primary border-3 opacity-75 mt-5 mb-5">
			</div>
			<div class="container1 mt-3">
				<h1 class="fw-bold mb-3">🥔상품 설명🧅</h1>
			</div>

			<div class="container justify-content-center text-center mt-3">
				${map.dto.food_contents}
			</div>

			<div class="container justify-content-center text-center">
				<hr class="border border-primary border-3 opacity-75 mt-5 mb-5">
			</div>

			<div class="tab-pane container justify-content-center" id="navmission" role="tabpanel"
				aria-labelledby="nav-mission-tab" data-food-num="${map.dto.food_num}">

				<c:if test="${member.member_id !='12341234'}">
					<form action="/food/replyAdd" method="post">
						<h4 class="fw-bold">✏️상품 후기 남기기</h4>
						<div class="row g-4">
							<div class="col-lg-12">
								<div class="border-bottom rounded my-4">
									<textarea name="board_content" id="areaIs" class="form-control border-0" cols="30"
										rows="8" placeholder="받아보신 상품은 어떠셨나요?" spellcheck="false"></textarea>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="d-flex justify-content-between py-3 mb-5">
									<div class="d-flex align-items-center">
										<p class="mb-0 me-3">*별점을 남겨주세요</p>
										<div class="d-flex align-items-center starRate" style="font-size: 20px;">
											<i class="fa fa-star text-secondary" id="firstStar"></i>
											<i class="fa fa-star text-secondary" id="secondStar"></i>
											<i class="fa fa-star text-secondary" id="thirdStar"></i>
											<i class="fa fa-star text-secondary" id="fourthStar"></i>
											<i class="fa fa-star text-secondary" id="fifthStar"></i>
										</div>
									</div>
									<div id="target-element"></div>
									<button class="btn border border-secondary text-primary rounded-pill px-4 py-3">후기
										쓰기</button>
								</div>
							</div>
						</div>
						<input type="hidden" name="food_rating" value="5" id="starValue">
						<input type="hidden" name="member_id" value="${map.admin.member_id}">
						<input type="hidden" name="food_num" value="${map.dto.food_num}">
					</form>
				</c:if>

				<div style="display: none;">
					<i class="fa fa-star text-secondary" id="firstStar"></i>
					<i class="fa fa-star text-secondary" id="secondStar"></i>
					<i class="fa fa-star text-secondary" id="thirdStar"></i>
					<i class="fa fa-star text-secondary" id="fourthStar"></i>
					<i class="fa fa-star text-secondary" id="fifthStar"></i>
					<input type="hidden" name="food_rating" value="5" id="starValue">
				</div>

				<c:choose>
					<c:when test="${empty map.reply}">
						<div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
							<h4 class="fw-bold mb-3">👀상품 후기가 없습니다. 후기 남겨주실래요?</h4>
						</div>
					</c:when>
					<c:otherwise>
						<div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
							<h4 class="fw-bold mb-3">📖상품 후기들</h4>

							<c:forEach items="${map.reply}" var="a">
								<c:if test="${a.member_id!='12341234'}">
									<hr class="border opacity-100 mb-5">
								</c:if>
								<div class="d-flex">
									<div class="">
										<c:if test="${a.member_id=='12341234'}">
											<h5>↪<운영자 답변>💕</h5>
										</c:if>
										<p class="mb-2" style="font-size: 14px;">${a.update_date}</p>

										<c:if test="${a.member_id!='12341234'}">
											<h5>${a.member_id}</h5>
											<c:choose>
												<c:when test="${a.food_rating=='1'}">
													<div class="d-flex mb-3">
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												</c:when>
												<c:when test="${a.food_rating=='2'}">
													<div class="d-flex mb-3">
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												</c:when>
												<c:when test="${a.food_rating=='3'}">
													<div class="d-flex mb-3">
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
												</c:when>
												<c:when test="${a.food_rating=='4'}">
													<div class="d-flex mb-3">
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star"></i>
													</div>
												</c:when>
												<c:otherwise>
													<div class="d-flex mb-3">
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
														<i class="fa fa-star text-secondary"></i>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>

										<c:choose>
											<c:when test="${a.del=='N'}">
												<p class="replyContent">${a.reply_content}</p>
											</c:when>
											<c:otherwise>
												<p class="replyContent">삭제된 댓글입니다.</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="updateDiv" data-reply-num="${a.food_reply_num}"
									data-admin-num="${map.dto.food_num}">
									<c:choose>
										<c:when test="${member.member_id == a.member_id}">
											<c:choose>
												<c:when test="${a.del == 'N'}">
													<div class="button-container justify-content-end" align="right">
														<p class="updateReply" id="updateReply${a.food_reply_num}"
															data-reply-num="${a.food_reply_num}"
															data-reply-writer="${a.member_id}"
															data-reply-content="${a.reply_content}"
															data-reply-start="${a.food_rating}">수정</p>
														<p class="deleteReply" id="deleteReply${a.food_reply_num}"
															data-reply-num="${a.food_reply_num}">삭제</p>
													</div>
												</c:when>
												<c:otherwise>
													<div class="button-container justify-content-end" align="right">
													</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:when test="${member.member_id == '12341234'}">
											<c:choose>
												<c:when test="${member.member_id == a.member_id}">
													<div class="button-container justify-content-end" align="right">
														<p class="updateReply" id="updateReply${a.food_reply_num}"
															data-reply-num="${a.food_reply_num}"
															data-reply-writer="${a.member_id}"
															data-reply-content="${a.reply_content}"
															data-reply-start="${a.food_rating}">수정</p>
														<p class="deleteReply" id="deleteReply${a.food_reply_num}"
															data-reply-num="${a.food_reply_num}">삭제</p>
													</div>
												</c:when>

												<c:otherwise>
													<div class="button-container justify-content-end" align="right">
														<p class="adminReply" id="admin${map.dto.food_num}"
															data-admin-num="${map.dto.food_num}"
															data-reply-num="${a.food_reply_num}">답글달기</p>
													</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>

							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				<c:if test="${not empty map.reply}">
					<div class="col-12">
						<div class="pagination d-flex justify-content-center mt-5">
							<a href="/food/detail?food_num=${map.dto.food_num}&page=${map.pager.startNum-1}#target-element"
								class="btn rounded ${map.pager.pre?'':'disabled'}">&laquo;</a>
							<c:forEach begin="${map.pager.startNum}" end="${map.pager.lastNum}" step="1" var="i">
								<a href="/food/detail?food_num=${map.dto.food_num}&page=${i}#target-element"
									class="rounded">${i}</a>
							</c:forEach>
							<a href="/food/detail?food_num=${map.dto.food_num}&page=${map.pager.lastNum+1}#target-element"
								class="btn rounded ${map.pager.next?'':'disabled'}">&raquo;</a>
						</div>
					</div>
				</c:if>


			</div>


			<c:if test="${map.admin.member_id=='12341234'}">
				<div class="container form-group mt-5" align="right">
					<a href="/food/update?food_num=${map.dto.food_num}"><button
							class="btn border-secondary text-uppercase text-primary" type="button" id="foodAdd">글
							수정하기</button></a>
				</div>
				<div class="container form-group mt-2" align="right">
					<a href="/food/delete?food_num=${map.dto.food_num}"><button
							class="btn border-secondary text-uppercase text-primary" type="button" id="foodAdd">글
							삭제하기</button></a>
				</div>
			</c:if>



			<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
			<script type="text/javascript" src="/resources/js/food/detail.js"></script>


		</body>

		</html>