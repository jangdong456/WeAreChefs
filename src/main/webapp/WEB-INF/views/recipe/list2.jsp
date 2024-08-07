<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>recipeAdd</title>
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
			       <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-lg-9">
             
                                <div class="row g-4 justify-content-center">
                                      <c:forEach var="recipe" items="${ar}">
		                                    <div class="col-md-6 col-lg-6 col-xl-4">
		                                        <div class="rounded position-relative fruite-item">
		                                           <c:if test=""></c:if>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
			
			
			
		</div>
				
</div>

<div class="container justify-content-center text-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<li class="page-item ${pager.pre?'':'disabled'}"><a
				class="page-link"
				href="./list2?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1"
				var="i">
				<li class="page-item"><a class="page-link"
					href="./list2?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>

			<li class="page-item ${pager.next?'':'disabled'}"><a
				class="page-link"
				href="./list2?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

	<form action="./list2" method="get"
		class="row row-cols-lg-auto g-3 align-items-center justify-content-end">


		<div class="col-12">
			<label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
			<select name="kind" class="form-select" id="inlineFormSelectPref">
				<option value="k1">상품명</option>
				<option value="k2">상품내용</option>
			</select>
		</div>

		<div class="col-12">
			<label class="visually-hidden" for="inlineFormInputGroupUsername"></label>
			<div class="input-group">
				<input name="search" type="text" class="form-control"
					id="inlineFormInputGroupUsername" placeholder="검색어를 입력하세요">
			</div>
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary">검색하기</button>
		</div>
	</form>
</div>
<%-- <div class="container justify-content-center text-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<li class="page-item ${pager.pre?'':'disabled'}"><a
				class="page-link"
				href="./list2?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1"
				var="i">
				<li class="page-item"><a class="page-link"
					href="./list2?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>

			<li class="page-item ${pager.next?'':'disabled'}"><a
				class="page-link"
				href="./list2?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

	<form action="./list2" method="get"
		class="row row-cols-lg-auto g-3 align-items-center justify-content-end">

		<div class="col-12">
			<label class="visually-hidden" for="inlineFormInputGroupUsername"></label>
			<div class="input-group">
				<input name="search" type="text" class="form-control"
					id="inlineFormInputGroupUsername" placeholder="검색어를 입력하세요">
			</div>
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary">검색하기</button>
		</div>
	</form>
</div>
 --%>


	<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/files.js"></script>

</html>
								