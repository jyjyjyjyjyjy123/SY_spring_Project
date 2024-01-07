<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<!--  
		*** 주의
		1. method="POST"
		2. action="/컨텍스트명/로그아웃 페이지"
	-->
	<form action="/apa/auth/mylogout.do" method="POST">
		<div>
			<button class="in">로그아웃</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>