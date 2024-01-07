<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	
	<div class="maindiv"  style="text-align: center;">
		<h4>${username}님 예약이 완료 됐습니다.
			<br>예약 확정까지는 최대 10분정도 걸릴 수 있으니 양해 부탁드립니다.
				
			<br>예약 현황은 마이페이지 내에서 확인하실 수 있습니다
			<br>확인하시겠습니까?
		</h4>
		<div>
			<a href="/apa/main.do">
				<button class="custom-btn custom-border-btn btn">바로가기</button>
			</a>
			<a href="/apa/main.do">
				<button class="custom-btn custom-border-btn btn">메인페이지</button>
			</a>
		</div>
	</div>
	
	<script>
		
	</script>
</body>