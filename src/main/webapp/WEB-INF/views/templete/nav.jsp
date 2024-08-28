<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Spinner Start -->
        <div id="spinner"
            class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i>
                            금천구 가산디지털2로 95,서울</small>
                        <small class="me-3"><i
                                class="fas fa-envelope me-2 text-secondary"></i>jangdong456@gmail.com</a></small>
                    </div>
                    <c:choose>
                        <c:when test="${not empty member}">
                            <div class="top-link pe-2">
                                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                                <a href="/member/logout" class="text-white"><small
                                        class="text-white ms-2">로그아웃</small></a>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div class="top-link pe-2">
                                <a href="/member/join" class="text-white"><small
                                        class="text-white mx-2">회원가입</small>/</a>
                                <a href="/member/login" class="text-white"><small
                                        class="text-white ms-2">로그인</small></a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">We Are Chefs</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/" class="nav-item nav-link active">Home</a>
                            <a href="/recipe/list" class="nav-item nav-link">레시피</a>
                            <a href="/food/list" class="nav-item nav-link">스토어</a>
                            <a href="/board/notice/list" class="nav-item nav-link">공지사항</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">질문과 답변</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/board/fna/list" class="dropdown-item">FnA</a>
                                    <a href="/board/qna/list" class="dropdown-item">QnA</a>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <!-- &*TOdo 매니저 레벨만 보이도록 하기 -->
                            <c:if test="${member.member_id=='12341234'}">
                                <a href="/manager/index" class="nav-item nav-link">Manager</a>
                            </c:if>
                            <c:if test="${not empty member&&member.member_id!='12341234'}">
                                <a href="/food/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${cartCount}</span>
                                </a>
                            </c:if>
                            <!-- mypage filter 걸어놔서 세션저장된 값 없으면 -> 로그인페이지로 이동 -->
                            <c:if test="${not empty member&&member.member_id!='12341234'}">
                                <a href="/member/mypage" class="my-auto">
                                    <i class="fas fa-user fa-2x"></i>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->