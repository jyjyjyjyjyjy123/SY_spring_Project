<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    table {
        margin-left: 20px;
        margin-right: 20px;
        width: 100%;
        border-collapse: collapse;
    }

    table th, table td {
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
        border: none;
        border-radius: 5px;
        color: #edf0f7;
        font-size: 1.1rem;
        width: 100px;
        height: 40px;
        margin-right: 10px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #dddfeb;
    }

    .post-container {
        margin: 20px;
        padding: 20px;
        border: 1px solid #e3e6f0;
        border-radius: 5px;
    }

    .post-title {
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .post-content {
        margin-bottom: 20px;
    }
    button {
		border: none;
		border-radius: 5px;
		color: #000;
		font-size: 1.1rem;
		width: 80px;
		height: 40px;
		margin-right: 10px;
	}
	
	button:hover {
		background-color: #dddfeb;
	}
</style>
<main>

	<table>
		<tr>
			<th>No(댓글)</th>		
			<th>신고아이디</th>		
			<th>신고유형</th>		
			<th>신고일자</th>		
			<th>처리현황</th>		
		</tr>
		<c:forEach items="${commentreportview}" var="dto" varStatus="status">
			<td>${status.count}</td>
			<td>${dto.commentWriter}</td>
			<td>${dto.commentReportContent}</td>
			<td>${dto.commentReportDate}</td>
			<td>${dto.isCommentReportStatus}</td>
		</tr>
		<input type="text" name="commentReportSeq" id="commentReportSeq" value="${dto.commentReportSeq}" hidden>
		</c:forEach>
	</table>
	
	    <c:forEach items="${commentreportview}" var="dto" varStatus="status">
        <div class="post-container">
            <div class="post-title">${dto.communityCommentContent}</div>
            <div class="post-content">${dto.communityCommentDate}</div>
            <c:if test="${dto.isCommentReportStatus eq '접수'}">
	        	<button type="button" id="cokbtn">승인</button>
	        	<button type="button" id="cnobtn">거절</button>
            </c:if>
        </div>
    </c:forEach>

</main>

<script>
	$(document).ready(function () {
	    $("#cokbtn").click(function () {
	    	
	    	var commentReportSeq = $('#commentReportSeq').val();
	
	        $.ajax({
	            type: 'POST',
	            url: '/apa/admin/commentreportapprove',
	            headers: {
	                'Content-Type': 'application/json',
	                '${_csrf.headerName}': '${_csrf.token}'
	            },
	            data: JSON.stringify({ commentReportSeq: commentReportSeq }),
	            dataType: 'json',
	            success: function (result) {
	            	location.href = '/apa/admin/reportlist.do';
	            },
	            error: function (a, b, c) {
	                console.log(a, b, c);
	            }
	        });
	    });
	});
	
	$(document).ready(function () {
	    $("#cnobtn").click(function () {
	    	
	    	var commentReportSeq = $('#commentReportSeq').val();
	
	        $.ajax({
	            type: 'POST',
	            url: '/apa/admin/commentreportdecline',
	            headers: {
	                'Content-Type': 'application/json',
	                '${_csrf.headerName}': '${_csrf.token}'
	            },
	            data: JSON.stringify({ commentReportSeq: commentReportSeq }),
	            dataType: 'json',
	            success: function (result) {
	            	location.href = '/apa/admin/reportlist.do';
	            },
	            error: function (a, b, c) {
	                console.log(a, b, c);
	            }
	        });
	    });
	});
</script>