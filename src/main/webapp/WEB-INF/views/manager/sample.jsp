<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<c:import url="/WEB-INF/views/managerCommons/cssScript.jsp" ></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
	<c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
	<div class="container">
		<div class="page-inner">
	<!--@@@@@@@@@------------------------- 시작 ----------------------------------------------->
	        <div class="page-header">
	          <h3 class="fw-bold mb-3">어떤 페이지인지</h3>
	          <ul class="breadcrumbs mb-3">
	            <li class="nav-home">
	              <a href="/manager/index">
	                <i class="icon-home"></i>
	              </a>
	            </li>
	            <li class="separator">
	              <i class="icon-arrow-right"></i>
	            </li>
	            <li class="nav-item">
	              <a href="#">어디의</a>
	            </li>
	            <li class="separator">
	              <i class="icon-arrow-right"></i>
	            </li>
	            <li class="nav-item">
	              <a href="#">어디인지</a>
	            </li>
	          </ul>
	        </div>


	<!--@@@@@@@@@-------------------------- 끝 ----------------------------------------------->
		</div>
	</div>
	<!-- index 밑에 있어야 한느 것들임..-->
	<c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>


</body>
</html>
