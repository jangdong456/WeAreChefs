<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<c:import url="/WEB-INF/views/templete/header.jsp"></c:import>
<title>Insert title here</title>
<style>
    p {
        width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        height: 20px;
    }

    h4 {
        width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        height: 50px;
    }
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

	<h1>${member.member_id}</h1>

        <!-- Fruits Shop Start-->
    <c:if test="${not empty member}"></c:if>
        <div class="container-fluid fruite py-5">
        <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                <span class="text-dark" style="width: 130px;">레시피 리스트</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 130px;">요리 후기 리스트</span>
                            </a>
                        </li>
    
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                <span class="text-dark" style="width: 130px;">댓글 리스트</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- id 값이 tab-1 tab-2 tab-3 으로  탭을 눌렀을 때 어떠한 리스트들이 올지 정해진다 -->
            
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <c:forEach items="${list}" var="list">
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
                                                <a href="#" style="margin-left:18%" class="btn border border-secondary rounded-pill px-3 text-primary">🧑‍🍳레시피보러가기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-content">
            <div id="tab-2" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <c:forEach items="${recipeReply}" var="reply">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="rounded position-relative fruite-item">
                                    <div class="fruite-img">
                                        <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                        <h4>${reply.board_title}</h4>
                                        <p id="test">${reply.board_content}</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <a href="#" style="margin-left:18%" class="btn border border-secondary rounded-pill px-3 text-primary">작성한 요리후기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                    </div>
                </div>
            </div>
        </div>




        <div class="tab-content">
            <div id="tab-3" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <c:forEach items="${reviewList}" var="review">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div class="rounded position-relative fruite-item">
                                    <div class="fruite-img">
                                        <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                        <h4>${review.board_title}</h4>
                                        <p id="test">${review.board_content}</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <a href="#" style="margin-left:18%" class="btn border border-secondary rounded-pill px-3 text-primary">작성한 댓글보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 마이프로필 -->
        <!-- <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-lg-12">

                        <div class="row g-4">
                            <div class="col-lg-3">

                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                
                                                <div> -->
                                                    <!-- Modal -->
                                                    <!-- <a href="#" class="" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    <c:choose>                                                                                                      
                                                        <c:when test="${not empty member.profile_about_me}">
                          									<div id="change">
                                                            	${member.profile_about_me}
                                                        	</div>
                                                        </c:when>
                                                        <c:otherwise>
                                                       		<div id="introduces_text">
                                                            	자기소개서를 등록할 수 있습니다
                                                        	</div>
                                                        </c:otherwise>                                                   
 													</c:choose>

                                                    </a>

                                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3">
                                                                    <textarea class="form-control" id="commentContents" rows="3"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary" id="introduction_add" data-member-id="${member.member_id}">등록</button>
                                                            <button type="button" class="btn btn-danger" id="introduction_delete" data-member-id="${member.member_id}">삭제</button>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="btn btn-primary text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <a href="#" class="rounded">&laquo;</a>
                                            <a href="#" class="active rounded">1</a>
                                            <a href="#" class="rounded">2</a>
                                            <a href="#" class="rounded">3</a>
                                            <a href="#" class="rounded">4</a>
                                            <a href="#" class="rounded">5</a>
                                            <a href="#" class="rounded">6</a>
                                            <a href="#" class="rounded">&raquo;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Fruits Shop End-->
<script src="/resources/member/js/mypage.js"></script>
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>       
</body>
</html>