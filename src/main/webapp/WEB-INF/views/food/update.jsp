<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>

<style>
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

     #viewImg {
        width: 350px;
        height: 350px;
        object-fit: cover;
    }

</style>

</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">판매 재료 수정하기</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- 본문 -->
	
    <div class="container py-5">
    <h3 class="mb-4">판매할 재료의 정보를 수정합니다.</h3>
    <h5 class="mb-4">🌱수정할 상품의 카테고리, 재고, 판매가는 자동으로 업데이트 됩니다.</h5>
    <h5 class="mb-4">🌱대표 이미지는 변동사항이 없을 시, 기존의 이미지가 표시 됩니다.</h5>
            
            <form action="/food/update" method="post" enctype="multipart/form-data">
                <input type="hidden" id="foodNum" name="food_num" value="${dto.food_num}">
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 상품명</label>
                <input type="text" class="form-control w-50" readonly id="foodName" value="${dto.food_name}">
            </div>

            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 카테고리</label>
                <input type="text" class="form-control w-50" readonly id="foodCategory" value="${dto.food_category}">
            </div>
            
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 재고</label>
                <input type="text" class="form-control w-50" readonly id="foodStock" value="${dto.food_stock}">
            </div>
            
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 판매가</label>
                <input type="text" class="form-control w-50" readonly id="foodPrice" value="${dto.food_price}">
            </div>
 
           <div class="form-group">
                <label class="form-label mt-3 mr-3">* 상품 설명</label>
                <textarea id="editor" name="food_contents">${dto.food_contents}</textarea>
            </div>
            
             <div class="form-group">
                <label class="form-label mt-3 mr-3">* 대표 이미지</label>
                <input type="file" name="attach" id="attach">
            </div>

            <div class="form-group" id="imgDiv">
                <input type="hidden" id="foodNum" name="storeImgFileDTO.file_name" value="${dto.storeImgFileDTO.file_name}">
                <img id="viewImg" src="/resources/upload/foods/${dto.storeImgFileDTO.file_name}"/>
            </div>

            <div class="form-group" align="right">
                <button class="btn border-secondary text-uppercase text-primary" type="submit" id="foodAdd">수정하기</button>
            </div>
            
        </form>
    </div>
        



<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>

<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/food/update.js"></script>
<script type="text/javascript">

	ClassicEditor.create( 
		document.getElementById( 'editor' ), {
			extraPlugins: [MyCustomUploadAdapterPlugin]
       },
	   
     )
	 .then(editor=>{
		window.editor=editor
	 })
	 
	 .catch(error=>{
			console.log('error')
	 })
	
</script>

</body>
</html>