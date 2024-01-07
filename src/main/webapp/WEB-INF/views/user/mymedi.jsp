<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

	.list {
		text-align: center;
	}
		
	.list > thead > tr > th {
	    color: #858796;
		font-size: 1.3rem;
	    background-color: #edf0f7;
	    font-weight: lighter;
	    border-right: 1px solid #CCC;
    }

	.list > tbody > tr > td {
		font-size: 1.2rem;
		color: #858796;
		padding-top: 8px;
		padding-bottom: 8px;
		border-bottom: 1px solid #edf0f7;
		border-right: 1px solid #edf0f7;
	}

	.list > thead > tr > th:nth-child(1) { width: 50px; }
	.list > thead > tr > th:nth-child(2) { width: 200px; }
	.list > thead > tr > th:nth-child(3) { width: 100px; }
	.list > thead > tr > th:nth-child(4) { width: 100px; }
	.list > thead > tr > th:nth-child(5) { width: 200px; }
	.list > thead > tr > th:nth-child(6) { width: 130px; }
	.list > thead > tr > th:nth-child(7) { width: 200px; }
	.list > thead > tr > th:nth-child(8) { width: 130px; }

	.list > tbody > tr > td {
		font-size: 1.2rem;
	}

	.list > thead > tr > th:last-child {border-right: 0;}
	.list > tbody > tr > td:last-child {border-right: 0;}
	
	#record > thead > tr > th:nth-child(1) { width: 50px; }
	#record > thead > tr > th:nth-child(2) { width: 250px; }
	#record > thead > tr > th:nth-child(3) { width: 150px; }
	#record > thead > tr > th:nth-child(4) { width: 250px; }
	#record > thead > tr > th:nth-child(5) { width: 250px; }
	#record > thead > tr > th:nth-child(6) { width: 100px; }
	#record > thead > tr > th:nth-child(7) { width: 100px; }

	.btn {
	    background-color: #edf0f7;
	    color: #858796;
	    border: 0;
	    border-radius: 5px;
	    padding-left: 10px;
	    padding-right: 10px;
	    padding-top: 5px;
	    padding-bottom: 5px;
	}
	
	.btn:hover {
		background-color: #dddfeb;
	}
	
	#btn-complete:hover {
		cursor: default;
		background-color: #edf0f7;
	}
	
</style>
<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12">
			<div class="card shadow mb-5">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold">예약 진료</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<table class="list" id="appointment">
						<thead>
							<tr>
								<th>번호</th>
								<th>병원명</th>
								<th>담당 의사</th>
								<th>환자 이름</th>
								<th>증상</th>
								<th>진료 방식</th>
								<th>예약 날짜</th>
								<th>진료 상태</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-xl-12">
			<div class="card shadow mb-5">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold">진료 내역</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<table class="list" id="record">
						<thead>
							<tr>
								<th>번호</th>
								<th>병원명</th>
								<th>담당 의사</th>
								<th>진단 내용</th>
								<th>진료 날짜</th>
								<th>상세 내용</th>
								<th>리뷰</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="userSeq" value="${seq}">

<script>

	const myPage = document.getElementById('myPage');
	const myInfo = document.getElementById('myInfo');
	const myChild = document.getElementById('myChild');
	const myMedi = document.getElementById('myMedi');
	const myBookmark = document.getElementById('myBookmark');
	const myBox = document.getElementById('myBox');
	const myReview = document.getElementById('myReview');
	const userSeq = $('input[name=userSeq]').val();
	
	loadLink(userSeq);
	
	function loadLink(seq) {
	    myPage.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    myInfo.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    myChild.setAttribute('href', '/apa/user/' + seq + '/mychild.do');

	    myMedi.setAttribute('href', '/apa/user/' + seq + '/mymedi.do');
	    myMedi.style.backgroundColor = '#DDDFEB';

	    myBookmark.setAttribute('href', '/apa/user/' + seq + '/mybookmark.do');
	    myBox.setAttribute('href', '/apa/user/' + seq + '/mybox.do');
	    myReview.setAttribute('href', '/apa/user/' + seq + '/myreview.do');
	}
	
	appointment(${seq});
	record(${seq});
	
	function appointment(seq) {
		
		$('#appointment > tbody').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mymedi/appointment',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					
					$('#appointment > tbody').append(`
							
						<tr>
							<td>\${index + 1}</td>
							<td>\${item.hospitalName}</td>
							<td>\${item.doctorName}</td>
							<td>\${item.patientName}</td>
							<td>\${item.symptom}</td>
							<td>\${item.treatmentWay}</td>
							<td>\${item.appointmentDate}</td>
							<td>\${item.status}</td>
						</tr>			
						
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}

	function record(seq) {
		
		$('#record > tbody').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mymedi/record',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					
					let buttonHtml = item.reviewSeq == null 
					? `<td><button type="button" class="btn" onclick="insertReview(\${item.appointmentSeq})">리뷰작성</button></td>`
					: `<td><button type="button" class="btn" id="btn-complete">작성완료</button></td>`;
					
					$('#record > tbody').append(`
						<tr>
							<td>\${index + 1}</td>
							<td>\${item.hospitalName}</td>
							<td>\${item.doctorName}</td>
							<td>\${item.diagnosis}</td>
							<td>\${item.appointmentDate}</td>
							<td><button type="button" class="btn" onclick="viewDetail(\${item.appointmentSeq})">상세보기</button></td>
							\${buttonHtml}
						</tr>
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}


	function viewDetail(seq) {
		
        var winHeight = 1000;
        var winWidth = 800;
        var winTop = (screen.height / 2) - (winHeight / 2);
        var winLeft = (screen.width / 2) - (winWidth / 2);
        window.open('/apa/user/' + seq + '/myrecord.do', '진료 내역', 'height=' + winHeight + ',width=' + winWidth + ',top=' + winTop + ',left=' + winLeft);		
		
	}	

	function insertReview(seq) {
		
        var winHeight = 1000;
        var winWidth = 800;
        var winTop = (screen.height / 2) - (winHeight / 2);
        var winLeft = (screen.width / 2) - (winWidth / 2);
        var newWin = window.open('/apa/user/' + seq + '/insertreview.do', '리뷰 작성', 'height=' + winHeight + ',width=' + winWidth + ',top=' + winTop + ',left=' + winLeft);		
        
        var timer = setInterval(function() { 
            if(newWin.closed) {
                clearInterval(timer);
                record(userSeq);
            }
        }, 500);	
	}	

</script>