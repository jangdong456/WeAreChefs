<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

<style type="text/css">
.fruite-item {
    height: 350px; /* 원하는 높이로 설정 */
    display: flex;
    flex-direction: column;
}
.fruite-img {
    flex: 1;
}
.p-4 {
    flex: 1;
}

#search-icon-1 {
  cursor: pointer; /* 커서를 포인터 모양으로 변경 */
}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">상점</h1>
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
                                <div class="input-group w-100 mx-auto d-flex" id="icondiv">
                                    <input type="search" class="form-control p-3" placeholder="재료명을 검색하세요" aria-describedby="search-icon-1" id="nameSearch">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">분류</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="volvo">최신순</option>
                                        <option value="volvo">높은가격순</option>
                                        <option value="saab">낮은가격순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>카테고리</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>채소</a>
                                                        <span>(3)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>축산</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>수산물</a>
                                                        <span>(2)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>과일</a>
                                                        <span>(8)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>기타</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="/resources/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">신선한 <br> 재료가 <br> 한가득</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-left" id="listDiv">
                                    
                                          <c:forEach items="${list}" var="a">
		                                    <div class="col-md-6 col-lg-6 col-xl-4">
		                                        <div class="rounded position-relative fruite-item">
		                                           
		                                            <div class="fruite-img">
		                                                <img src="/resources/upload/foods/${a.storeImgFileDTO.file_name}" class="img-fluid w-100 rounded-top image-thumbnail" alt="" width="500" height="350">
		                                            </div>
		                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${a.food_category}</div>
		                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
		                                                <h4>${a.food_name}</h4>  
		                                                <div class="d-flex justify-content-between flex-lg-wrap">
		                                                    <p class="text-dark fs-5 fw-bold mb-0">${a.food_price}</p>
		                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>둘러보기</a>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
                                    	</c:forEach>
                                    
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <a href="#" class="rounded">&laquo;</a>
                                            <a href="#" class="active rounded">1</a>
                                            <a href="#" class="rounded">2</a>
                                            <a href="#" class="rounded">3</a>
                                            <a href="#" class="rounded">4</a>
                                            <a href="#" class="rounded">5</a>
                                            <a href="#" class="rounded">&raquo;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->

<script type="text/javascript" src="/resources/js/food/list.js"></script>
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>


</body>
</html>