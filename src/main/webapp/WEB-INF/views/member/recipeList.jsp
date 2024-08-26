<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <a href="/member/mypage?page=${pager.startNum-1}&order=${pager.order}" class="rounded ${pager.pre?'':'disabled'}" >&laquo;</a>
        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
            <a href="/member/mypage?page=${i}&order=${pager.order}" class="rounded">${i}</a>
        </c:forEach>
        <a href="/member/mypage?page=${pager.startNum-1}&order=${pager.order}" class="rounded ${pager.next?'':'disabled'}">&raquo;</a>
    </div>
</div>  