<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
#list{
	margin:30px 15px 70px 70px;
}
.sub {
	margin-left: 70px;
}
#list th:nth-child(1) {width: 100px;}
#list th:nth-child(2) {width: 750px;}
#list th:nth-child(3) {width: 150px;}
#list th:nth-child(4) {width: 130px;}

#list td:nth-child(1) {text-align: center;}   
#list td:nth-child(2) {padding-left: 10px;}   
#list td:nth-child(3) {text-align: center;}   
#list td:nth-child(4) {text-align: center; border-right: 0px;}
table th {
   font-weight: bold;
   background-color: #D0E5E1;
   color: #5D5D5D;
   border: 1px solid #e7f6fe;
   border-width: 1px 0 1px 0;
   font-size: 1.05rem;
   height: 40px;
   border-radius: 4px;
}
small {
	font-size: 30px;
}
table th{
	border: 1px solid #ffffff;
	border-width: 1px;
}

table td {
	font-size: 1.05rem;
	border: 1px solid #eeeeee;
	border-width: 1px 1px 1px 0;
	height: 36px;
}
table tr {
	 border: 1px solid #ffffff;
}
   

#list th{text-align: center;}	


.is-new {
	font-size: 14px;
	color: tomato;
}
	
#search-form{
	text-align: center;
	margin-bottom: 15px;
	
}
	
#pagebar {
	text-align: center;
	margin-bottom: 15px;
	font-size: 18px;
}

#column {
	border-radius: 3px;
	font-size: 1.1rem;
	border: 1px solid grey;
	margin-top: 10px;
}

.long{
	border: 1.5px solid grey;
	border-radius: 3px;
}
.btn2{
	background-color: white;
	border: 1.5px solid grey;
	border-radius: 3px;
}
.list{
	border-radius: 4px;
	border: 1px solid #D0E5E1;
	background-color: #D0E5E1;
}
.add{
	border-radius: 4px;
	border: 1px solid #D0E5E1;
	background-color: #D0E5E1;
}
body > main > div:nth-child(5){
	text-align: right;
}
</style>
<div class="maindiv">
		<h1 class="sub hansans">
			커뮤니티 
			<%-- <small>
				<c:if test="${map.search == 'n'}">
				community
				</c:if>
				<c:if test="${map.search == 'y'}">
				검색결과
				</c:if>
			</small> --%>
		</h1>
	
	
		<table id="list">
			<tr>
				<th id="number">번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>날짜</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.communityseq}</td>
				<td>
					<a href="/apa/community/view.do?seq=${dto.communityseq}">${dto.communitytitle}</a>
				</td>
				<td>${dto.userid}</td>
				<td>${dto.communitydate}</td>
			</tr>
			</c:forEach>
		</table>
		
		<div id="pagebar">${pagebar}</div>
		
		
		
		<!-- 검색 -->
	<!-- 	<form id="search-form" action="/apa/community/list.do" method="GET">
			<select id="column" name="column">
				<option value="communitytitle">제목</option>
				<option value="communityContent">내용</option>
				<option value="userId">이름</option>
			</select>
			<input type="text" name="word" class="long" required>
			<input type="submit" class="btn2" value="검색하기">
		</form> -->
		
		
		<div>
			<button type="button" class="list" onclick="location.href='/apa/community/list.do';">목록보기</button>
			
			<c:if test="${not empty userseq}">
			<button type="button" class="add" onclick="location.href='/apa/community/add.do';">글쓰기</button>
			</c:if>
		</div>		
		
	
</div>