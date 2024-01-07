<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- appointment.jsp -->
<style>
button {
	border: none;
	border-radius: 5px;
	color: #858796;
	font-size: 1.1rem;
	width: 100px;
	height: 40px;
	margin-right: 10px;
	background-color: #edf0f7;
}

button:hover {
	background-color: #dddfeb;
}

#btnArea {
	margin: 10px auto;
	margin-top: 30px;
}

#detail-appointmentseq {
	font-weight: bold;
	margin: 20px 0 20px 20px;
}

table {
	margin-left: 20px;
	margin-right: 20px;
}

table tr {
	height: 40px;
	border-bottom: 1px solid #e3e6f0;
}

table tr:last-child {
	border-bottom: none;
}

table tr th {
	width: 150px;
	border-right: 1px solid #e3e6f0;
	padding-left: 20px;
	padding-right: 10px;
}

table tr td {
	padding-left: 10px;
	padding-right: 20px;
}

#container {
	display: flex;
	flex-direction: column;
}

.symptomNull {
	color: #CCC;
}

.waiting {
	color: tomato;
}

#detail-appointmentseq {
	font-weight: bold;
	margin: 20px 0 20px 20px;
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
					<h5 class="m-0 font-weight-bold text-primary">예약 상세 내역</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div id="container">
						<h5 id="detail-appointmentseq">예약 번호: ${dto.appointmentSeq}</h5>
						<table>
							<c:if test="${dto.childSeq == null}">
								<tr>
									<th>환자 번호</th>
									<td>${dto.userSeq}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${dto.userName}</td>
								</tr>
								<tr>
									<th>주민등록번호</th>
									<td>${dto.userSSN}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${dto.userAddress}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${dto.userTel}</td>
								</tr>
							</c:if>

							<c:if test="${dto.childSeq != null}">
								<tr>
									<th>접수자 번호</th>
									<td>${dto.userSeq}</td>
								</tr>
								<tr>
									<th>접수자 이름</th>
									<td>${dto.userName}</td>
								</tr>
								<tr>
									<th>환자와의 관계</th>
									<td>${dto.userRelation}</td>
								</tr>
								<tr>
									<th>접수자 전화번호</th>
									<td>${dto.userTel}</td>
								</tr>
								<tr>
									<th>접수자 주소</th>
									<td>${dto.userAddress}</td>
								</tr>
								<tr>
									<th>환자 번호</th>
									<td>${dto.childSeq}</td>
								</tr>
								<tr>
									<th>환자 이름</th>
									<td>${dto.childName}</td>
								</tr>
								<tr>
									<th>환자 주민등록번호</th>
									<td>${dto.childSSN}</td>
								</tr>
							</c:if>
							
							<tr></tr>
							
							<tr>
								<th>예약일시</th>
								<td>${dto.appointmentDate}</td>
							</tr>
							<tr>
								<th>진료방식</th>
								<td>${dto.treatmentWay}</td>
							</tr>
							<tr>
								<th>진료과목</th>
								<td>${dto.departmentName}</td>
							</tr>
							<tr>
								<th>의사</th>
								<td>${dto.doctorName}</td>
							</tr>
							<tr>
								<th>상세증상</th>
								<c:if test="${dto.symptom != null}">
									<td>${dto.symptom}</td>
								</c:if>
								<c:if test="${dto.symptom == null}">
									<td class="symptomNull">(미작성)</td>
								</c:if>
							</tr>
							
							<tr></tr>
							
							<tr>
								<th>신청일시</th>
								<td>${dto.regdate}</td>
							</tr>
							<tr>
								<th>예약 상태</th>
								<c:if test="${dto.status == '대기'}">
									<td class="waiting">${dto.status}</td>
								</c:if>
								<c:if test="${dto.status != '대기'}">
									<td>${dto.status}</td>
								</c:if>
							</tr>

						</table>

						<div id="btnArea">
							<button type="button" name="btnApproval" id="btnApproval"
								onclick="approveAppointment();">승인</button>
							<button type="button" name="btnDecline" id="btnDecline"
								onclick="declineAppointment();">거절</button>
							<button type="button"
								onclick="location.href='/apa/hospital/${dto.hospitalId}/medi/today/appointment';">뒤로가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>
		
	//사이드바 css설정
	$('#side-main-today > a').addClass('collapsed');
	$('#side-main-today > a').css('background-color', '#dddfeb');
	$('#side-main-today > a').attr('aria-expanded', 'true');
	$('#side-main-today > div').addClass('show');
	$('#side-sub-today-appointment').css('background-color', '#dddfeb');

	function approveAppointment() {
		
		if (confirm('예약을 승인하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${dto.hospitalId}/medi/today/appointment/${dto.appointmentSeq}',
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
				data: JSON.stringify({ action: 'approve' }),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						
						alert('예약을 승인하였습니다.');
						
						location.href='/apa/hospital/${dto.hospitalId}/medi/today/appointment';//목록으로 이동
						
					} else {
						alert('0');
					}
				}, 
				error: function(a, b, c) {
					console.log(a, b, c);
					console.error(a.responseText);
				}
			});
		}
	}
	
	function declineAppointment() {
		if(confirm('예약을 거절하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${dto.hospitalId}/medi/today/appointment/${dto.appointmentSeq}',
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
				data: JSON.stringify({ action: 'decline' }),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						alert('예약을 거절하였습니다.');
						
						location.href='/apa/hospital/${dto.hospitalId}/medi/today/appointment'; //목록으로 돌아가기
						
					} else {
						alert('0');
					}
				}, 
				error: function(a, b, c) {
					console.log(a, b, c);
					console.error(a.responseText);
				}
			});
		}
	}
</script>