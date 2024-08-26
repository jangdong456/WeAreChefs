<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">

            <c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
            <style>
                .pagination-container {
                    display: flex;
                    justify-content: center;
                    /* 중앙 정렬 */
                    margin-top: 20px;
                }

                .pagination {
                    display: flex;
                    justify-content: space-between;
                    /* 좌우로 공간을 분배 */
                }

                .page-item {
                    margin: 0 5px;
                    /* 좌우 버튼 간격 조절 */
                }
            </style>
        </head>

        <body>

            <c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

            <!-- Single Page Header start -->
            <div class="container-fluid page-header py-5">
                <h1 class="text-center text-white display-6">주문내역 확인하기</h1>
            </div>
            <!-- Single Page Header End -->

            <c:choose>

                <c:when test="${empty list}">
                    <div class="container-fluid py-5">
                        <div class="container py-5 text-center">
                            <div align="left">
                                <h5>📆기간별 주문내역 검색하기</h5>
                                <form action="/member/buyList" method="get">
                                    <input type="date" name="startDate">&nbsp;~&nbsp;<input type="date"
                                        name="endDate">&nbsp;
                                    <button class="btn border-secondary text-uppercase text-primary"
                                        type="submit">검색하기</button>
                                </form>
                            </div>
                            <h1 class="mb-4 mt-5">결제내역이 없습니다</h1>
                            <h1 class="mb-4">다시 검색하세요</h1>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>

                    <!-- Order Details Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5 justify-content-center">
                            <h5>📆기간별 주문내역 검색하기</h5>
                            <form action="/member/buyList" method="get">
                                <input type="date" name="startDate">&nbsp;~&nbsp;<input type="date"
                                    name="endDate">&nbsp;
                                <button class="btn border-secondary text-uppercase text-primary"
                                    type="submit">검색하기</button>
                            </form>
                            <c:forEach items="${list}" var="order">
                                <hr class="border border-primary border-3 opacity-75 mt-5">
                                <h1>🤍${order.order_date} 주문</h1>
                                <h3>(주문번호 : ${order.order_num})</h3>

                                <!-- 주문자 주소 및 총 결제 금액 테이블 (한 번만 출력) -->
                                <table class="table justify-content-center text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">받는 사람</th>
                                            <th scope="col">받는 주소</th>
                                            <th scope="col">배송비</th>
                                            <th scope="col">총 결제 금액</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${order.order_name}</td>
                                            <td>${order.delivery_address}</td>
                                            <td class="deliveryFee" data-order-num="${order.order_num}"></td>
                                            <td>${order.order_price}원</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <!-- 상품 정보 테이블 -->
                                <table class="table justify-content-center text-center">
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
                                        <c:forEach items="${order.store_ar}" var="mid">
                                            <c:forEach items="${mid.foodDTOs}" var="food">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="justify-content-center text-center">
                                                            <img src="/resources/upload/foods/${food.storeImgFileDTO.file_name}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td align="center" valign="middle">${food.food_name}</td>
                                                    <td align="center" valign="middle">${food.food_price}원</td>
                                                    <td align="center" valign="middle">${mid.cart_count}</td>
                                                    <td align="center" valign="middle"
                                                        data-order-num="${order.order_num}"
                                                        data-order-price="${food.food_price * mid.cart_count}"
                                                        class="foodPrice">${food.food_price * mid.cart_count}원</td>
                                                </tr>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <br>
                                <table class="table justify-content-center text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">배송상태</th>
                                            <th scope="col">결제상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${order.delivery_status}</td>
                                            <td>${order.order_status}</td>
                                        </tr>
                                    </tbody>
                                </table>
								
								<c:if test="${order.order_status=='결제완료'}">
                                <div class="container form-group mt-5" align="right">
                                    <a href="/member/cancleRequest?order_num=${order.order_num}"><button
                                            class="btn border-secondary text-uppercase text-primary" type="submit">결제취소
                                            신청</button></a>
                                </div>
                                </c:if>
                            </c:forEach>
                        </div>


                    </div>
                    <!-- Order Details End -->
                    <div class="container">
                        <div class="pagination-container">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link ${pager.pre?'':'disabled'}"
                                            href="/member/buyList?page=${pager.startNum-1}">이전</a></li>
                                    <li class="page-item"><a class="page-link ${pager.next?'':'disabled'}"
                                            href="/member/buyList?page=${pager.lastNum+1}">다음</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </c:otherwise>
            </c:choose>
            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
            <script type="text/javascript" src="/resources/member/js/buyList.js"></script>
        </body>

        </html>