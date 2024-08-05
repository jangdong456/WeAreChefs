<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<c:forEach items="${foodList}" var="a">
				<div>
				<h1>${a.food_name}</h1>
				</div>
			</c:forEach>
