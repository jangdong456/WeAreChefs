<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>
	<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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

            .ck.ck-editor {
                max-width: 1000px;
            }

            .ck-editor__editable {
                min-height: 400px;
                max-height: 600px;
            }

            .ck-content {
                font-size: 12px;
            }

            .d-flex.align-items-center h5 {
                margin-right: 5px;
            }

            #replyBtn {
                flex-shrink: 0;
                margin-left: 0;
                padding-left: 5px;
            }

            #starRating fieldset {
                display: inline-block;
                direction: rtl;
                /* 순서 반전 */
                border: 0;
            }

            #starRating fieldset legend {
                text-align: left;
            }

            #starRating input[type=radio] {
                display: none;
            }

            #reviewRating input[type=radio] {
                display: none;
            }

            #starRating label {
                font-size: 2em;
                /* 이모지 크기 */
                color: transparent;
                text-shadow: 0 0 0 #f0f0f0;
            }

            #starRating label:hover {
                text-shadow: 0 0 0 rgb(247, 247, 44);
            }

            #starRating label:hover~label {
                text-shadow: 0 0 0 rgb(247, 247, 44);
                /* 마우스 호버 뒤에오는 이모지들 */
            }

            #starRating input[type=radio]:checked~label {
                text-shadow: 0 0 0 rgb(247, 247, 44);
                /* 마우스 클릭 체크 */
            }


            #tating2 label {
                color: transparent;
                /* 기존 이모지 컬러 제거 */
                text-shadow: 0 0 0 #f0f0f0;

            }
            .ck_rating {
                color: gold;
                font-size: 18px; 
                margin-right: 2px;
            }
            .ck_rating, .n_ck_rating {
                color: gold; 
                font-size: 16px; 
                line-height: 1; 
                vertical-align: middle; 
                margin-right: 1px;
            }

           .n_ck_rating {
                color: rgb(173, 173, 173);
                /* font-size: 18px;  */
                margin-right: 1px;
            }
           

            .d-flex.align-items-center {
                display: flex;
                align-items: center;
                line-height: 90%;
              
            }
            .d-flex #reviewRating {
                margin-left: 2px;
                margin-bottom: 16px;
            }

           
        </style>
     </head>

        <body>
            <c:import url="/WEB-INF/views/templete/nav.jsp"></c:import>
            <div class="container-fluid page-header py-5">
                <h1 class="text-center text-white display-6">레시피 보기</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item active text-white">recipeList</li>
                </ol>
            </div>
            <div class="container-fluid py-5 mt-5 " style="margin-left: 180px;">
                <div class="container py-5">
                    <div class="row g-4 mb-5">
                        <div class="col-lg-8 col-xl-9">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="border rounded position-relative">
                                        <a href="#">
                                            <img src="/resources/upload/recipes/${dto.recipeImgFileDTO.file_name}"
                                                class="img-fluid w-100 rounded-top" alt="">
                                        </a>
                                   
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; left: 10px;">
                                            <img src="/resources/upload/recipes/hit2.png" class="text-white"
                                                style="width:20px; margin-right: 5px;margin-bottom: 2.4px;">
                                            ${dto.recipe_hit}
                                        </div>
                                    </div><br><br>
                                    <div>
	                                    <c:if test="${dto.member_id eq member.member_id}">
		                                     <a href="/recipe/update?recipe_num=${dto.recipe_num}"><button class="btn border-secondary text-uppercase text-primary"
		                                     type="button" >레시피 수정</button></a>
		                                        <a href="/recipe/delete?recipe_num=${dto.recipe_num}"><button class="btn border-secondary text-uppercase text-primary"
		                                     type="button" >레시피 삭제</button></a>
		                                </c:if>
		                                <p>dto.member_id: ${dto.member_id}</p>
