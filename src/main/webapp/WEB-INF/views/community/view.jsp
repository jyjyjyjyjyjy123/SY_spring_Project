<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
#contentSector{
	border-top: 6px solid #EEF5F3;
}

#view {
/* 	width:1300px;
 */	/* background-color: green; */
 	height: 400px;
 	border: 1px solid #DCF0EC;
 	background-color: #DCF0EC;
 	font-size: 1.1rem;
 	margin-top: 35px;
}

#view th:nth-child(1) {
	width: 80px; 
	text-align: center;
	/* border-bottom: 6px solid #EEF5F3; */
	border-right: 6px solid #EEF5F3;
	font-size: 1.1rem;
}

#num{
	width:5px;
	height: 50px;
	padding-left: 10px;
	font-size: 1.1rem;
	border-bottom: 6px solid #EEF5F3;
}
#id {
	border-right: 6px solid #EEF5F3;
	width:80px;
	text-align: center;
	font-size: 1.1rem;
	border-bottom: 6px solid #EEF5F3;
}
#subject {
	width:300px;
	height: 80px;
	padding-left: 10px;
	font-size: 1.1rem;
}
#content{
	width: 1100px;
	height: auto;
	border-top: 6px solid #EEF5F3;
	padding-left: 15px;
	padding-right: 10px;
	font-size: 1.1rem;
}
#date{
	width: 70px;
	border-right: 6px solid #EEF5F3;
	text-align: center;
	font-size: 1.1rem;
}
#getId{
	width: 120px;
	padding-left: 10px;
	font-size: 1.1rem;
}
#getDate{
	width: 220px; 
	padding-left: 10px;
	font-size: 1.1rem;
}
#subjectSector{
	border-top: 6px solid #EEF5F3;
	font-size: 1.1rem;
}
#list-comment {width: 90%;}
#list-comment td:nth-child(1) { width: auto; }
#list-comment td:nth-child(2) { width: 160px; text-align: center; }
	
#list-comment td:nth-child(1) > div { 
	display: flex;		
	justify-content: space-between; 
	/* background-color: gold; */
	height: 20px;
	padding-top: 5px;
	margin-top: 4px;
	
}
	
#list-comment td:nth-child(1) > div > div:nth-child(2) {
	font-size: 12px;
	color: #777;
	padding-top: 5px;
	
}

.btn5 {
	display: inline-block;
}

#comment{
	width: 1080px;
	height: 200px;
	border-radius: 6px;
	border: 1px solid grey;
}
.bottomBtn{
	display: flex;
	padding-bottom: 15px;
	padding-top: 10px;

	
}
.comment{
	background-color: #DCF0EC;
	height:200px;
	width: 80px;
	border-radius: 6px;
/* 	border: 1px solid grey; */

}
.edit, .del, .back, .cancel{
	border-radius: 4px;
	border: 1px solid #D0E5E1;
	background-color: #D0E5E1;
	margin-left:5px;
}

#main > div:nth-child(4){
	text-align: right;
	margin-right: 150px;
	margin-bottom: 20px;
}


</style>
<div class="maindiv">
<h1 class="sub hansans">커뮤니티 <small>상세보기</small></h1>
		<table class="vertical" id="view">
			<tr>
				<th>번호</th>
				<td id="num">${dto.communityseq}</td>
				<td></td>
				<th id="id">아이디</th>
				<td id="getId">${dto.userid}</td>
				<td></td>
				<th id="date">날짜</th>
				<td id="getDate">${dto.communitydate}</td>
			</tr>
			<tr id="subjectSector">
				<th>제목</th>
				<td id="subject">${dto.communitytitle}</td>
			</tr>
			<tr>
				<th id="contentSector">내용</th>
				<td colspan="8" id="content">${dto.communitycontent}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>
		</table>
			<div class="bottomBtn">
			<button type="button" class="back" onclick="location.href='/apa/community/list.do';">뒤로가기</button>
		
		<sec:authorize access="hasRole('ROLE_USER')">
		<sec:authentication property="principal.dto1.userseq" var="principalUserseq" />
		<c:if test="${principalUserseq == dto.userseq}">
			<button type="button" class="del" onclick="location.href='/apa/community/del.do?seq=${dto.communityseq}';">삭제하기</button>
		</c:if>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button type="button" class="del" onclick="location.href='/apa/community/del.do?seq=${dto.communityseq}';">삭제하기</button>		
		</sec:authorize>
		</div>	
		<div>  </div>
		
		<sec:authorize access="hasRole('ROLE_USER')">
			<table id="add-comment">
				<tr>
					<td><input type="hidden" id="communitySeq" value="${dto.communityseq}" />
					<td><input type="text" name="comment" id="comment" class="full"></td>
					<td><button type="button" class="comment" id="btnComment">등록</button></td>
				</tr>
			</table>					
		</sec:authorize>
		
		
		
	 <div id="commentListContainer">
		<c:forEach items="${listComment}" var="dto">
		<table id="list-comment">
			<tr id="commentlist">
				<td><input type="hidden" id="commentseq" value="${dto.communitycommentseq}"></td>
				<td id="commentcontent">${dto.communitycommentcontent}</td>
				<td id="commentdate">${dto.communitycommentdate}</td> 
				<td id="commentuserid">${dto.userid}</td>
				
				<c:if test="${dto.userseq}">
				<div>
				<button type="button" class="del" value="${dto.communitycommentseq}" onclick="delComment(${dto.communitycommentseq});">삭제</button>
				</div>
				</c:if>
			</tr>	
		</table>
		</c:forEach>
		</div> 

</div>
<script>

	
	
	
	$('#btnComment').click(function() {
		let obj = {
				<sec:authorize access="hasRole('ROLE_USER')">
				userseq: <sec:authentication property="principal.dto1.userseq"/>,
				</sec:authorize>
				communitycommentcontent: $('input[name=comment]').val(),
				communityseq: $('input[id=communitySeq]').val()
		};
		console.log(JSON.stringify(obj));
		$.ajax({
			type: 'POST',
			url: '/apa/community/commentadd',
			headers: {'Content-Type':'application/json'},
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				alert('등록되었습니다.');
				if (result.result == 1) {
					 location.href = '/apa/community/view.do'; 
					 
			}
			
				 $('#comment').val('');//초기화 
				},
				error: (a,b,c) => {
					console.log(a,b,c);
				}
			});
			
		});
	
		
		$('#comment').keydown(function() {
			
			if (event.keyCode == 13) { //엔터(\r)
				$('#btnComment').click();	
			}
			
		});
		
		function delComment(communitycommentseq) {
			let obj = {
					communitycommentseq: communitycommentseq
			};
			console.log(JSON.stringify(obj));
			if(confirm('댓글을 삭제하시겠습니까?')){
				$.ajax({
					type:'POST',
					url: '/apa/community/commentdel',
					headers: {'Content-Type':'application/json'},
					beforeSend : function(xhr) {
						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
					},
					data: JSON.stringify(obj),
					dataType: 'json',
					success: result => {
						alert('삭제되었습니다.');
						if (result.result == 1) {
							 location.href = '/apa/community/view.do'; 
						} 
					},
					error: (a,b,c) => {
						console.log(a,b,c);
					}
					});
				}
			};
		
		
		
		

	


</script>