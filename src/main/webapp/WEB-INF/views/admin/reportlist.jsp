<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
      body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        main {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }

        .box {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 20px;
            width: 45%; /* Adjust the width as needed */
            box-sizing: border-box;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #edf0f7;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        button {
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 1rem;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2980b9;
        }
	
</style>
<main>

	<div id="box1" class="box">
	<table>
		<tr>
			<th>No(글)</th>		
			<th>신고아이디</th>		
			<th>신고유형</th>		
			<th>신고일자</th>		
			<th>처리현황</th>		
		</tr>
		<c:forEach items="${postreportlist}" var="dto" varStatus="status">
		<c:if test="${dto.isPostReportStatus eq '접수'}">
		<tr onclick="location.href='/apa/admin/postreportview.do?communityWriter=${dto.communityWriter}';">
			<td>${status.count}</td>
			<td>${dto.communityWriter}</td>
			<td>${dto.postReportType}</td>
			<td>${dto.postReportDate}</td>
			<td>${dto.isPostReportStatus}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</div>
	
	<div id="box2" class="box">
	<table>
		<tr>
			<th>No(댓글)</th>		
			<th>신고아이디</th>		
			<th>신고유형</th>		
			<th>신고일자</th>		
			<th>처리현황</th>		
		</tr>
		<c:forEach items="${commentreportlist}" var="dto" varStatus="status">
		<c:if test="${dto.isCommentReportStatus eq '접수'}">
		<tr onclick="location.href='/apa/admin/commentreportview.do?commentWriter=${dto.commentWriter}';">
			<td>${status.count}</td>
			<td>${dto.commentWriter}</td>
			<td>${dto.commentReportContent}</td>
			<td>${dto.commentReportDate}</td>
			<td>${dto.isCommentReportStatus}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</div>
	
	<br>
	
	<div id="box3" class="box">
	<table>
		<tr>
			<th>No(글)</th>		
			<th>신고아이디</th>		
			<th>신고유형</th>		
			<th>신고일자</th>		
			<th>처리현황</th>		
		</tr>
		<c:forEach items="${postreportlist}" var="dto" varStatus="status">
		<c:if test="${dto.isPostReportStatus eq '승인' || dto.isPostReportStatus eq '거절'}">
		<tr onclick="location.href='/apa/admin/postreportview.do?communityWriter=${dto.communityWriter}';">
			<td>${status.count}</td>
			<td>${dto.communityWriter}</td>
			<td>${dto.postReportType}</td>
			<td>${dto.postReportDate}</td>
			<td>${dto.isPostReportStatus}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</div>

    <div id="box4" class="box">
	<table>
		<tr>
			<th>No(댓글)</th>		
			<th>신고아이디</th>		
			<th>신고유형</th>		
			<th>신고일자</th>		
			<th>처리현황</th>		
		</tr>
		<c:forEach items="${commentreportlist}" var="dto" varStatus="status">
		<c:if test="${dto.isCommentReportStatus eq '승인' || dto.isCommentReportStatus eq '거절'}">
		<tr onclick="location.href='/apa/admin/commentreportview.do?commentWriter=${dto.commentWriter}';">
			<td>${status.count}</td>
			<td>${dto.commentWriter}</td>
			<td>${dto.commentReportContent}</td>
			<td>${dto.commentReportDate}</td>
			<td>${dto.isCommentReportStatus}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
    </div>
</main>

