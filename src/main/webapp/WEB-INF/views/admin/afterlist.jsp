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
	
	table tr:hover, button:hover {
		background-color: #dddfeb;
	}
</style>
<main>

	<table>
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>부정 태그 비율</th>
			<th>가입 일자</th>
			<th>탈퇴유무</th>
			<th>처리현황</th>
		</tr>
 		<c:forEach items="${afterlist}" var="dto" varStatus="status">
		<tr onclick="location.href='/apa/admin/afterview.do?hospitalId=${dto.hospitalId}';">
			<td>${status.count}</td>
			<td>${dto.hospitalId}</td>
			<td>${dto.hospitalName}</td>
			<td>${dto.negativePercentage}%</td>
			<td>${dto.hospitalJoinDate}</td>
			<td>${dto.isHospitalUnregister}</td>
			<td>${dto.isHospitalUnregister == 'n' ? '완료' : '대기'}</td>
		</tr>
		</c:forEach>
	
	</table>
	
</main>

<script>
	function blacklistaddview() {
		location.href = "/apa/admin/blacklistadd.do";
	}
</script>