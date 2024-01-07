<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<style>
.counselingWrite {
	border: 1px solid grey; 
	/* width: 1150px;
	height: 400px; */
	background-color: #DCF0EC;
}
input[type="text"]{
    width: 100%;
    padding: 10px;
   	border: 1px solid gray;
    border-radius: 4px;
    background-color: white;
    /* box-sizing: border-box; */
}
textarea{
	width: 100%;
	height: 300px;
	padding: 10px;
	margin-left: 10px;
	border: 1px solid gray;
	border-radius: 4px;
}
.counselingWrite th:nth-child(1){
	 background-color: gray; 
	text-align: center;
	font-size: 20px;
	 
}
#subjectLine{
	border-bottom: 12px solid #EEF5F3;
	border-right: 12px solid #EEF5F3;
	padding: 10px;
}

#counselTitle{
	width: 1000px;
	height: 40px;
}

#counselContent{
	border-right: 12px solid #grey;
	width:  1000px;
}
#departmentChoice {
	width: 70px;
	text-align: center;
	font-size: 18px;
}

#departmentSector {
	border-bottom: 12px solid #EEF5F3;

}
.buttons{
	width: 1100px;
	margin-top: 30px;
	text-align: center;
}
.back {
	border: 1px solid grey;
	border-radius: 4px;
	background-color: #EEF5F3;
	margin-left: 30px;
}
.questionAdd{
	border: 1px solid grey;
	border-radius: 4px;
	background-color: #EEF5F3;
	
}

#title{
	padding-left:11px;
}
#dep{
	padding-left:12px;
}
</style>
<main>
<div class="maindiv">

	<h1 class ="hansans">의학상담 <small>글쓰기</small></h1>
		
	<table>
		<tr>
			<th>진료과</th>
			<td id="dep">
			<select name="departmentSeq" required>
				<option style="text-align: center;">----선택----</option> 
				<c:forEach items="${add}" var="dto" varStatus="loop">
				<option value="${dto.departmentSeq}">${dto.departmentname}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td id="title">
			<input type="text" id="counselTitle" name="counselTitle" required>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea id="counselContent" name="counselContent" rows="10" cols="40" required></textarea>
			</td>
		</tr>
	</table>
	<div class="buttons">
			<button type="submit" class="questionAdd" onclick="add();">등록</button>
			<button type="button" class="back" onclick="location.href='/apa/advice/list.do';">돌아가기</button>
	</div>

</div>
</main>
<script>
	function add(){
		
		let obj ={
			userseq: <sec:authentication property="principal.dto1.userseq"/>,
			departmentSeq: $('select[name=departmentSeq]').val(),
			counseltitle: $('input[name=counselTitle]').val(),
			counselcontent: $('textarea[name=counselContent]').val()
		};
		//alert(JSON.stringify(obj));
		$.ajax({
			type: 'POST',
			url: '/apa/advice/add',
			headers: {'Content-Type':'application/json'},
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				//alert(result);
				if(result == 1){
					location.href = '/apa/advice/list.do';
				} else {
					alert('failed');
				}
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});
	}
</script>