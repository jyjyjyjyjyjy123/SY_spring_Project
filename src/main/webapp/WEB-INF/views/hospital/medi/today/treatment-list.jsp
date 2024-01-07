<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- treatment.jsp -->

<style>
button {
	border: none;
	border-radius: 5px;
	color: #858796;
	cursor: pointer;
	background-color: #edf0f7;
}

button:hover {
	background-color: #dddfeb;
}

.list tr {
	height: 40px;
}

.list tr:hover {
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

.list tr td button:hover {
	background-color: #CCC;
}

.null-msg {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.status {
	color: tomato;
}

.list th:nth-child(1) {
	width: 50px;
}

.list th:nth-child(2) {
	width: 80px;
}

.list th:nth-child(3) {
	width: 100px;
}

.list th:nth-child(4) {
	width: 100px;
}

.list th:nth-child(5) {
	width: 120px;
}

.list th:nth-child(6) {
	width: 100px;
}

.list th:nth-child(7) {
	width: 600px;
}

.list th:nth-child(8) {
	width: 200px;
}

.list th:nth-child(9) {
	width: 110px;
}

.list th:nth-child(10) {
	width: 120px;
}

.list td:nth-child(7) {
	padding-left: 10px;
	text-align: left;
}

.pagebar {
	text-align: center;
	margin-top: 20px;
	/* margin-bottom: 20px; */
	font-size: 1.1rem;
}

.pagebar>a {
	color: #858796;
}

.gray-font {
	color: #CCC;
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
					<h5 class="m-0 font-weight-bold text-primary">오늘의 진료</h5>
					<h5 class="today-date m-0 text-primary"></h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
				
					<table id="today-treatment-list" class="list">
						<thead></thead>
						<tbody></tbody>
					</table>
					
					<!-- 페이지바 -->
					<div class="pagebar"></div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>
	
	//const hospitalId = 'yonse';
	
	//화면 초기화
	load(${page});
	
	function load(pageNum){
		$.ajax({
			type: 'GET',
			url: '/apa/api/hospital/${id}/medi/today/treatment',
			contentType: 'application/json',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
             },
			data: {page: pageNum},
			dataType: 'json',
			success: result => {
				
				//사이드바 css설정
				$('#side-main-today > a').addClass('collapsed');
				$('#side-main-today > a').css('background-color', '#dddfeb');
				$('#side-main-today > a').attr('aria-expanded', 'true');
				$('#side-main-today > div').addClass('show');
				$('#side-sub-today-treatment').css('background-color', '#dddfeb');				
				
				
				//기존 내용 삭제
				$('.list thead').html(''); 
				$('.list tbody').html('');
				$('.pagebar').html('');
				$('.today-date').html('');

				
				//오늘 날짜 생성
				let today = new Date();
				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				
				$('.today-date').append('[ ' + year + '년 ' + month + '월 ' + date + '일 ]');
				
				
				if (result.list.length != 0) {
					
					//예약이 있을 경우
					
					// thead
					const theadData = `
						<tr>
							<th>번호</th>
							<th>예약번호</th>
							<th>환자</th>
							<th>진료방식</th>
							<th>진료과목</th>
							<th>의사</th>
							<th>상세증상</th>
							<th>예약시간</th>
							<th>진행상태</th>
							<th>변경</th>
						</tr>
					`;
					
					$('.list thead').append(theadData);
					
					
					$(result.list).each((index, item) => {
						
						// tbody
						let tbodyData = `
							<tr onclick="location.href='/apa/hospital/\${item.hospitalId}/medi/today/treatment/\${item.appointmentSeq}';">
								<td>\${item.rnum}</td>
								<td>\${item.appointmentSeq}</td>
						`;
						
						if (item.childName == null) {
							tbodyData += `<td>\${item.userName}</td>`;
						} else {
							tbodyData += `<td>\${item.childName}</td>`;
						}
						
						tbodyData += `
							<td>\${item.treatmentWay}</td>
							<td>\${item.departmentName}</td>
							<td>\${item.doctorName}</td>
						`;
						
						if (item.symptom == null) {
							tbodyData += `
								<td class="gray-font">(미작성)</td>
							`;
						} else {
							tbodyData += `
								<td>\${item.symptom}</td>
							`;
						}
						
						tbodyData += `<td>\${item.appointmentDate}</td>`;
						
						if (item.status == '진료대기') {
							
							tbodyData += `
								<td>\${item.status}</td>
								<td><button type="button" name="btnCallPatient" id="btnCallPatient"
									onclick="callPatient(\${item.appointmentSeq});">환자호출</button></td></tr>
							`;
							
						} else if (item.status == '진료중') {
							
							tbodyData += `
								<td class="status">\${item.status}</td>
								<td><button type="button" name="btnComplete" id="btnComplete"
									onclick="completeTreatment('\${item.treatmentWay}', '\${item.appointmentSeq}');">진료완료</button></td></tr>
							`;
							
						} else if (item.status == '진료완료') {
							
							tbodyData += `
								<td class="gray-font">\${item.status}</td>
								<td></td></tr>
							`;
						}
							
						$('.list tbody').append(tbodyData);
					});
					
					// pagebar
					$('.pagebar').html(result.pagebar);
					
				} else {
					
					//예약이 없을 경우
					
					const nullMessage = `<h4 class="null-msg">오늘 신청된 진료가 없습니다.</h4>`;
					
					$('.card-body').append(nullMessage);
					
				}
			},
			error: (a, b, c) => {
				console.log(a, b, c);
			}
		});
	}

	
	function callPatient(appointmentSeq) {
		if (confirm('환자를 호출하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${id}/medi/today/treatment/' + appointmentSeq,
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
				data: JSON.stringify({action: 'call'}),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						alert('환자를 호출하였습니다.');
						
						load(1);
						
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
		
		event.stopPropagation();
	}
	
	function completeTreatment(treatmentWay, appointmentSeq) {
		
		if (treatmentWay == '대면' || treatmentWay == '비대면') {
			
			if (confirm('진료를 완료하시겠습니까? 확인을 누르시면 진료내역서를 작성합니다.')) {
				
				location.href='/apa/hospital/${id}/medi/today/treatment/' + appointmentSeq + '/record';
			}
			
		} else { // 예방접종과 건강검진 경우. 진료내역서 미작성
		
			if (confirm('진료를 완료하시겠습니까?')) {
				
				// 진행상태만 진료완료로 변경하기
				$.ajax({
					type: 'PUT',
					url: '/apa/api/hospital/${id}/medi/today/treatment/' + appointmentSeq,
					contentType: 'application/json',
					beforeSend : function(xhr) {
	                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	                 },
					data: JSON.stringify({action: 'complete'}),
					dataType: 'json',
					success: result => {
						if (result == 1) {
							
							alert('진료를 완료하였습니다.');
							
							load(1);
							
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
		
		event.stopPropagation();
	}
</script>