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
            <li class="breadcrumb-item"><a href="./list">Notice</a></li>
            <li class="breadcrumb-item active text-white">Detail</li>
        </ol>
    </div>
    <!-- Single Page Header End -->
    <div class="container-fluid py-5">
    <div class="container py-5">
	    <table class="table">
	        <thead>
		        <tr>
		            <th scope="col">공지번호</th>
		            <th scope="col">회원아이디</th>
		            <th scope="col">공지제목</th>
		            <th scope="col">공지작성일</th>
		            <th scope="col">공지수정일</th>
		        </tr>
	        </thead>
	        <tbody>
	          	<tr>
	          		<th>${noticeDetail.board_num}</th>
	          		<th>${noticeDetail.member_id}</th>
	          		<th>${noticeDetail.board_title}</th>
	          		<th>${noticeDetail.create_date}</th>
	          		<th>${noticeDetail.update_date}</th>
	         	</tr>
	        </tbody>
	    </table>

        <div class="text-center">
       		${noticeDetail.board_content}
			<hr>
		<!-- & Todo Start : 이부분은 관리자 레벨만 보이도록 해야함. -->			
			<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/notice/update?board_num=${noticeDetail.board_num}">Update</a>
			<a class="btn border-secondary rounded-pill px-4 py-3 text-primary" href="/board/notice/delete?board_num=${noticeDetail.board_num}">Delete</a>
		<!-- & Todo Final : 이부분은 관리자 레벨만 보이도록 해야함. -->
        </div>
	</div>
	</div>


<!-- End -->
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
	 });
</script>
</body>
</html>
