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
	<c:import url="../templete/nav.jsp"></c:import>
	<!-- Hero Start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">레시피 작성</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active text-white">recipeAdd</li>
		</ol>
	</div>
	<div class="container-fluid py-5">
		<div class="container py-5">
			<h3 class="mb-4" style="text-align: center;">🍽️레시피를 작성해주세요.</h3>
			<h5 class="mb-4" style="text-align: center;">💡요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</h5>
			<div class="form-container">
				<div class="form-wrapper">
					<form method ="post" enctype="multipart/form-data">
						<div class="row g-5">
							<div class="col-12 ">
							
								 <div class="row">
									<div class="col-md-12 col-lg-6">
										<!-- <div class="form-item w-100">  -->
											<label class="form-label my-3" >작성자<sup>*</sup></label>
											<input type="text" class="form-control" readonly="readonly">
										</div>
										
									</div>
									<div class="col-12 ">
										<div class="form-item w-100">
											<label class="form-label my-3">요리명<sup>*</sup></label>
											<input type="text" class="form-control" placeholder="ex) 소고기 미역국끓이기">
										</div>
									</div>
									<div class="col-12">
		    							<div class="form-item w-100">
											<label class="form-label my-3">완성사진 추가<sup>*</sup></label>
											<button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary" id="add" style="margin-bottom: 10px;">추가</button>
											<div id="result">

 											 </div>
										
		  		 					</div>
									<div class="col-md-12 ">
										<div class="form-item w-100">
											<label class="form-label my-3">요리소개<sup>*</sup></label>
											<textarea class="form-control" spellcheck="false" placeholder="ex) 남편 생일을 맞아 소고기 미역국을 끓여봤어요~"
											cols="30" rows="11" id="editor" ></textarea>
										</div>
									</div>	
									<div class="col-md-12">
									      <nav class="navbar navbar-light bg-white navbar-expand-xl">                     
											<div class="form-item w-100">
							         			<label class="form-label my-3">레시피 카테고리<sup>*</sup></label>             
			   	                                	<select class="form-select" aria-label="Default select example" name="category" id="category" >
			   	                    						  <option selected>카테고리를 선택하세요.</option>
															  <option value="한식">한식</option>
															  <option value="양식">양식</option>
															  <option value="중식">중식</option>
															  <option value="일식">일식</option>
															  <option value="디저트">디저트</option>
													</select>
				                       	 	</div>                     
										</nav>               		                              	
									</div>
									<div class="col-md-12">
									      <nav class="navbar navbar-light bg-white navbar-expand-xl">                     
											<div class="form-item w-100">
							         			<label class="form-label my-3">난이도<sup>*</sup></label>             
			   	                                	<select class="form-select" aria-label="Default select example" name="level" id="level">
			   	                    						  <option selected>난이도를 선택하세요.</option>
															  <option value="아무나">아무나</option>
															  <option value="초급">초급</option>
															  <option value="중급">중급</option>
															  <option value="고급">고급</option>
															  <option value="신의경지">신의경지</option>
													</select>
				                       	 	</div>                     
										</nav>               		                              	
									</div>
										<div class="col-md-12">
									      <nav class="navbar navbar-light bg-white navbar-expand-xl">                     
											<div class="form-item w-100">
							         			<label class="form-label my-3">요리시간<sup>*</sup></label>             
			   	                                	<select class="form-select" aria-label="Default select example" name="time" id="time">
			   	                    						  <option selected>요리시간을 선택하세요.</option>
															  <option value="10분이내">10분이내</option>
															  <option value="30분이내">30분이내</option>
															  <option value="1시간이내">1시간이내</option>
															  <option value="2시간이상">2시간이상</option>
													</select>
				                       	 	</div>                     
										</nav>               		                              	
									</div>
								
								
						<hr>
						
									<div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                		<button type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">등록</button>
                            		</div>
 								 </div>
							</div> 
 						 </div>
					</form>
				</div>
			</div>
		</div>
	 </div> 


	<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>
</body>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/commons/files.js"></script>
<script type="text/javascript">
    setMax(5);

  //3. Ckeditor 적용 
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
	 });	
	
   
</script>
</html>
								