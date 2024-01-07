<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- appointment.jsp -->

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
	width: 110px;
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
	width: 260px;
}

.list th:nth-child(10) {
	width: 150px;
}

.list td:nth-child(8) {
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
					<h5 class="m-0 font-weight-bold text-primary">오늘의 예약</h5>
					<h5 class="today-date m-0 text-primary"></h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">

					<table class="list">
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
			url: '/apa/api/hospital/${id}/medi/today/appointment',
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
				$('#side-sub-today-appointment').css('background-color', '#dddfeb');
				
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
					
					// thead
					const theadData = `
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
							<th>확인</th>
						</tr>
					`;
					
					$('.list thead').append(theadData);
					
					
					$(result.list).each((index, item) => {
						
						// tbody
						let tbodyData = `
							<tr onclick="location.href='/apa/hospital/\${item.hospitalId}/medi/today/appointment/\${item.appointmentSeq}';">
								<td>\${item.rnum}</td>
								<td>\${item.appointmentSeq}</td>
								<td>\${item.userName}</td>`;
						
						if (item.childName != null) {
							tbodyData += `
								<td>\${item.childName}</td>
							`;
						} else {
							tbodyData += `
								<td class="gray-font">(접수자)</td>
							`;
						}
						
						tbodyData += `
							<td>\${item.treatmentWay}</td>
							<td>\${item.appointmentDate}</td>
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
						
						tbodyData += `
								<td>\${item.regdate}</td>
								<td>
									<button type="button" name="btnApproval" id="btnApproval"
										onclick="approveAppointment('\${item.appointmentSeq}');">승인</button>
									<button type="button" name="btnDecline" id="btnDecline"
										onclick="declineAppointment('\${item.appointmentSeq}');">거절</button>
								</td>
							</tr>
						`;
						
						$('.list tbody').append(tbodyData);
						
					});
					
					// pagebar
					$('.pagebar').html(result.pagebar);
					
				} else {
					
					//예약이 없을 경우
					
					const nullMessage = `<h4 class="null-msg">오늘 신청된 예약이 없습니다.</h4>`;
					
					$('.card-body').append(nullMessage);
					
				}
			},
			error: (a, b, c) => {
				console.log(a, b, c);
			}
		});
	}
		
	function approveAppointment(appointmentSeq) {
		
		if (confirm('예약을 승인하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${id}/medi/today/appointment/' + appointmentSeq,
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
				data: JSON.stringify({ action: 'approve' }),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						
						alert('예약을 승인하였습니다.');
						
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
		
	function declineAppointment(appointmentSeq) {
		if(confirm('예약을 거절하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${id}/medi/today/appointment/' + appointmentSeq,
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
	            data: JSON.stringify({ action: 'decline' }),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						alert('예약을 거절하였습니다.');
						
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
	
</script>