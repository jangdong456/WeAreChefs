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
</style>

</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">판매 재료 등록하기</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- 본문 -->
	
    <div class="container py-5">
    <h3 class="mb-4">판매할 재료를 창고에서 검색합니다.</h3>
    <h5 class="mb-4">🌱재고가 있는 상품만 검색됩니다.</h5>
    <h5 class="mb-4">🌱등록할 재료명을 선택하면 상품명, 카테고리, 재고, 판매가는 자동으로 입력 됩니다.</h5>
        <form action="#">
            <div class="form-group">
                <label class="form-label mt-3">* 창고에서 재료 검색하기</label>
                <div class="input-group">
                    <input type="text" class="form-control" style="flex: 1 1 0; max-width: 60%;" id="searchName">
                    <div class="input-group-append">
                        <button class="btn border-secondary text-uppercase text-primary" type="button" style="margin-left: 10px;" id="foodSearch">검색</button>
                    </div>
                </div>
            </div>
            
            <div id="foodHouse">
            
            </div>
            
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 상품명</label>
                <input type="text" class="form-control w-50" readonly>
            </div>

            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 카테고리</label>
                <input type="text" class="form-control w-50" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 재고</label>
                <input type="text" class="form-control w-50" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label mt-3 mr-3">* 판매가</label>
                <input type="text" class="form-control w-50" readonly>
            </div>
 
           <div class="form-group">
                <label class="form-label mt-3 mr-3">* 상품 설명</label>
                <textarea id="editor"></textarea>
            </div>
            
             <div class="form-group">
                <label class="form-label mt-3 mr-3">* 대표 이미지</label>
                <input type="file">
            </div>

            <div class="form-group" align="right">
                <button class="btn border-secondary text-uppercase text-primary" type="button">등록하기</button>
            </div>
            
        </form>
    </div>
        



<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>

<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/food/add.js"></script>
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