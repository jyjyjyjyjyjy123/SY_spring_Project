<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<style>

  .display {
            border-collapse: collapse;
            width: 100%;
        }
        .display th, .display td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        .display th {
            background-color: #f2f2f2;
        }
		
		.button-class:hover {
		    border: 5px solid #5BC1AC; 
		}
		
		.pagebar{
			text-align: center;
		}
		#pagebar {
		    text-align: center;
		}
		
		#searchBtn{
			border: 0;
			background-color: #dadce2;
			color: #424263;
			width: 4em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		
		.sort-btn {
		    background: none;
		    border: none;
		    padding: 0;
		    font: inherit;
		    cursor: pointer;
		    outline: inherit;
		}
		
		/* 구분선 스타일링 */
		.divider {
		    margin: 0 8px;
		    color: #000; /* 구분선 색상 설정 */
		}
				
		
		
</style>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<nav
			class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


			<!-- Page Heading -->
			<div class="col-auto">
				<i class="fas solid fa-list fa-2x text-navy-300"></i>

			</div>
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800 hansans" style="padding-top: 28px;">전체
					목록: </h1>
				<h1 class="h3 mb-0 text-gray-800 hansans" style="padding-top: 28px;">
							${cntDTO.totalCnt}건</h1>
			</div>
		</nav>
		<!-- Content Row -->

		<div class="row">

			<!-- Area Chart -->
			<div class="col-xl-12">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div class="button-container">
							<button type="button" class="sort-btn" id="latestBtn">최신순</button>
							<span class="divider">|</span>
							<button type="button" class="sort-btn" id="dateBtn">날짜순</button>
						</div>

						<h6 class="m-0 font-weight-bold text-primary">총
							${cntDTO.totalCnt}건</h6>
						<form method="GET" action="dispenselist.do" >
							<input type="text" name="word" id="search" class="middle"  required
								placeholder="회원 검색" value="${word}"> <input id ="searchBtn"
								type="submit" value="검색">
						</form>

						
						
						
					</div>

					<table id="dispense" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>제조번호</th>
								<th>병원이름</th>
								<th>환자성명</th>
								<th>연락처</th>
								<th>요청일자</th>
								<th>수령예정일자</th>
								<th>수령방법</th>
								<th>수령일자</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dispenseList}">
								<tr>

									<%-- <td>${dto.dispenseListSeq}</td>
									<td>${dto.hospitalName}</td>
									<td>${dto.userName}</td>
									<td>${dto.userTel}</td>
									<td>${dto.appointmentDate}</td>
									<td>${dto.regdate}</td>
									<td>${dto.pickUpWay}</td>
									<td>${dto.pickUpDate}</td>
									<td>${dto.dispenseStatus}</td> --%>

									<td>${dto.seq}</td>
									<td>${dto.hospitalname}</td>
									<td>${dto.username}</td>
									<td>${dto.usertel}</td>
									<td>${dto.appointmentdate}</td>
									<td>${dto.regdate}</td>
									<td>${dto.pickupway}</td>
									<td>${dto.pickupdate}</td>
									<td>${dto.dispensestatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="pagebar">${pagebar}</div>

				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
	//const pharmacyId = 'sla0623';
	

	$(document).ready(function() {
		$('#latestBtn').on('click', function() {
			location.reload(); // 페이지 새로고침
		});
	});
</script>
