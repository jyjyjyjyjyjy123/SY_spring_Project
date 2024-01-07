<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>


	h1 {
		width: 80%;
		margin: 0 auto;
		color: #858796;
		margin-top: 30px;
		text-align: center;
	}

	hr {
		border: 0;
		background: #858796;
		height: 2px;
		width: 80%;
		margin: 0 auto;
	}
	
	div { height: 30px; }
	
	table {
		width: 80%;
		text-align: center;
		margin: 0 auto;
		border-spacing: 0px;
	}
	
	tr:first-child td:last-child {
		border-top: 1px solid #CCC;
	}

	tr:first-child td:first-child {
		border-top: 1px solid #CCC;
	}
	
	tr td:nth-child(1) {
		padding: 3%;
		background-color: #edf0f7;
		color: #858796;
		font-size: 1.2rem;
		border-right: 1px solid #CCC;
		border-left: 1px solid #CCC;
		border-bottom: 1px solid #CCC;
	}

	tr td:nth-child(2) {
		font-size: 1.2rem;
		color: #858796;
		border-right: 1px solid #CCC;
		border-bottom: 1px solid #CCC;
	}

	#box { height: 20px;}

	#btn {
		color: #858796;
		width: 120px;
		height: 40px;
    	margin: 0 auto;
    	cursor: pointer;
		display: flex;
		font-size: 1.2rem;
		text-align: center;
		line-height: 50px;
    	align-items: center;
    	border-radius: 10px;
		justify-content: center;
		background-color: #edf0f7;
	}

	#btn:hover {
		background-color: #dddfeb;
	}
</style>
<h1>진료 내역</h1>

<div></div>

<hr>

<div></div>

<table>
</table>
<div id="box"></div>
<div id="btn" onclick="window.close()">창 닫기</div>

<input type="hidden" name="userSeq" value="${seq}">

<script>

	const userSeq = $('input[name=userSeq]').val();
	
	load(userSeq);

	function load(seq) {
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mymedi/detailrecord',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: dto => {
				$('table').append(`
					<tr>
						<td>병원명</td>
						<td>\${dto.hospitalName}</td>
					</tr>
					<tr>
						<td>예약자명</td>
						<td>\${dto.userName}</td>
					</tr>
					<tr>
						<td>환자명</td>
						<td>\${dto.patientName}</td>
					</tr>
					<tr>
						<td>진단명</td>
						<td>\${dto.diagnosis}</td>
					</tr>
					<tr>
						<td>질병 코드</td>
						<td>\${dto.diseaseCode}</td>
					</tr>
					<tr>
						<td>진료 날짜</td>
						<td>\${dto.appointmentDate}</td>
					</tr>
				`);		
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
		
	}	
</script>