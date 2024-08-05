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
</style>
</head>
<body>
	<c:import url="../templete/nav.jsp"></c:import>
	<!-- Hero Start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">recipeAdd</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item"><a href="#">Pages</a></li>
			<li class="breadcrumb-item active text-white">recipeAdd</li>
		</ol>
	</div>
	<div class="container-fluid py-5">
		<div class="container py-5">
			<h1 class="mb-4" style="text-align: center;">recipeAdd</h1>
			<div class="form-container">
				<div class="form-wrapper">
					<form action="#">
						<div class="row g-5">
							<div class="col-12 ">
							
								 <div class="row">
									<div class="col-md-12 col-lg-6">
										<!-- <div class="form-item w-100">  -->
											<label class="form-label my-3">작성자<sup>*</sup></label>
											<input type="text" class="form-control">
										</div>
										
									</div>
									<div class="col-12 ">
										<div class="form-item w-100">
											<label class="form-label my-3">요리명<sup>*</sup></label>
											<input type="text" class="form-control" placeholder="ex) 소고기 미역국끓이기">
										</div>
									</div>
									<div class="col-md-12 ">
										<div class="form-item w-100">
											<label class="form-label my-3">요리소개<sup>*</sup></label>
											<textarea class="form-control" spellcheck="false" placeholder="ex) 남편 생일을 맞아 소고기 미역국을 끓여봤어요~"
											cols="30" rows="11"></textarea>
										</div>
									</div>	
									<div class="col-md-12 col-lg-6">
									      <nav class="navbar navbar-light bg-white navbar-expand-xl">                     
											<div class="form-item w-100">
							         			<label class="form-label my-3">레시피 카테고리<sup>*</sup></label>             
			   	                                	<select class="form-select" aria-label="Default select example">
			   	                    						  <option selected>카테고리를 선택하세요.</option>
															  <option value="1">한식</option>
															  <option value="2">양식</option>
															  <option value="3">중식</option>
															  <option value="4">일식</option>
															  <option value="5">디저트</option>
													</select>
				                       	 	</div>                     
										</nav>               		                              
		               			
								</div>
								
						<hr>
						
									<div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                		<button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">등록</button>
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

<script>

    $("#item_detail").summernote();
</script>
</html>
								