<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	table {
		margin-left: 20px;
		margin-right: 20px;
		width: 100%;
	}
	
	table td:nth-child(1) { width: 100px; }
	table td:nth-child(2) { width: 100px; }
	table td:nth-child(3) { width: 100px; }
	table td:nth-child(4) { width: 100px; }
	table td:nth-child(5) { width: 100px; }
	table td:nth-child(6) { width: 100px; }

	table tr {
		height: 40px;
		border-bottom: 1px solid #e3e6f0;
	}
	
	table tr:last-child {
		border-bottom: none;
	}
	
	table tr th {
		background-color: #edf0f7;
		text-align: center;
		width: 150px;
		border-right: 1px solid #e3e6f0;
		padding-left: 20px;
		padding-right: 10px;
	}
	
	table tr td {
		text-align: center;
		padding-left: 10px;
		padding-right: 20px;
	}
	
	button {
		border: none;
		border-radius: 5px;
		color: #edf0f7;
		font-size: 1.1rem;
		width: 100px;
		height: 40px;
		margin-right: 10px;
	}
	
	button:hover {
		background-color: #dddfeb;
	}
</style>

<main>
	<div class="phartbl">
		<table class="pharmacy">
			<tr>
				<th id="num">번호</th>
				<th id="id">아이디</th>
				<th id="pharmacyname">약국명</th>
				<th id="ssn">사업자등록번호</th>
				<th id="address">주소</th>
				<th id="regdate">가입 일자</th>
				<th id="status">입점 유무</th>
			</tr>
			<c:forEach items="${pharmacyinfo}" var="dto" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${dto.pharmacyId}</td>
					<td>${dto.pharmacyName}</td>
					<td>${dto.pharmacySSN}</td>
					<td>${dto.pharmacyAddress}</td>
					<td>${dto.regdate}</td>
					<td>${dto.isPharmacyUnregister}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</main>
