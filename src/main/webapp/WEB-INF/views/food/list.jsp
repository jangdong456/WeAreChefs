<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">

            <c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

            <style type="text/css">
                .fruite-item {
                    height: 350px;
                    /* 원하는 높이로 설정 */
                    display: flex;
                    flex-direction: column;
                }

                .fruite-img {
                    flex: 1;
                }

                .p-4 {
                    flex: 1;
                }

                #searchIcon {
                    cursor: pointer;
                    /* 커서를 포인터 모양으로 변경 */
                }

                .disabled {
                    pointer-events: none;
                    cursor: default;
                }
            </style>

        </head>

        <body>
            <c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>


            <!-- Single Page Header start -->
            <div class="container-fluid page-header py-5">
                <h1 class="text-center text-white display-6"><a href="/food/list" style="color: #ffffff;">상점</a></h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="/recipe/list">Recipe</a></li>
                    <li class="breadcrumb-item active text-white">StoreList</li>
                </ol>
            </div>
            <!-- Single Page Header End -->

            <!-- Fruits Shop Start-->
            <div class="container-fluid fruite py-5">
                <div class="container py-5">
                    <h1 class="mb-4">🍋 어서오세요</h1>
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <div class="col-xl-3">
                                    <form action="/food/list" method="get" id="frm">
                                        <div class="input-group w-100 mx-auto d-flex">
                                            <input type="search" class="form-control p-3" placeholder="재료명을 검색하세요"
                                                aria-describedby="search-icon-1" name="search">
                                            <span id="searchIcon" class="input-group-text p-3"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-6"></div>
                                <div class="col-xl-3">
                                    <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                        <label for="fruits">분류</label>
                                        <select id="fruits" name="fruitlist"
                                            class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                            <option value="recent" id="orderRecent" class="listOrder">최신순</option>
                                            <option value="up" id="orderUp" class="listOrder">높은가격순</option>
                                            <option value="down" id="orderDown" class="listOrder">낮은가격순</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div id="listDiv">
                                <div class="row g-4">
                                    <div class="col-lg-3">
                                        <div class="row g-4">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <h4>카테고리</h4>
                                                    <ul class="list-unstyled fruite-categorie">
                                                        <c:forEach items="${count}" var="entry">
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="/food/list?kind=${entry.FOOD_CATEGORY}"><i
                                                                            class="fas fa-apple-alt me-2"></i>${entry.FOOD_CATEGORY}</a>
                                                                    <span>(${entry.COUNT})</span>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="col-lg-12">
                                                <div class="position-relative">
                                                    <img src="/resources/img/banner-fruits.jpg"
                                                        class="img-fluid w-100 rounded" alt="">
                                                    <div class="position-absolute"
                                                        style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                        <h3 class="text-secondary fw-bold">신선한 <br> 재료가 <br> 한가득</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="row g-4 justify-content-left">
                                            <c:choose>
                                                <c:when test="${empty list}">
                                                    <h1>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과가 없습니다.</h1>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${list}" var="a">
                                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                                            <div class="rounded position-relative fruite-item">
                                                                <div class="fruite-img">
                                                                    <img src="/resources/upload/foods/${a.storeImgFileDTO.file_name}"
                                                                        class="img-fluid w-100 rounded-top" alt="">
                                                                </div>
                                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">${a.food_category}
                                                                </div>
                                                                <div
                                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                    <h4>${a.food_name}</h4>
                                                                    <p></p>
                                                                    <div
                                                                        class="d-flex justify-content-between flex-lg-wrap">
                                                                        <p class="text-dark fs-5 fw-bold mb-0">
                                                                            ${a.food_price}원</p>
                                                                        <a href="/food/detail?food_num=${a.food_num}"
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>둘러보기</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <a href="/food/list?page=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}"
                                                class="btn rounded ${pager.pre?'':'disabled'}">&laquo;</a>
                                            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1"
                                                var="i">
                                                <a href="/food/list?page=${i}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}"
                                                    class="rounded">${i}</a>
                                            </c:forEach>
                                            <a href="/food/list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}"
                                                class="btn rounded ${pager.next?'':'disabled'}">&raquo;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Fruits Shop End-->

                <c:if test="${admin.member_id=='12341234'}">
                    <div class="container form-group mt-5" align="right">
                        <a href="/food/add"><button class="btn border-secondary text-uppercase text-primary"
                                type="button" id="foodAdd">상품 등록하기</button></a>
                    </div>
                </c:if>

            </div>
            <script type="text/javascript" src="/resources/js/food/list.js"></script>
            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>


        </body>

        </html>