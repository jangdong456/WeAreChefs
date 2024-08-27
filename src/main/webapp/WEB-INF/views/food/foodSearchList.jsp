<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="mt-3">
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="a" varStatus="i">
						<h5><a href="#none" class="nameList" data-name="${a.food_name}"
								data-category="${a.food_category}" data-stock="${a.food_stock}"
								data-price="${a.food_price}" data-num="${a.food_num}">-${a.food_name}</a></h5>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h5>검색 결과가 없습니다.</h5>
				</c:otherwise>
			</c:choose>
		</div>