<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


                                          <c:forEach items="${list}" var="a">
		                                    <div class="col-md-6 col-lg-6 col-xl-4">
		                                        <div class="rounded position-relative fruite-item">
		                                           
		                                            <div class="fruite-img">
		                                                <img src="/resources/upload/foods/${a.storeImgFileDTO.file_name}" class="img-fluid w-100 rounded-top image-thumbnail" alt="" width="500" height="350">
		                                            </div>
		                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${a.food_category}</div>
		                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
		                                                <h4>${a.food_name}</h4>  
		                                                <div class="d-flex justify-content-between flex-lg-wrap">
		                                                    <p class="text-dark fs-5 fw-bold mb-0">${a.food_price}</p>
		                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>둘러보기</a>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
                                    	</c:forEach>
