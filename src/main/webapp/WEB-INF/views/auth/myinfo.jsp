<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<body>
	<h2>MyInfo Page <small>내 정보</small></h2>
	
	<!-- 
		property="principal"
		- CustomerUser 객체
	 -->
	 <div class="message" title="principal">
	 	<sec:authentication property="principal"/>
	 </div>
	 <div class="message" title="MemberDTO">
	 	<sec:authentication property="principal.dto"/>
	 </div>
	 <div class="message" title="사용자 이름">
	 	<sec:authentication property="principal.dto.userid"/>
	 	<sec:authentication property="principal.dto.username"/>
	 </div>
	 <div class="message" title="사용자 권한">
	 	<sec:authentication property="principal.dto.authlist"/>
	 </div>
</body>