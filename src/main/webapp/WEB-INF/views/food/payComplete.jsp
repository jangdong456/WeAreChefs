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
                <h1 class="text-center text-white display-6">결제 완료</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/food/list">Store</a></li>
                    <li class="breadcrumb-item active text-white">Complete</li>
                </ol>
            </div>
            <!-- Single Page Header End -->


            <!-- 장바구니 빔 Start -->
            <div class="container-fluid py-5">
                <div class="container py-5 text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <h1 class="mb-4">결제가</h1>
                            <h1 class="mb-4">완료됐습니다</h1>
                            <p class="mb-4">주문번호 : ${num.order_num}</p>
                            <a class="btn border-secondary rounded-pill py-3 px-5" href="/member/buyList">결제 내역 확인하러
                                가기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 장바구니 빔 End -->



            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>


        </body>

        </html>