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
		<h1 class="text-center text-white display-6">상점</h1>
	</div>
	<!-- Single Page Header End -->
	
	
           <div class="form-group">
                <label class="form-label mt-3 mr-3">* 상품 설명</label>
                <textarea id="editor" name="food_contents">${dto.food_contents}</textarea>
            </div>



<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
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