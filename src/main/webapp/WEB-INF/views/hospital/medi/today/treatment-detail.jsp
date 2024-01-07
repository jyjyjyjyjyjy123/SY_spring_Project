<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- treatment.jsp -->

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

#diagnosisTitle {
	font-weight: bold;
	margin: 70px 0 20px 20px;
}

#detailTitle, #detail-treatmentseq {
	font-weight: bold;
	margin: 20px 0 20px 20px;
}

#detail-treatmentseq {
	border-bottom: 1px solid #ccc;
	margin-right: 20px;
	padding-bottom: 10px;
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

.status {
	color: tomato;
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
					<h5 class="m-0 font-weight-bold text-primary">진료 상세 내역&nbsp;&nbsp;&nbsp;&nbsp;</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div id="container">
						<%-- <h5 id="detail-treatmentseq">예약 번호: ${dto.appointmentSeq}</h5> --%>
						<h5 id="detail-treatmentseq">[ 예약 번호: ${dto.appointmentSeq} ]</h5>
						<h5 id="detailTitle">진료 정보</h5>
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
									<th>전화번호</th>
									<td>${dto.userTel}</td>
								</tr>
								<tr>
									<th>주민등록번호</th>
									<td>${dto.userSSN}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${dto.userAddress}</td>
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
							<tr>
							</tr>
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
									<td>
										${dto.symptom}
									</td>
								</c:if>
								<c:if test="${dto.symptom == null}">
									<td class="symptomNull">
										(미작성)
									</td>
								</c:if>
							</tr>
							<tr>
							</tr>
							<tr>
								<th>신청일시</th>
								<td>${dto.regdate}</td>
							</tr>
							<tr>
								<th>진행 상태</th>
								<c:if test="${dto.status == '진료중'}">
									<td class="status">
										${dto.status}
									</td>
								</c:if>
								<c:if test="${dto.status != '진료중'}">
									<td>${dto.status}</td>
								</c:if>
							</tr>

						</table>

						<!-- 대면, 비대면만 진료내역서를 작성한다. 아닌 경우에는 진료내역서를 출력하지 않는다. -->
						<c:if
							test="${(dto.treatmentWay == '대면' || dto.treatmentWay == '비대면') && dto.status == '진료완료'}">
							<h5 id="diagnosisTitle">진료내역서</h5>

							<table>
								<tr>
									<th>진료내역서 번호</th>
									<td>${dto.recordSeq}</td>
								</tr>
								<tr>
									<th>병원명</th>
									<td>${dto.hospitalName}</td>
								</tr>
								<tr>
									<th>의사명</th>
									<td>${dto.doctorName}</td>
								</tr>
								<tr>
									<th>진단명</th>
									<td>${dto.diagnosis}</td>
								</tr>
								<tr>
									<th>질병코드</th>
									<td>${dto.diseaseCode}</td>
								</tr>
								<tr>
									<th>진료내용</th>
									<td>${dto.recordContent}</td>
								</tr>

							</table>
						</c:if>

						<div id="btnArea">
							<c:if test="${dto.status != '진료완료'}">
								<c:if test="${dto.status == '진료대기'}">
									<button type="button"
										onclick="callPatient();">환자호출</button>
								</c:if>

								<c:if test="${dto.status == '진료중'}">
									<button type="button"
										onclick="completeDiagnosis('${dto.treatmentWay}');">진료완료</button>
								</c:if>
							</c:if>

							<button type="button"
								onclick="location.href='/apa/hospital/${dto.hospitalId}/medi/today/treatment';">뒤로가기</button>
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
	$('#side-sub-today-treatment').css('background-color', '#dddfeb');	

	function callPatient() {
		if (confirm('환자를 호출하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${dto.hospitalId}/medi/today/treatment/${dto.appointmentSeq}',
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
				data: JSON.stringify({action: 'call'}),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						alert('환자를 호출하였습니다. 목록으로 돌아갑니다.');
						
						location.href='/apa/hospital/${dto.hospitalId}/medi/today/treatment'; //목록으로 돌아가기
						
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
	
	function completeDiagnosis(treatmentWay) {
		
		if (treatmentWay == '대면' || treatmentWay == '비대면') {
			
			if (confirm('진료를 완료하시겠습니까? 확인을 누르시면 진료내역서를 작성합니다.')) {
				
				location.href='/apa/hospital/${dto.hospitalId}/medi/today/treatment/${dto.appointmentSeq}/record';
			}
			
		} else { // 예방접종과 건강검진은 진료내역서 미작성
		
			if (confirm('진료를 완료하시겠습니까?')) {
				
				// 진행상태만 진료완료로 변경하기
				$.ajax({
					type: 'PUT',
					url: '/apa/api/hospital/${dto.hospitalId}/medi/today/treatment/${dto.appointmentSeq}',
					contentType: 'application/json',
					beforeSend : function(xhr) {
	                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	                 },
					data: JSON.stringify({action: 'complete'}),
					dataType: 'json',
					success: result => {
						if (result == 1) {
							alert('진료를 완료하였습니다. 목록으로 이동합니다.');
							
							location.href='/apa/hospital/${dto.hospitalId}/medi/today/treatment'; //목록으로 이동
							
						} else {
							alert('0');
						}
					},
					error: (a, b, c) => {
						console.log(a, b, c);
					}
				});
				
			}
		}
		
	}

</script>