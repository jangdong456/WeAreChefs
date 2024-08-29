<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">

            <c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

        </head>

        <body>
            <c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>


            <!-- Single Page Header start -->
            <div class="container-fluid page-header py-5">
                <h1 class="text-center text-white display-6">장바구니</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/food/list">Store</a></li>
                    <li class="breadcrumb-item active text-white">Cart</li>
                </ol>
            </div>
            <!-- Single Page Header End -->

            <c:choose>
                <c:when test="${empty list}">

                    <!-- 장바구니 빔 Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5 text-center">
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <h1 class="mb-4">장바구니가</h1>
                                    <h1 class="mb-4">비어있습니다</h1>
                                    <p class="mb-4">신선한 재료 둘러보러 가실래요?</p>
                                    <a class="btn border-secondary rounded-pill py-3 px-5" href="/food/list">스토어로
                                        바로가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 장바구니 빔 End -->

                </c:when>

                <c:otherwise>
                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="table-responsive">
                                <table class="table justify-content-center text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col"><input type="checkbox" name="" id="allCheck"
                                                    checked="true">&emsp;(전체선택)</th>
                                            <th scope="col">상품</th>
                                            <th scope="col">상품명</th>
                                            <th scope="col">가격</th>
                                            <th scope="col">갯수</th>
                                            <th scope="col">합계</th>
                                            <th scope="col">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="a">
                                            <c:forEach items="${a.foodDTO}" var="f">
                                                <tr>
                                                    <th align="center" valign="middle">
                                                        <div class="justify-content-center text-center">
                                                            <input type="checkbox" class="checkOther"
                                                                data-food-num="${f.food_num}">
                                                        </div>
                                                    </th>
                                                    <td scope="row">
                                                        <div class="justify-content-center text-center">
                                                            <img src="/resources/upload/foods/${f.storeImgFileDTO.file_name}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4"><a
                                                                href="/food/detail?food_num=${f.food_num}">${f.food_name}</a>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">${f.food_price}원</p>
                                                    </td>
                                                    <td align="center">
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <div class="input-group-btn minusBtn"
                                                                data-buy-price="${f.food_price}"
                                                                data-food-num="${f.food_num}">
                                                                <button
                                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0 buyCount"
                                                                value="${a.cart_count}"
                                                                style="background-color: transparent;border: 0px;"
                                                                data-food-num="${f.food_num}"
                                                                data-buy-price="${f.food_price}">
                                                            <div class="input-group-btn plusBtn"
                                                                data-buy-price="${f.food_price}"
                                                                data-food-num="${f.food_num}">
                                                                <button
                                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4 totalPrice" data-food-num="${f.food_num}"
                                                            data-total-notice="${f.food_price*a.cart_count}">
                                                            ${f.food_price*a.cart_count}원</p>
                                                    </td>
                                                    <td>
                                                        <button
                                                            class="btn btn-md rounded-circle bg-light border mt-4 delBtn"
                                                            data-food-num="${f.food_num}">
                                                            <i class="fa fa-times text-danger"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <form action="/food/cartDelete" method="post" class="numFrm"
                                                    data-food-num="${f.food_num}">
                                                    <input type="hidden" name="food_num" value="${f.food_num}">
                                                </form>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row g-4 justify-content-end">
                                <div class="col-8"></div>
                                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">주문 <span class="fw-normal">예상금액</span></h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">상품 가격</h5>
                                                <p class="mb-0" id="totalNotice"></p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">배송비</h5>
                                                <div class="">
                                                    <p class="mb-0" id="deliveryPrice"></p>
                                                </div>
                                            </div>
                                            <p class="mb-0 text-end">(50,000원 이상 구매시 배송비 무료)</p>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">총 가격</h5>
                                            <p class="mb-0 pe-4" id="finalPrice"></p>
                                        </div>
                                        <button
                                            class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                            type="button" id="payBtn">결제 진행하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Cart Page End -->
                </c:otherwise>
            </c:choose>

            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
            <script type="text/javascript" src="/resources/js/food/cart.js"></script>

        </body>

        </html>