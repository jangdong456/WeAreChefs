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
	<!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Notice</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
<!--             <li class="breadcrumb-item"><a href="N">Pages</a></li>-->
            <li class="breadcrumb-item active text-white">Notice</li>
            <li class="breadcrumb-item active text-white">Add</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
	<form method="post" enctype="multipart/form-data">
		<div>
			<label for="boardTitle" class="">공지 제목</label>
			<input type="text" class="" id="" name="boardTitle">
		</div>
	
	</form>


<!-- End -->
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>	
</body>
</html>
