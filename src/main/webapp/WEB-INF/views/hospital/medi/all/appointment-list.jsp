<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
button {
	border: 1px solid #CCC;
	border-radius: 5px;
	color: #858796;
}

button:hover {
	background-color: #ccc;
}

select:hover {
	cursor: pointer;
}

.list tr {
	height: 40px;
}

.list tbody tr:hover {
	cursor: pointer;
	background-color: #dddfeb;
}

.list th {
	text-align: center;
	border-right: 1px solid #CCC;
}

.list tr:first-child th {
	background-color: #edf0f7;
}

.list td {
	border-bottom: 1px solid #edf0f7;
	border-right: 1px solid #edf0f7;
	text-align: center;
}

.list th:last-child, .list td:last-child {
	border-right: none;
}

.null-msg {
	text-align: center;
}

.list th:nth-child(1) {
	width: 50px;
}

.list th:nth-child(2) {
	width: 100px;
}

.list th:nth-child(3) {
	width: 100px;
}

.list th:nth-child(4) {
	width: 100px;
}

.list th:nth-child(5) {
	width: 100px;
}

.list th:nth-child(6) {
	width: 230px;
}

.list th:nth-child(7) {
	width: 100px;
}

.list th:nth-child(8) {
	width: 600px;
}

.list th:nth-child(9) {
	width: 250px;
}

.list th:nth-child(10) {
	width: 70px;
}

.list td:nth-child(8) {
	padding-left: 10px;
	text-align: left;
}

.waiting {
	color: tomato;
}

.pagebar {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 20px;
	font-size: 1.1rem;
}

.pagebar>a {
	color: #858796;
}

.gray-font {
	color: #CCC;
}

/* #search {
	border: 1px solid #CCC;
} */
.sel-appointment-order-area {
	display: flex;
}

.sel-appointment-order-inner-area {
	margin-left: auto;
	margin-bottom: 10px;
}

#sel-appointment-order {
	border: 1px solid #CCC;
}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-12 col-lg-7 rgst-div">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">모든 예약 내역</h5>
					<!-- <div>
						<input type="text" name="search" id="search">
						<button type="button">
							<i class="fas fa-search"></i>
						</button>
					</div> -->
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<c:if test="${appointmentList.size() == 0}">
						<h4 class="null-msg">오늘 신청된 예약이 없습니다.</h4>
					</c:if>

					<c:if test="${appointmentList.size() != 0}">
						<div class="sel-appointment-order-area">
							<div class="sel-appointment-order-inner-area">
								<select id="sel-appointment-order"
									onchange="handleOrderChange();">
									<c:if test="${order == 'old-regdate'}">
										<option value="old-regdate" selected>오래된 신청일순</option>
										<option value="last-regdate">최근 신청일순</option>
									</c:if>
									<c:if test="${order == 'last-regdate'}">
										<option value="old-regdate">오래된 신청일순</option>
										<option value="last-regdate" selected>최근 신청일순</option>
									</c:if>
								</select>
							</div>
						</div>
					</c:if>


					<table id="appointment-all-list" class="list">
						<thead>
							<c:if test="${appointmentList.size() != 0}">
								<tr>
									<th>번호</th>
									<th>예약번호</th>
									<th>접수자</th>
									<th>환자</th>
									<th>진료방식</th>
									<th>예약일시</th>
									<th>의사</th>
									<th>상세증상</th>
									<th>신청일시</th>
									<th>상태</th>
								</tr>
							</c:if>
						</thead>

						<tbody>
							<c:forEach items="${appointmentList}" var="dto">
								<tr
									onclick="location.href='/apa/hospital/${dto.hospitalId}/medi/all/appointment/${dto.appointmentSeq}';">
									<td>${dto.rnum}</td>
									<td>${dto.appointmentSeq}</td>
									<td>${dto.userName}</td>
									<c:if test="${dto.childName != null}">
										<td>${dto.childName}</td>
									</c:if>
									<c:if test="${dto.childName == null}">
										<td class="gray-font">(접수자)</td>
									</c:if>
									<td>${dto.treatmentWay}</td>
									<td>${dto.appointmentDate}</td>
									<td>${dto.doctorName}</td>
									<c:if test="${dto.symptom == null}">
										<td class="gray-font">(미작성)</td>
									</c:if>
									<c:if test="${dto.symptom != null}">
										<td>${dto.symptom}</td>
									</c:if>
									<td>${dto.regdate}</td>
									<c:if test="${dto.status == '대기'}">
										<td class="waiting">${dto.status}</td>
									</c:if>
									<c:if test="${dto.status == '승인'}">
										<td>${dto.status}</td>
									</c:if>
									<c:if test="${dto.status == '거절'}">
										<td class="gray-font">${dto.status}</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<c:if test="${appointmentList.size() != 0}">
						<!-- 페이지바 -->
						<div class="pagebar">${pagebar}</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>
	//const hospitalId = 'yonse';

	//사이드바 css설정
	$('#side-main-all > a').addClass('collapsed');
	$('#side-main-all > a').css('background-color', '#dddfeb');
	$('#side-main-all > a').attr('aria-expanded', 'true');
	$('#side-main-all > div').addClass('show');
	$('#side-sub-all-appointment').css('background-color', '#dddfeb');

	function handleOrderChange() {
		const selectedValue = $('#sel-appointment-order').val();

		location.href = '/apa/hospital/${id}/medi/all/appointment?page=1&order='
				+ selectedValue;
	}
</script>