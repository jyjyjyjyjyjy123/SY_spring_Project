<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.small-info {
	margin-bottom: 8px;
	margin-left: 5px;
}

.collapse-header {
	font-weight: bold;
	margin-left: 5px;
}

.document {
	border: 1px solid grey;
	margin-left: 5px;
	border-radius: 0.35rem;
	padding: 3px 3px;
	font-size: 14px;
}

.answer-progress {
	border: 1px solid grey;
	margin-left: 5px;
	border-radius: 0.35rem;
	padding: 3px 3px;
	font-size: 14px;
}

.advice-info {
	margin-top: 20px;
	margin-left: 10px;
	display: flex;
	overflow: hidden;
	cursor: pointer;
}

.advice_Answer {
	border: 1px solid #E6E6E6;
	background-color: #E6E6E6;
	padding: 15px;
	margin-top: 12px;
	border-radius: 0.35rem;
	display: none;
}

.advice_Answer.show {
	display: block;
}

.helpedcount {
	float: right;
}

.storage {
	float: right;
	margin-right: 10px;
	border: 0px solid grey;
}

.helped {
	float: right;
	border: 0px solid grey;
}
#pagebar {
	text-align: center;
	padding: 30px;
	font-size: 20px;

}
#regist-btn{
	justify-content: center;
}

#counselregist {
	border: 1px;
	position: fixed;
	background-color: #98d6c9;
    bottom: 10px;
    height: 4rem;
    width: 700px;
    border-radius: 8px;
   	transform: translateX(50%);
   	font-weight: bold;
   	font-size: 25px;
   	box-shadow: 2px 2px 5px #0B6127; 
   	color: #0B3B17;
}
.advice-AnswerInfo{
	font-weight: bold;
	font-size: 18px;
	margin-bottom: 5px;
}



#searchBtn{
		border: 0;
		background-color: #dadce2;
		color: #424263;
		width: 4em;
		height: 2em;
		border-radius: 0.35rem;
		font-size: 1em;
	}
#search {
    display: flex;
    justify-content: flex-end;
}	

.forms-container {
    display: flex;
    justify-content: space-between; /* 각 요소를 가능한 넓게 펼쳐서 정렬합니다. */
    align-items: center; /* 세로 가운데 정렬을 위해 필요할 수 있습니다. */

</style>
<main>
	<div class="maindiv">
		<h1>의학상담</h1>
		
		<h6>무엇이든 물어보세요. 전문의사가 답해드립니다!</h6>
		
		<div class="forms-container"> 
		<form>
			<select name="departmentSeq" id="departmentselect" required>
				<option style="text-align: center;">진료과 선택</option>
				<c:forEach items="${listDepartment}" var="dto" varStatus="loop">
					<option value="${dto.departmentseq}">${dto.departmentname}</option>
				</c:forEach>
			</select>
		</form>
		<form method="GET" action="list.do" id="search">
			<input type="text" name="word" class="middle"  required
				placeholder="검색어를 입력하세요" value="${word}"> <input id ="searchBtn"
				type="submit" value="검색">
		</form>
		</div>

		<div id="advice-list">
			<c:forEach items="${list}" var="dto" varStatus="loop">
				<hr>
				<div class="small-info">
					<span class="document">${dto.departmentname}</span> <span
						class="answer-progress">${dto.iscounselanswer}</span> <span
						class="helpedcount">도움 ${dto.helpedcount}</span>
				</div>
				<h6 class="collapse-header">Q. ${dto.counseltitle}</h6>
				<div class="advice-info" id="advice">
					<p class="info-text">${dto.counselcontent}</p>
				</div>
				<div class="advice_Answer" id="answer">
					<div class="advice-AnswerInfo">${dto.hospitalname}
						${dto.departmentname} ${dto.doctorname} 의사</div>
					<div class="answer-content">${dto.counselanswercontent}</div>
					<div
						style="display: flex; justify-content: flex-end; margin-top: 7px;">
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_USER')">
						<%-- <button type="button" class="storage" value="${dto.medicounselanswerseq}" name="medicounselanswerseq">보관</button> --%>
						<button type="button" class="storage" value="${dto.seq}" name="medicounselanswerseq">보관</button>
							</sec:authorize>
						</sec:authorize>
						<button type="button" class="helped" value="도움">도움됐어요</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<div id="pagebar">${pagebar}</div>



						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_USER')">
		<div id="regist-btn">
			<a href="/apa/advice/add.do"><button id="counselregist"
					type="button">의학상담 등록하기</button></a>
		</div>
			</sec:authorize>
						</sec:authorize>
	</div>
</main>

<script>


	
	function advice(){
		let info = document.querySelectorAll('.advice-info');
		let answer = document.querySelectorAll('.advice_Answer');
				
			info.forEach((target, index) => target.addEventListener(
						"click",
						function() {
							answer[index].classList.toggle("show");
						}))}; 

	//함수 호출
	advice();
	//보관함 호출
	box();
	//보관함
	function box(){
	$('button[name=medicounselanswerseq]').click(function(){
//		let medicounselanswerseq = $(this).val();
		let seq = $(this).val();
		let userseq = ${loginuserseq};
		let obj = {
			userSeq: userseq,
			//medicounselanswerseq: medicounselanswerseq
			seq: seq
		};
		//alert(JSON.stringify(obj));
		$.ajax({
			type: 'POST',
			url: '/apa/advice/storage',
			headers: {'Content-Type':'application/json'},
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result =>{
				if(result ==1){
					location.href='/apa/advice/list.do';
					alert('마이페이지 - 보관함에서 확인 가능합니다.');
				} else {
					alert('failed');
				}
			},
			error:(a,b,c) => {
				console.log(a,b,c);
			}
		});
	});
	};
	
	$('#departmentselect').change(function() {
		let obj = {
				departmentSeq : $(event.target).val()
			};
		$.ajax({
			type: 'POST',
			url: '/apa/advice/findlist',
			headers: {'Content-Type':'application/json'},
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			data: JSON.stringify(obj),
			dataType: 'json',
			success: function(result) {
				$('#advice-list').html('');
				$(result).each((index, item) => {
					$('#advice-list').append(`
					<hr>
			      	<div class="small-info">
				      	<span class="document">\${item.departmentname}</span>
				      	<span class="answer-progress">\${item.iscounselanswer}</span>
				      	<span class="helpedcount">도움 \${item.helpedcount}</span>
			      	</div>
			            <h6 class="collapse-header">Q. \${item.counseltitle}</h6>
			            <div class="advice-info" id="advice">
			           	<p class="info-text">\${item.counselcontent}</p>
			          </div>
			            <div class="advice_Answer" id="answer">
			            	<div class="advice-AnswerInfo">\${item.hospitalname} \${item.departmentname} \${item.doctorname} 의사</div>
			            	<div class="answer-content">\${item.counselanswercontent}</div>
			            	<div style="display: flex; justify-content: flex-end; margin-top: 7px;">
							<button type="button" class="storage" value="\${item.medicounselanswerseq}" name="medicounselanswerseq">보관</button>
			            	<button type="button" class="helped" value="도움">도움됐어요</button> 
			            	</div>
			            </div>	
							`);
				});
				//함수 이벤트 호출
				advice();
				box();
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});
	});
	
	
	
	
</script>