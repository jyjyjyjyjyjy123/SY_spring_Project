<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .maindiv {
        width: 80%;
        margin: 0 auto;
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    }

    .hospital-info {
        margin-top: 20px;
    }

    .counseling-list {
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
    }

    h1 {
        font-size: 30px;
        color: #000000;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }

    #counseling-waiting-table-list,
    #counseling-waiting-answer-table-list {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        overflow-x: auto;
    }

    #counseling-waiting-table-list th,
    #counseling-waiting-table-list td,
    #counseling-waiting-answer-table-list th,
    #counseling-waiting-answer-table-list td {
        border: 1px solid #ddd;
        padding: 10px 8px;
        background-color: #f8f9fa;
        color: #000;
    }

    #counseling-waiting-table-list th,
    #counseling-waiting-answer-table-list th {
        background-color: #f2f2f2;
        text-align: center;
        padding: 15px 8px;
        font-weight: bold;
        color: #000;
    }

    .date {
        text-align: right;
        padding: 1px;
    }

    button {
        padding: 10px;
        background-color: #dcdcdc;
        color: #000;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }

    button:hover {
        background-color: #c0c0c0;
    }
</style>




<body>
	<div class="maindiv">
		<div class="hospital-info">
			<div class=counseling-list id="counseling-list">
				<h1>답변보기</h1>
				<br>
				<br>
				<table id="counseling-waiting-table-list">
					<tr>
						<th>제목</th>
						<td colspan=3>${counselingdto.counseltitle}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${counselingdto.username}</td>
						<th>작성날짜</th>
						<td class="date">${counselingdto.regdate}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan=3>${counselingdto.counselcontent}</td>
					</tr>

					<tbody id="counseling-waiting-tbody"></tbody>
				</table>
			</div>
			<div>
				<table id="counseling-waiting-answer-table-list">
					<tr>

						<th>작성날짜</th>
						<td class="date">${counselingdto.answerTime}</td>
					</tr>
					<tr>
						<th>답변</th>
						<td colspan=3>${counselingdto.counselAnswerContent}</td>
					</tr>
					<tbody id="counseling-waiting-tbody"></tbody>
				</table>
			</div>


			<div id="hidden-choice-doc"></div>
			<div class="time-choice" id="time-choice"></div>
			<input type="hidden" name="hospitalId"
				value="<sec:authentication property='principal.dto2.hospitalId'/>">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input type="hidden"
				name="mediCounselQuestionSeq"
				value="${counselingdto.mediCounselQuestionSeq}"> <input
				type="hidden" name="mediCounselQuestionSeq"
				value="${counselingdto.mediCounselAnswerSeq}"> <input
				type="hidden" name="doctorSeq" value="${doctorSeq}">
			<button type="button" onclick="window.history.back()">뒤로가기</button>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
		
	</script>
</body>









