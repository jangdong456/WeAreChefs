<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">결제하기</h1>
	</div>
	<!-- Single Page Header End -->
	
	        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h1 class="mb-4">주문/결제</h1>
                <form action="#">
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-6 col-xl-7">
                            <h3 class="mb-3">🥑주문자 정보</h3>
                            <div class="form-item">
                                <label class="form-label my-3">닉네임<sup>*</sup></label>
                                <input type="text" class="form-control" readonly value="${orderMember.member_nickname}">
                            </div>
                            <h3 class="mb-3 mt-4">🥕받는사람 정보</h3>
                            <div class="form-item">
                                <label class="form-label my-3">이름<sup>*</sup></label>
                                <input type="text" class="form-control" id="nameInput" value="${orderMember.member_name}">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">연락처<sup>*</sup></label>
                                <input type="text" class="form-control" id="phoneInput" value="${orderMember.member_name}">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">이메일<sup>*</sup></label>
                                <input type="text" class="form-control" id="mailInput" value="${orderMember.member_mail}">
                            </div>
                           <div class="col-md-12 col-lg-6">
                            <div class="form-group">
                                <label class="form-label my-3">우편번호<sup>*</sup></label>
                                <div class="input-group">
                                    <input type="text" class="form-control" style="flex: 1 1 0; max-width: 60%; background-color: transparent;" id="postInput" readonly>
                                    <div class="input-group-append">
                                        <button class="btn border-secondary text-uppercase text-primary" type="button" style="margin-left: 10px;" id="postSearch">우편번호 검색하기</button>
                                    </div>
                                </div>
                            </div>
                           </div>
                            <div class="form-item">
                                <label class="form-label my-3">주소<sup>*</sup></label>
                                <input type="text" class="form-control" id="firstAddress" readonly style="background-color: transparent;">
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3" >상세주소</label>
                                <input type="text" class="form-control" id="secondAddress">
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
				                            <th scope="col">상품</th>
				                            <th scope="col">상품명</th>
				                            <th scope="col">가격</th>
				                            <th scope="col">갯수</th>
				                            <th scope="col">합계</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                		<c:forEach items="${list}" var="a">
                        					<c:forEach items="${a.foodDTO}" var="f">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center mt-2">
                                                    <img src="/resources/upload/foods/${f.storeImgFileDTO.file_name}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                </div>
                                            </th>
                                            <td class="py-5 foodName">${f.food_name}</td>
                                            <td class="py-5">${f.food_price}원</td>
                                            <td class="py-5 foodInfo" data-food-num="${f.food_num}">${a.cart_count}</td>
                                            <td class="py-5 totalPrice" data-total-notice="${f.food_price*a.cart_count}">${f.food_price*a.cart_count}원</td>
                                        </tr>
                                          	</c:forEach>
                   						 </c:forEach>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark text-uppercase py-3">총 상품 가격</p>
                                            </td>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark" id="totalNotice"></p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark text-uppercase py-3">배송비</p>
                                            </td>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark" id="deliveryPrice"></p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                            </th>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark text-uppercase py-3">총 결제 가격</p>
                                            </td>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark" id="finalPrice"></p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                <button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary" id="payGo">결제 진행하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->

<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script type="text/javascript" src="/resources/js/food/pay.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>