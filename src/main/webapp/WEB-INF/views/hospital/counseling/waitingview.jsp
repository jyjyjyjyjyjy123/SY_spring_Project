<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
/* 기존 스타일은 여기에 둡니다. */

    .maindiv {
        width: 80%;
        margin: 0 auto;
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    }

#answer-box {
	font-size: 15px;
	color: #3D5AFE;
	font-weight: bold;
	margin-bottom: 10px;
}

#comment {
	width: calc(100% - 16px);
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#back, #submit {
	padding: 10px;
	margin-right: 10px;
	background-color: #dcdcdc;
	color: #000;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#back:hover, #submit:hover {
	background-color: #c0c0c0;
}

#answer-title {
	font-size: 30px;
	color: #000000;
	font-weight: bold;
	margin-bottom: 20px;
	text-align: center;
	border-bottom: 2px solid transparent; /* 밑줄을 없애려면 transparent로 설정 */
	padding-bottom: 5px;
}

#counseling-waiting-table-list {
	width: 100%;
	border-collapse: collapse;
	margin-top: 1px;
	margin-bottom: 30px;
	
}

#counseling-waiting-table-list th {
	background-color: #f2f2f2;
	text-align: center;
	padding: 15px 8px;
	border: 1px solid #ddd;
	color: #000;
}

#counseling-waiting-table-list td {
	border: 1px solid #ddd;
	padding: 10px 8px;
	background-color: #f8f9fa;
	color: #000;
}

.date {
	text-align: right;
}

#answer-box {
	color: #000; /* 검정색으로 변경 */
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 5px;
	text-decoration: none; /* 밑줄 제거 */
}

label[for="comment"] {
	display: block;
	margin-bottom: 10px;
	font-size: 18px;
}

#comment {
	width: calc(100% - 16px);
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 5px;
	margin-bottom: 10px;
	background-color: #ffffff;
}

#back, #submit {
/* 	border: 1px solid #ccc; */
	padding: 10px;
	margin-right: 10px;
	background-color: #dcdcdc;
	color: #000;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#back:hover, #submit:hover {
	background-color: #c0c0c0;
}
</style>




<body>
	<div class="maindiv">
		<form method="POST" action="/apa/hospital/counseling/answeraddok.do" onsubmit="return handleFormSubmission();">
			<div class="hospital-info">
				<div class=counseling-list id="counseling-list">
				<h1 id="answer-title">답변하기</h1>
				<br><br>
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

				<div id="hidden-choice-doc"></div>
				<div class="time-choice" id="time-choice"></div>
				<input type="hidden" name="hospitalId"
					value="<sec:authentication property='principal.dto2.hospitalId'/>">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<input type="hidden" name="mediCounselQuestionSeq" value="${counselingdto.mediCounselQuestionSeq}">
				<input type="hidden" name="doctorSeq" value="${doctorSeq}">

				<div id="answer_box">
<!-- 					<label for="comment" id="answer-box">답변:</label><br> -->
					<textarea id="comment" name="counselAnswerContent" rows="4" cols="50"></textarea>
				</div>
				<button type="button" id="back" onclick="window.history.back()">뒤로가기</button>
				<button type="submit" id="submit">등록하기</button>
			</div>
		</form>
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
	  function handleFormSubmission() {

          var isSuccess = true;

          if (isSuccess) {
              alert('등록이 완료되었습니다.');
              return true;
          } else {
              return false;
          }
      }
	</script>
</body>









