<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

</head>
<body>
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
<!-- Start -->
<!-- <div class="tab-content">
    <div id="tab-1" class="tab-pane fade show p-0 active">                                        
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">

                    <c:forEach items="${wishList}" var="list"> 
               
                        <div class="col-md-6 col-lg-4 col-xl-3">
                            <div class="rounded position-relative fruite-item">
                                <div class="fruite-img">
                                    <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${list.recipe_category}</div>
                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                    <h4>${list.recipe_name}</h4>
                                    <p id="test">${list.menu_recipe}</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <a href="/recipe/detail?recipe_num=${list.recipe_num}" style="margin-left:18%" class="btn border border-secondary rounded-pill px-3 text-primary">🧑‍🍳레시피보러가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>                                       
    </div>
</div>   -->
<!-- End -->
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

                        </div>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <h4>Categories</h4>
                                        <ul class="list-unstyled fruite-categorie">
                                         <c:forEach items="${count}" var="cnt">
                                      
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="/recipe/list?kind=${cnt.RECIPE_CATEGORY}"><i class="fas fa-apple-alt me-2"></i>한식</a>
                                                    <span>한식</span>
                                                </div>
                                            </li>   
                                           </c:forEach>
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

                               <c:forEach items="${wishList}" var="list">
                                            <div class="col-md-6 col-lg-6 col-xl-4">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                       <img src="/resources/upload/recipes/${recipe.recipeImgFileDTO.file_name}" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                   <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${list.recipe_category}</div> 
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                         <h4>${list.recipe_name}</h4>
                                                                <p>${list.menu_recipe}</p>                                                               
                                                        <div class="d-flex justify-content-between flex-lg-wrap" style="margin-left:32px;">                                  
                                                            <a href="/recipe/detail?recipe_num=${recipe.recipe_num}" class="btn border border-secondary rounded-pill px-3 text-primary" ><i class="fa me-2 text-primary"></i>🧑‍🍳레시피 보러가기 </a>
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
 </div>
         
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
