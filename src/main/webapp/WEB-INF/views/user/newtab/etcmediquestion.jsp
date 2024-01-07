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

	#box { height: 20px;}

	#btn {
		color: #858796;
		width: 100px;
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

	#text-box {
		width: 80%;
		height: 350px;
		margin: 0 auto;
		display: grid;
	}
	
	#q-box {
		display: grid;
	}

	#a-box {
		display: grid;
	}
	
	#title {
		font-size: 1.1rem;
		height: 100%;
		background-color: #dddfe6;
	    outline: none;
		border: 0;
		color: #545454;
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 10px;
	}
	
	#qContent {
		font-size: 1.1rem;
		height: 150px;
		resize: none;
		background-color: white;
		color: #545454;
		border-color: #dddfe6;
		border-left-width: 2px;
	    border-right-width: 2px;
   		border-top-width: 2px;
   		border-bottom-width: 2px;
   		box-shadow: 1px;
   		padding-left: 10px;
	}
	
	#aContent {
		font-size: 1.1rem;
		height: 150px;
		resize: none;
		background-color: white;
		color: #545454;
		border-color: #dddfe6;
		border-left-width: 2px;
	    border-right-width: 2px;
   		border-top-width: 2px;
   		border-bottom-width: 2px;
   		padding-left: 10px;
	}
	
	#aContentNull {
		font-size: 1.1rem;
		height: 150px;
		resize: none;
		background-color: white;
		color: #545454;
		border-color: #dddfe6;
		border-left-width: 2px;
	    border-right-width: 2px;
   		border-top-width: 2px;
   		border-bottom-width: 2px;
   		padding-left: 10px;
		text-align: center;
		line-height: 150px;
		overflow: hidden;
	}
	
	#list {
		text-align: center;
		margin: 0 auto;
		width: 80%;
		font-size: 1.1rem;
		border-spacing: 0;
	}
	
	#list tr:nth-child(1) td {
		background-color: #dddfe6;
		color: #545454;
	}

	#list tr:nth-child(3) td {
		background-color: #dddfe6;
		color: #545454;
	}

	#list tr:nth-child(2) td {
		background-color: white;
		border-right: 1px solid #dddfe6;
	}	
	
	#list tr:nth-child(2) td:last-child {
		border-right: 0;
	}

	#list tr:nth-child(4) td { 
		background-color: white; 
		border-right: 1px solid #dddfe6;
		border-bottom: 1px solid #dddfe6;
	}

	#list tr:nth-child(4) td:last-child {
		border-right: 0;
	}

</style>

	
		<h1>의학상담 상세 보기</h1>
		
		<div></div>

		<hr>
		
		<div></div>

		<div id="text-box">
		</div>

		<table id="list">
		</table>

		<div id="box"></div>
		<div id="btn" onclick="window.close()">창 닫기</div>

<input type="hidden" name="mediCounselQuestionSeq" value="${seq}">
<script>

	const mediCounselQuestionSeq = $('input[name=mediCounselQuestionSeq]').val();
	
	load(${seq});
	
	function load(seq) {
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mybox/etcmedicounselquestiondetail',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: dto => {
				
				$('#text-box').append(`
					<div id="q-box">
						<div id="title">\${dto.counselTitle}</div>
						<textarea disabled id="qContent">\${dto.counselContent}</textarea>
					</div>
					<div id="a-box">
						<textarea disabled id="aContent">\${dto.counselAnswerContent}</textarea>				
					</div>
				`);
				
				$('#list').append(`
					<tr>
						<td>회원 ID</td>
						<td>진료과목</td>
						<td>질문 날짜</td>
					</tr>
					<tr>
						<td>\${dto.userId}</td>
						<td>\${dto.departmentName}</td>
						<td>\${dto.regdate}</td>
					</tr>
					<tr>
						<td>답변 의사이름</td>
						<td>병원명</td>
						<td>답변 날짜</td>
					</tr>
					<tr>
						<td>\${dto.doctorName}</td>
						<td>\${dto.hospitalName}</td>
						<td>\${dto.answerTime}</td>
					</tr>
					`);				
				
				
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}
	
	
</script>