<p>member.member_id: ${member.member_id}</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h4 class="fw-bold mb-3">${dto.recipe_name}</h4>
                                    <h6 class="fw-bold mb-3">분류 : ${dto.recipe_category}</h6>
                                    <h6 class="fw-bold mb-3">난이도 : ${dto.recipe_level}</h6>
                                    <h6 class="fw-bold mb-3">소요시간 : ${dto.recipe_time}</h6>
                                    <div class="d-flex mb-4">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p class="mb-4">The generated Lorem Ipsum is therefore always free from repetition
                                        injected humour, or non-characteristic words etc.</p>
                                    <p class="mb-4">Susp endisse ultricies nisi vel quam suscipit. Sabertooth peacock
                                        flounder; chain pickerel hatchetfish, pencilfish snailfish</p>
                                    <div class="input-group quantity mb-5" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <a href="#"
                                        class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> 재료사러가기</a>
                                 
                                </div>
                                <div class="col-lg-12">
                                    <nav>
                                        <div class="nav nav-tabs mb-3">
                                            <!-- id가 nav about  인거 -->
                                            <button class="nav-link active border-white border-bottom-0" type="button"
                                                role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-about" aria-controls="nav-about"
                                                aria-selected="true">Description</button>
                                            <!-- id가 nav-mission 인거 -->
                                            <button class="nav-link border-white border-bottom-0" type="button"
                                                role="tab" id="nav-mission-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-mission" aria-controls="nav-mission"
                                                aria-selected="false">Reviews</button>

                                            <button class="nav-link border-white border-bottom-0" type="button"
                                                role="tab" id="nav-mission2-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-mission2" aria-controls="nav-mission2"
                                                aria-selected="false">Qna</button>
                                        </div>
                                    </nav>
                                    <div class="tab-content mb-5">
                                        <div class="tab-pane active" id="nav-about" role="tabpanel"
                                            aria-labelledby="nav-about-tab">
                                            <h3 style="text-align: center;">레시피 설명</h3>
                                            <br>
                                            <p>The generated Lorem Ipsum is therefore always free from repetition
                                                injected humour, or non-characteristic words etc.
                                                Susp endisse ultricies nisi vel quam suscipit </p>
                                            <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish
                                                snailfish filefish Antarctic
                                                icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish,
                                                electric ray sweeper.</p>

                                        </div>
                                        <!--기본적으로 숨겨져있는 클래스  -->
                                        <!-- 리뷰 -->
                                        <div class="tab-pane" id="nav-mission" role="tabpanel"
                                            aria-labelledby="nav-mission-tab">
                                            <c:forEach items="${ar}" var="ar">
                                                <div class="d-flex">
                                                    <img src="/resources/img/avatar.jpg"
                                                        class="img-fluid rounded-circle p-3"
                                                        style="width: 100px; height: 100px;" alt="">
                                                    <div class="">
                                                        <p class="mb-2" style="font-size: 14px;">${ar.create_date}</p>
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <h5 class="mr-3">${ar.member_id}</h5>
                                                            <div id="reviewRating" class="d-flex">
                                                                <c:choose>
                                                                    <c:when test="${ar.recipe_rating == 1}">
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <input type="radio" name="recipe_rating">
                                                                               <label for="rate1" class="ck_rating">⭐</label>
                                                                            <span class="tating2">
                                                                                <input type="radio" name="recipe_rating">
                                                                                    <label for="rate" class="n_ck_rating">⭐⭐⭐⭐</label>
                                                                            </span>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${ar.recipe_rating == 2}">
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <input type="radio" name="recipe_rating">
                                                                               <label for="rate2"  class="ck_rating">⭐⭐</label>
                                                                            <span class="tating2">
                                                                                <input type="radio" name="recipe_rating">
                                                                                    <label for="rate" class="n_ck_rating">⭐⭐⭐</label>
                                                                            </span>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${ar.recipe_rating == 3}">
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <input type="radio" name="recipe_rating">
                                                                               <label for="rate3"  class="ck_rating">⭐⭐⭐</label>
                                                                            <span class="tating2">
                                                                                <input type="radio" name="recipe_rating">
                                                                                   <label for="rate" class="n_ck_rating">⭐⭐</label>
                                                                            </span>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${ar.recipe_rating ==4}">
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <input type="radio" name="recipe_rating"
                                                                                ><label for="rate4"  class="ck_rating">⭐⭐⭐⭐</label>
                                                                            <span class="tating2">
                                                                                <input type="radio" name="recipe_rating">
                                                                                    <label for="rate" class="n_ck_rating">⭐</label>
                                                                            </span>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${ar.recipe_rating == 5}">
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <input type="radio" name="recipe_rating">
                                                                                <label for="rate5"  class="ck_rating">⭐⭐⭐⭐⭐</label>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="col-lg-12 my-2 reviewRating">
                                                                            <span id="tating2">
                                                                                <input type="radio" name="recipe_rating">
                                                                                    <label class="n_ck_rating"
                                                                                    for="rate">⭐⭐⭐⭐⭐</label>
                                                                            </span>
                                                                        </div>
                                                                    </c:otherwise>

                                                                </c:choose>
                                                            </div>
                                                        </div>


                                                        <p>${ar.board_content}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                            </c:forEach>

                                        </div>
                                        <!-- qna  -->
                                        <div class="tab-pane" id="nav-mission2" role="tabpanel"
                                            aria-labelledby="nav-mission2-tab">
                                            <c:forEach items="${ar2}" var="ar">

                                                <div class="d-flex">
                                                    <img src="/resources/img/avatar.jpg"
                                                        class="img-fluid rounded-circle p-3"
                                                        style="width: 100px; height: 100px;" alt="">
                                                    <div class="replyListParent w-100">

                                                        <input type="hidden"
                                                            class="form-control border-0 me-4 recipe_reply_num"
                                                            value="${ar.recipe_reply_num}" name="recipe_reply_num">

                                                        <p class="mb-2" style="font-size: 14px;">
                                                            ${ar.recipe_reply_num}|| ${ar.create_date}</p>
                                                        <div class="d-flex align-items-center">
                                                            <h5 class="mb-0">${ar.member_id}</h5>
                                                                <button class="btn text-primary rounded-pill replyBtn"
                                                                style="font-size: 14px;">|답글|</button>
                                                            <!--   <div class="button-container"> -->
                                                         
                                                            <!-- </div> -->
                                                        </div>
                                                        <p>${ar.board_content}</p>
                                                       <!--  <div class="replyListParent"> -->
                                                           <%--  <input type="hidden" class="recipe_reply_num" value="${ar.recipe_reply_num}"name="recipe_reply_num">
                                                            <div class="comment" id="comment_1">
                                                            <div class="parentReply">
                                                              <!-- 부모글 내용 -->
                                                            </div>
                                                            <div class="replyList">
                                                              <!-- 자식글이 이곳에 표시 -->
                                                            </div>
                                                            <!-- <button class="replyBtn">답글</button> -->
                                                          </div> --%>
                                                          <div class="comment" id="comment_1">
															    <input type="hidden" class="recipe_reply_num" value="${ar.recipe_reply_num}">
															    <div class="replyList"></div>
															   
															</div>
	                                                          
                                                    <!--  </div> -->
                                                        <!--  답글달림 -->
                                                        <!-- <div class="replyList">



                                                        </div> -->
                                                    </div>
                                                </div>
                                                <hr>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form action="/recipe/review" method="post" id="re_frm">
                                <h4 class="mb-5 fw-bold">review&QnA📌</h4>

                                <div class="row g-4">

                                    <div class="border-bottom rounded">
                                        <input type="hidden" class="form-control border-0 me-4"
                                            value="${dto.recipe_num}" name="recipe_num" id="recipe_num">
                                    </div>
                                    <!-- Review or QnA -->
                                    <div class="col-lg-12">
                                        <div class="col-lg-12">
                                            <label><input type="radio" id="review" name="post_type" value="review"
                                                    checked> Review</label>&nbsp&nbsp&nbsp
                                            <label><input type="radio" id="reply" name="post_type" value="qna">
                                                QnA</label>
                                            <br><br>
                                        </div>
                                    </div>

                                    <label style="margin-bottom: 2px;">별점</label><br>
                                    <div class="col-lg-12 my-2" id="starRating">
                                        <fieldset id="rating">
                                            <input type="radio" name="recipe_rating" value="5" id="rate1"><label
                                                for="rate1">⭐</label>
                                            <input type="radio" name="recipe_rating" value="4" id="rate2"><label
                                                for="rate2">⭐</label>
                                            <input type="radio" name="recipe_rating" value="3" id="rate3"><label
                                                for="rate3">⭐</label>
                                            <input type="radio" name="recipe_rating" value="2" id="rate4"><label
                                                for="rate4">⭐</label>
                                            <input type="radio" name="recipe_rating" value="1" id="rate5"><label
                                                for="rate5">⭐</label>
                                        </fieldset>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                            <input type="text" class="form-control border-0 me-4" placeholder="작성자"
                                                name="member_id">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                            <input type="text" class="form-control border-0" placeholder="제목"
                                                name="board_title">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                            <textarea name="board_content" class="form-control border-0" cols="30"
                                                rows="8" placeholder="내용" spellcheck="false"
                                                name="board_content"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="d-flex justify-content-between py-3 mb-5">
                                            <div class="d-flex align-items-center">

                                            </div>
                                            <button type="button"
                                                class="btn border border-secondary text-primary rounded-pill px-4 py-3"
                                                id="reBtn"> Post Comment</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const starRating = document.getElementById('starRating');
                    const reviewRadio = document.getElementById('review');
                    const replyRadio = document.getElementById('reply');

                    function toggleStarRating() {
                        if (reviewRadio.checked) {
                            starRating.style.display = 'block';
                        } else {
                            starRating.style.display = 'none';
                        }
                    }

                    // Initial check
                    toggleStarRating();

                    // Add event listeners to radio buttons
                    reviewRadio.addEventListener('change', toggleStarRating);
                    replyRadio.addEventListener('change', toggleStarRating);
                });
            </script>

            <c:import url="/WEB-INF/views/templete/footer.jsp"></c:import>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="/resources/lib/easing/easing.min.js"></script>
            <script src="/resources/lib/waypoints/waypoints.min.js"></script>
            <script src="/resources/lib/lightbox/js/lightbox.min.js"></script>
            <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="/resources/js/recipe/recipeDetail.js"></script>
            <script src="/resources/js/recipe/recipeReply.js"></script>
            <!-- Template Javascript -->
            <script src="/resources/js/main.js"></script>

        </body>

        </html>