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
<div class="tab-content">
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
</div>  
<!-- End -->

         
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
</html>
