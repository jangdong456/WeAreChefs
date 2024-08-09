<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

<style type="text/css">
    #thumbImg {
        height: 500px;
        width: 500px;
    }
    .container1 {
        display: flex;
        align-items: center;
        justify-content: center;
        
    }
    .image-container, .info-container {
        margin: 10px;
    }
    .info-container {
        max-width: 600px; /* 너비를 600px로 조정 (원하는 너비로 설정) */
    }
    
    #contentDiv{
    	 width: 1100px;
    }
    
    #detailLine{
        color: green
    }

</style>

</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">상점 둘러보기</h1>
</div>
<!-- Single Page Header End -->

<div class="container1">
    <div class="image-container">
        
            <img src="/resources/upload/foods/${dto.storeImgFileDTO.file_name}" class="img-fluid rounded" alt="Image" id="thumbImg">
        
    </div>
    <div class="info-container">
    	<h4 class="fw-bold mb-3">🫑We Are Chefs 홈페이지에 오신걸 환영합니다🥦</h4>
    	<h2 class="fw-bold mb-3">  <br/></h2>
        <p class="mb-3">*카테고리 : ${dto.food_category}</p>
        <h2 class="fw-bold mb-3">${dto.food_name}</h2>
        <h3 class="fw-bold mb-3">${dto.food_price}원</h3>
    	<h5 class="fw-bold mb-3">  <br/></h5>
    	<h5 class="fw-bold mb-3"><구매수량></h5>

           <div class="input-group quantity mb-3" style="width: 100px;">

               <div class="input-group-btn" id="minusBtn">  
                   <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                       <i class="fa fa-minus"></i>
                   </button>
               </div>
               <input type="text" class="form-control form-control-sm text-center border-0" value="1" id="buyCount">
               <div class="input-group-btn" id="plusBtn">
                   <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                       <i class="fa fa-plus"></i>
                   </button>	
               </div>
           </div>
        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
            <i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기
        </a>
    </div>
    
    
    
    
</div>

   <div class="container justify-content-center text-center mt-3" id="detailLine">
   =====================================================================================================================
	</div>

	<div class="container1 mt-3">
   <h1 class="fw-bold mb-3">🥔상품 설명🧅</h1>
   </div>
   
   <div class="container justify-content-center text-center mt-3">
   ${dto.food_contents}
	</div>
	
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script type="text/javascript" src="/resources/js/food/detail.js"></script>


</body>
</html>