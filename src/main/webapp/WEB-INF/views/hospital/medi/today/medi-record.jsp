<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- medi-record.jsp -->

<style>
button {
	border: none;
	border-radius: 5px;
	color: #858796;
	font-size: 1.1rem;
	width: 100px;
	height: 40px;
	margin-right: 10px;
}

button:hover {
	background-color: #CCC;
}

#btnArea {
	margin: 10px auto;
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

input, textarea {
	border: 1px solid #e3e6f0;
	border-radius: 2px;
	width: 300px;
}

textarea {
	margin-top: 5px;
	width: 300px;
	height: 200px;
	resize: none;
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
					<h5 class="m-0 font-weight-bold text-primary">진료내역서 작성</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<%-- <form method="PUT"
						action="/apa/api/hospital/${dto.hospitalId}/medi/all/treatment/${dto.appointmentSeq}/record"> --%>
					<div id="container">
						<table>
							<tr>
								<th>진료예약번호</th>
								<td>${dto.appointmentSeq}</td>
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
								<td><input type="text" name="diagnosis" id="diagnosis"
									required></td>
							</tr>
							<tr>
								<th>질병코드</th>
								<td><input type="text" name="diseaseCode" id="diseaseCode"
									required></td>
							</tr>
							<tr>
								<th>진료내용</th>
								<td><textarea name="recordContent" id="recordContent"
										required></textarea></td>
							</tr>

						</table>

						<div id="btnArea">
							<button type="button" onclick="writeMediRecord();">작성하기</button>
							<button type="button" onclick="goBack();">취소하기</button>
						</div>
					</div>
					<!-- </form> -->
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

	function writeMediRecord() {
		
		const diagnosis = $('#diagnosis').val();
	    const diseaseCode = $('#diseaseCode').val();
	    const recordContent = $('#recordContent').val();

	    // 필수 입력 필드에 값이 있는지 확인
	    if (!diagnosis || !diseaseCode || !recordContent) {
	        alert('모든 필수 입력 필드를 작성해주세요.');
	        return;
	    }
		
		const dto = {
			appointmentSeq: ${dto.appointmentSeq},
			hospitalName: '${dto.hospitalName}',
			doctorName: '${dto.doctorName}',
			diagnosis: $('#diagnosis').val(),
			diseaseCode: $('#diseaseCode').val(),
			recordContent: $('#recordContent').val()	
		}
		
		if (confirm('진료내역서 작성을 완료하시겠습니까?')) {
			$.ajax({
				type:'PUT',
				url: '/apa/api/hospital/${dto.hospitalId}/medi/today/treatment/${dto.appointmentSeq}/record',
				contentType: 'application/json',
				beforeSend : function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                 },
	            data: JSON.stringify(dto),
				dataType: 'json',
				success: result => {
					if (result == 1) {
						alert('진료내역서 작성이 완료되었습니다. 목록으로 이동합니다.');
						
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
	
	function goBack() {
		if (confirm('진료내역서 작성을 취소하시겠습니까? 작성된 내용은 사라집니다.')) {
			alert('진료내역서 작성을 취소하였습니다. 목록으로 이동합니다.')
			location.href='/apa/hospital/${dto.hospitalId}/medi/today/treatment';
		}
	}
</script>