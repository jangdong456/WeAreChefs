<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Sidebar -->
<div class="sidebar" data-background-color="dark">
  <div class="sidebar-logo">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="dark">
      <a href="index.html" class="logo">
        <img
          src="/resources/assets/img/kaiadmin/logo_light.png"
          alt="navbar brand"
          class="navbar-brand"
          height="20"
        />
      </a>
      <!-- 사이드 바 왼쪽 오른쪽으로 움직이게 하는 것-->
      <div class="nav-toggle">
        <button class="btn btn-toggle toggle-sidebar">
          <i class="gg-menu-right"></i>
        </button>
        <button class="btn btn-toggle sidenav-toggler">
          <i class="gg-menu-left"></i>
        </button>
      </div>
      
      <button class="topbar-toggler more">
        <i class="gg-more-vertical-alt"></i>
      </button>	
    </div>
    <!-- End Logo Header -->
  </div>
  <div class="sidebar-wrapper scrollbar scrollbar-inner">
    <div class="sidebar-content">
      <ul class="nav nav-secondary">
        <!-- 사이드바 DashBoard 활성화 태그 -->
        <!-- 이부분은 nonAdmin 페이지의 상단에 있는 것들의 링크를 걸어주면 좋을 듯-->
        <!--사이드바 DashBoard와 구분해주는 Default 문자인 COMPONENTS를 표시해주는 역할을함-->
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#sidebarLayouts">
            <i class="fas fa-users"></i>
            <p>회원</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="sidebarLayouts">
            <ul class="nav nav-collapse">
              <li>
                <a href="/manager/memberInfo">
                  <span class="sub-item">회원 정보</span>
                </a>
              </li>
            </ul>
          </div>
        </li>

        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#tables">
            <i class="fas fa-exchange-alt"></i>
            <p>주문&배송</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="tables">
            <ul class="nav nav-collapse">
              <li>
                <a href="/manager/orderList">
                  <span class="sub-item">주문&배송 관리</span>
                </a>
              </li>
            </ul>
          </div>
        </li>

        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#forms">
            <i class="fas fa-cubes"></i>
            <p>재고</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="forms">
            <ul class="nav nav-collapse">
              <li>
                <a href="#">
                  <span class="sub-item">재고 현황</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="sub-item">재고 장바구니</span>
                </a>
              </li>
            </ul>
          </div>
        </li>

        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#maps">
            <i class="fas fa-won-sign"></i>
            <p>가계</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="maps">
            <ul class="nav nav-collapse">
              <li>
                <a href="#">
                  <span class="sub-item">가계 현황 표</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <span class="sub-item">가계 현황 차트</span>
                </a>
              </li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<!-- End Sidebar -->