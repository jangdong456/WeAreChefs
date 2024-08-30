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
                <h1 class="text-center text-white display-6">Wrong Approach</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/food/list">Store</a></li>
                    <li class="breadcrumb-item active text-white">We Are Chefs</li>
                </ol>
            </div>
            <!-- Single Page Header End -->


        <div class="container-fluid py-5">
            <div class="container py-5 text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h1 class="display-1">잘못된 접근!</h1>
                        <h1 class="mb-4">페이지를 찾을 수 없습니다</h1>
                        <p class="mb-4">입력하신 페이지 주소가 정확한지 다시 확인하시거나</p>
                        <p class="mb-4">홈으로 이동하여 다른 링크를 이용해주세요</p>
                        <a class="btn border-secondary rounded-pill py-3 px-5" href="/">Home으로 가기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->



            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>


        </body>

        </html>