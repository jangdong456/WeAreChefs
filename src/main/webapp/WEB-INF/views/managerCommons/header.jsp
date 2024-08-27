<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main-panel">
  <div class="main-header">
    <!-- Logo Header -->
    <div class="main-header-logo">
      <div class="logo-header" data-background-color="dark">
        <a href="index.html" class="logo">
          <!--&* ì´ê±´ ì svg íì¥ìë¥¼ sourceë¡ íë ê²ì¼ê¹?-->
          <img
            src="/resources/assets/img/kaiadmin/logo_light.svg"
            alt="navbar brand"
            class="navbar-brand"
            height="20"
          />
        </a>
        <!--ì¬ì´ëë° ì¼ìª½ ì¤ë¥¸ìª½ì¼ë¡ ì®ê²¨ì£¼ë ê²-->
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
    </div>
    <!-------------------------------------------------- End Logo Header--------------------------------------------------------------------->

    <!-------------------------------------------------------------- ìë¨ë° -------------------------------------------------------------->
    <!-- Navbar Header -->
    <nav
      class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
    >
      <div class="container-fluid">
        <nav
          class="navbar navbar-header-left navbar-expand-lg  p-0 d-none d-lg-flex"
        >
          <!-- ìë¨ë° ìì¹ ìì´ì½ ë° ì¸í íê·¸-->
          <a href="/manager/index"><h1>Manager</h1></a>
        </nav>
        <ul class="navbar-nav topbar-nav align-items-center">
          <li class="nav-item topbar-icon dropdown hidden-caret">
            <a
              class="nav-link"
              data-bs-toggle="dropdown"
              href="#"
              aria-expanded="false"
            >
            <i class="fas fa-layer-group">User</i>
            </a>
            <div class="dropdown-menu quick-actions animated fadeIn">
              <div class="quick-actions-header">
                <span class="title mb-1">User Page Menu</span>
                <span class="subtitle op-7">Shortcuts</span>
              </div>
              <div class="quick-actions-scroll scrollbar-outer">
                <div class="quick-actions-items">
                  <div class="row m-0">
                    <a class="col-6 col-md-4 p-0" href="/">
                      <div class="quick-actions-item">
                        <div class="avatar-item bg-danger rounded-circle">
                          <i class="fas fa-home"></i>
                        </div>
                        <span class="text">Chefs Home</span>
                      </div>
                    </a>
                    <a class="col-6 col-md-4 p-0" href="/recipe/list">
                      <div class="quick-actions-item">
                        <div
                          class="avatar-item bg-warning rounded-circle"
                        >
                          <i class="fas fa-cookie-bite"></i>
                        </div>
                        <span class="text">Chefs Recipe</span>
                      </div>
                    </a>
                    <a class="col-6 col-md-4 p-0" href="/food/list">
                      <div class="quick-actions-item">
                        <div class="avatar-item bg-info rounded-circle">
                          <i class="fas fa-store"></i>
                        </div>
                        <span class="text">Chefs Shop</span>
                      </div>
                    </a>
                    <a class="col-6 col-md-4 p-0" href="/board/notice/list">
                      <div class="quick-actions-item">
                        <div
                          class="avatar-item bg-success rounded-circle"
                        >
                          <i class="fas fa-bullhorn"></i>
                        </div>
                        <span class="text">User Notice</span>
                      </div>
                    </a>
                    <a class="col-6 col-md-4 p-0" href="/board/fna/list">
                      <div class="quick-actions-item">
                        <div
                          class="avatar-item bg-primary rounded-circle"
                        >
                          <i class="far fa-question-circle"></i>
                        </div>
                        <span class="text">User Fna</span>
                      </div>
                    </a>
                    <a class="col-6 col-md-4 p-0" href="/board/qna/list">
                      <div class="quick-actions-item">
                        <div
                          class="avatar-item bg-secondary rounded-circle"
                        >
                          <i class="fas fa-question"></i>
                        </div>
                        <span class="text">User Qna</span>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>
  <!-------------------------------------------------------------------- End Navbar -------------------------------------------------------------------------------->
