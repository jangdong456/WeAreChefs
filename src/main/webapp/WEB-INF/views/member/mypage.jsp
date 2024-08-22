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

    .about_me {

        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

    }

    .modal-body input[type="file"] {
        color: black; /* 파일 입력 필드의 텍스트 색상 */
        background-color: white; /* 배경 색상 */
        border: 1px solid #ccc; /* 테두리 색상 */
        padding: 5px; /* 패딩 */
    }

    .about_me {
        text-align : center;
    }

</style>
</head>
<body>
<c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5">
        <div class="container py-5 mt-5">
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <div class="col-xl-3">
                            <div class="input-group w-100 mx-auto d-flex mt-3">
                                <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                            </div>
                        </div>
                        <div class="col-6 mt-3"></div>
                        <div class="col-xl-3">
                            <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4 mt-3">
                                <label for="fruits">Default Sorting:</label>
                                <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                    <option value="volvo">최신순</option>
                                    <option value="saab">오래된순</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        
                                        <!-- <h4>Categories</h4>
                                        <ul class="list-unstyled fruite-categorie">
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                                    <span>(3)</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex justify-content-between fruite-name">
                                                    <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
                                                    <span>(5)</span>
                                                </div>
                                            </li>
                                        </ul> -->

                                        
                                            <!-- <div class="container py-5"> -->
                                                <!-- <div class="row g-4"> -->
                                                    <!-- <div class="col-lg-12"> -->
                                                        <!-- <div class="row g-4"> -->
                                                            <!-- <div class="col-lg-3">
                                                            </div> -->

                                                            <!-- <div class="col-lg-9"> -->
                                                                <!-- <div class="row g-4 justify-content-center">    -->        

                                            <div class="rounded position-relative fruite-item">
                                                <!-- <div class="fruite-img">
                                                    <img src="/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div> -->
                                                <div class="box-1" >
                                                        <c:if test="${member.member_type eq '일반회원'}">
                                                            <c:choose>
                                                                <c:when test="${not empty member.profile_name}">
                                                                   <img src="/resources/upload/member/${member.profile_name}" class="profile" alt="">
                                                               </c:when>
                                                               <c:otherwise>
                                                                   <img src = "/resources/member/img/base.jpg" class="profile">
                                                               </c:otherwise> 
                                                           </c:choose>
                                                        </c:if>
                                                        <c:if test="${member.member_type eq '카카오톡'}">
                                                            <c:choose>
                                                                <c:when test="${not empty member.kakao_profile_img}">
                                                                   <img src="${member.kakao_profile_img}" class="profile" alt="">
                                                               </c:when>
                                                               <c:otherwise>
                                                                   <img src = "/resources/member/img/base.jpg" class="profile">
                                                               </c:otherwise> 
                                                           </c:choose>
                                                        </c:if>
                                                </div>
                                                <div class="text-white px-3 py-1 rounded position-absolute change" style="top: -10px; left: 170px;">

                                                    <!-- 프로필 사진 modal -->
                                                    <a href="#" data-bs-toggle="modal" data-bs-target="#pictureModal">
                                                        <img class="profileChange" src="/resources/member/img/picture.png" style="width: 30px; height: 30px;">
                                                    </a>

                                                    <div class="modal fade" id="pictureModal" tabindex="-1" aria-labelledby="pictureModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="pictureModalLabel">프로필 사진 변경</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>

                                                                
                                                                <div class="modal-body">
                                                                    <form action="/member/profileChange" method="POST" enctype="multipart/form-data">
                                                                        
                                                                        <div class="mb-3">
                                                                                <div class="form-group" id="test">
                                                                                    <label class="form-label mt-3 mr-3" style="color: black;">프로필 사진 변경 : </label>
                                                                                    <input type="file" name="multipartFile">    
                                                                                </div>
                                                                        </div>
                                                                        
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="submit" class="btn btn-primary" id="profile_picture_add" data-member-id="${member.member_id}">등록</button>
                                                                            <button type="button" class="btn btn-danger" id="profile_picture_delete" data-member-id="${member.member_id}">삭제</button>
                                                                        </div>
                                                                    </form>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    
                                                    <!--자기소개 Modal -->
                                                    <div>
                                                        <a href="#" class="" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                            <c:choose>                                                                                                      
                                                                <c:when test="${not empty member.profile_about_me}">
                                                                    <div id="change" class="about_me">
                                                                        ${member.profile_about_me}
                                                                        <br>
                                                                        <c:choose>
                                                                            <c:when test="${not empty member.profile_sns_url}">
                                                                                <a id="modalpage" class="btn border border-secondary rounded-pill px-3 text-primary mt-2" data-bs-toggle="modal" data-bs-target="#SnsModal">
                                                                                    <img src="/resources/member/img/youtube.png" style="width: 40px; height: 40px;">                                                      
                                                                                </a>                                    
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a id="modalpage" class="btn border border-secondary rounded-pill px-3 text-primary mt-2" data-bs-toggle="modal" data-bs-target="#SnsModal">
                                                                                    <img src="/resources/member/img/social.png" style="width: 40px; height: 40px;">
                                                                                    <br>
                                                                                    <label for="fruits">SNS➕</label>
                                                                                </a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                          <!-- SNS Modal -->
                                                                          <div class="modal fade" id="SnsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                              <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <c:choose>
                                                                                        <c:when test="${not empty member.profile_sns_url}">
                                                                                            <input id="snsUrl" type="text" size="50" placeholder="${member.profile_sns_url}" class="ms-3">
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <input id="snsUrl" type="text" size="50" placeholder="개인 SNS URL을 입력해주세요." class="ms-3">
                                                                                        </c:otherwise>
                                                                                    </c:choose>                                                                                
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                  <button type="button" class="btn btn-primary" id="profile_sns_add" data-sns-member_id="${member.member_id}">등록</button>
                                                                                  <button type="button" class="btn btn-danger" id="profile_sns_delete" data-sns-member_id="${member.member_id}">삭제</button>
                                                                                </div>
                                                                              </div>
                                                                            </div>
                                                                          </div>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div id="introduces_text" class="about_me">
                                                                        자기소개서를 등록할 수 있습니다
                                                                        <br>
                                                                        <c:choose>
                                                                            <c:when test="${not empty member.profile_sns_url}">
                                                                                <a id="modalpage" class="btn border border-secondary rounded-pill px-3 text-primary mt-2" data-bs-toggle="modal" data-bs-target="#SnsModal">
                                                                                    <img src="/resources/member/img/youtube.png" style="width: 40px; height: 40px;">                                                                             
                                                                                </a>                                  
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a id="modalpage" class="btn border border-secondary rounded-pill px-3 text-primary mt-2" data-bs-toggle="modal" data-bs-target="#SnsModal">
                                                                                    <img src="/resources/member/img/social.png" style="width: 40px; height: 40px;">
                                                                                    <br>
                                                                                    <label for="fruits">SNS➕</label>
                                                                                </a>      
                                                                            </c:otherwise>
                                                                        </c:choose>                                  
                                                                          <!-- SNS Modal -->
                                                                          <div class="modal fade" id="SnsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                              <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <c:choose>
                                                                                        <c:when test="${not empty member.profile_sns_url}">
                                                                                            <input id="snsUrl" type="text" size="50" placeholder="${member.profile_sns_url}" class="ms-3">
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <input id="snsUrl" type="text" size="50" placeholder="개인 SNS URL을 입력해주세요." class="ms-3">
                                                                                        </c:otherwise>
                                                                                    </c:choose> 
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                  <button type="button" class="btn btn-primary" id="profile_sns_add" data-sns-member_id="${member.member_id}">등록</button>
                                                                                  <button type="button" class="btn btn-danger" id="profile_sns_delete" data-sns-member_id="${member.member_id}">삭제</button>
                                                                                </div>
                                                                              </div>
                                                                            </div>
                                                                          </div>
                                                                    </div>
                                                                </c:otherwise>                                                   
                                                            </c:choose>
                                                        </a>
    
                                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">자기소개 등록 및 변경</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>

                                                                <div class="modal-body">
                                                                    <div class="mb-3">
                                                                        <textarea class="form-control" id="commentContents" rows="3"></textarea>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="button" class="btn btn-primary" id="introduction_add" data_member_id="${member.member_id}">등록</button>
                                                                    <button type="button" class="btn btn-danger" id="introduction_delete" data-member-id="${member.member_id}">삭제</button>
                                                                </div>
                                                            </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                                
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <c:choose>
                                                        <c:when test="${empty member.profile_hit}">
                                                            <a class="btn border border-secondary rounded-pill px-3 text-primary">❤️0</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="btn border border-secondary rounded-pill px-3 text-primary">❤️${member.profile_hit}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>

                                            <!-- div 8개 -->
                                            <!-- </div> -->
                                            <!-- </div> -->
                                            <!-- </div> -->
                                            <!-- </div> -->
                                            <!-- </div> -->
                                            <!-- </div> -->
                                            
                                        

                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <h4 class="mb-3">Featured products</h4>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                            <img src="/resources/img/featur-1.jpg" class="img-fluid rounded" alt="">
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-12">
                                    <div class="position-relative">
                                        <img src="/resources/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                        <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                            <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center"> 
                                    <div class="tab-class text-center">
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

                                                    <c:forEach items="${recipeList}" var="list">


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
                                </div>  
        
                                <div class="tab-content">
                                    <div id="tab-2" class="tab-pane fade show p-0">
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
                                </div>
                                
                                <div class="tab-content">
                                    <div id="tab-3" class="tab-pane fade show p-0">
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
    </div>      
<!-- Fruits Shop End-->

<script src="/resources/member/js/mypage.js"></script>
<c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>       
</body>
</html>