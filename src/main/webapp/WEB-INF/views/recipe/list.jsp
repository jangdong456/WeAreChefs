<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>recipeList</title>
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

<style>
.form-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.form-wrapper {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

.form-item {
	margin-bottom: 15px;
}
 .form-control {
        width: 100%;
    }
    	.ck.ck-editor{
	   max-width: 1000px;
  }
  .ck-editor__editable {
     min-height: 400px;
     max-height: 600px;
  }
  .ck-content { 
	  font-size: 12px; 
	 }
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
	<!-- Hero Start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">레시피 목록</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active text-white">recipeList</li>
		</ol>
	</div>
	<div class="container-fluid py-5">
		<div class="container py-5">
			<h3 class="mb-4" style="text-align: center;">🍽️레시피</h3>
			<div class="form-container">
			
				<div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
								<form action="/recipe/list" method="get" id="frm">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="레시피명을 검색하세요." aria-describedby="search_icon" name="search">
                                    <span id="search_icon" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
							</form>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
									<label for="order">정렬</label>
									<form action="/recipe/list" method="get" id="order_frm" name ="order_frm">
                                    	<select id="order" name="order" class="border-0 form-select-sm bg-light me-3">
	                                        <option value="date_up" id="date_up">최신순</option>
	                                        <option value="date_down" id="date_down">과거순</option>
	                                        <option value="hit" id="date_down">인기순</option>    
                                    	</select>
                                	</form>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>한식</a>
                                                        <span>(3)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>양식</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>중식</a>
                                                        <span>(2)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>일식</a>
                                                        <span>(8)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>디저트</a>
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
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                   <c:forEach var="recipe" items="${ar}">
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                               <img src="/resources/upload/recipes/${recipe.recipeImgFileDTO.file_name}" class="img-fluid w-100 rounded-top" alt="">
                                               
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${recipe.recipe_category}</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                 <h4>${recipe.recipe_name}</h4>
		                                                <p> ${recipe.menu_recipe}</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                  	 </c:forEach>
                                    </div>
                                    <h3>${recipePager.pre}</h3>
                                           <h3>${recipePager.next}</h3>
                                            <h3>${recipePager.page}</h3>
                                  <!--   <div class="col-12"> -->
                                        <div class="pagination d-flex justify-content-center mt-5">
							                  <nav aria-label="Page navigation example">
							                     <!-- <ul class="pagination d-flex justify-content-center mt-5 "> -->
												
													 
										<a href="/recipe/list?page=${recipePager.startNum-1}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" class="rounded ${recipePager.pre?'':'disabled'}" >&laquo;</a>
                                        <c:forEach begin="${recipePager.startNum}" end="${recipePager.lastNum}" step="1" var="i">
                                            <a href="/recipe/list?page=${i}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" class="btn btn-primary disabled">${i}</a>
                                        </c:forEach>
                                        <!-- 다음버튼 -->
                                        <a href="/recipe/list?page=${recipePager.lastNum+1}&search=${recipePager.search}&kind=${recipePager.kind}&order=${recipePager.order}" class="rounded ${recipePager.next?'':'disabled'}">&raquo;</a>
													 
							                   <%--  <li class="page-item ${recipePager.pre?'':'disabled'} d-inline ">
							                           <a href="/recipe/list?page=${recipePager.startNum-1}&kind=${recipePager.kind}&search=${recipePager.search}"
							                              aria-label="Previous" class="${recipePager.pre ?'':disabled}  rounded"> <span aria-hidden="true">&laquo;</span>
							                           </a>
							                        </li> 
					
							                        <c:forEach begin="${recipePager.startNum}"
							                           end="${recipePager.lastNum}" step="1" var="i">
							                           <li class="page-item ${recipePager.page==i?'active':''}"><a class="page-link d-inline rounded"
							                              href="/recipe/list?page=${i}&kind=${recipePager.kind}&search=${recipePager.search}">${i}</a></li>
							                        </c:forEach>

													<!-- 다음버튼 -->
							                        <li class="page-item ${recipePager.next?'':'disabled'} d-inline">
							                           <a
							                              href="/recipe/list?page=${recipePager.lastNum+1}&kind=${recipePager.kind}&search=${recipePager.search}"
							                              aria-label="Next"  class=" ${recipePager.next ?'':'disabled'} rounded"> <span aria-hidden="true">&raquo;</span>
							                           </a>
							                        </li> --%>
							                    <!--  </ul> -->
							                  </nav>
							               </div> 
                                 <!--    </div> -->



<!-- 
									<a href="/food/list?page=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}" class="rounded ${pager.pre?'':'disabled'}" >&laquo;</a>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
										<a href="/food/list?page=${i}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}" class="rounded">${i}</a>
									</c:forEach>
									<a href="/food/list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}&order=${pager.order}" class="rounded ${pager.next?'':'disabled'}">&raquo;</a> -->





                                </div>
                            </div>
                        </div>
                    </div>
                </div>

	
				<button class="btn btn-danger disabled">Test</button>
				<a href="#" 
			</div> 
	 </div>




	<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/files.js"></script>
<script type="text/javascript" src="/resources/js/recipe/recipeList.js"></script>

</html>
								