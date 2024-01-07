<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>

<style>

	.tblcontainer {
		text-align: center;
    	margin: auto;
	}
	
	table {
		margin-left: 20px;
		margin-right: 20px;
		width: 100%;
	}
	
	table td:nth-child(1) { width: 100px; }
	table td:nth-child(2) { width: 100px; }
	table td:nth-child(3) { width: 200px; }
	table td:nth-child(4) { width: 200px; }
	table td:nth-child(5) { width: 400px; }
	table td:nth-child(6) { width: auto; }

	table tr {
		height: 40px;
		border-bottom: 1px solid #e3e6f0;
	}
	
	table tr:last-child {
		border-bottom: none;
	}
	
	table tr th {
		background-color: #edf0f7;
		text-align: center;
		/* width: 1000px; */
		border-right: 1px solid #e3e6f0;
		padding-left: 20px;
		padding-right: 10px;
	}
	
	table tr td {
		text-align: center;
		padding-left: 10px;
		padding-right: 20px;
	}
	
	.btncontainer {
		text-align: right;
    	margin: auto;
    	margin-right: 20px;
    	margin-bottom: 10px;
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

	<div class="btncontainer">
		<button type="button" onclick="location.href='/apa/admin/blacklistadd.do';">추가</button>
	</div>
	
	<div class="tblcontainer">
	<table class=vertical>
		<tr>
			<th></th>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>블랙리스트 등록일자</th>
			<th>블랙리스트 사유</th>
		</tr>
		<c:forEach items="${blacklist}" var="dto" varStatus="status">
		<tr>
			<%-- <td><input type="checkbox" value="${dto.blacklistSeq}"></td> --%>
			<td>
	            <input type="checkbox" class="hiddenCheckbox" id="hiddenCheckbox">
	            <!-- 보이지 않는 span 요소에 blacklistSeq 값을 저장합니다. -->
	            <span class="hiddenValue" hidden>${dto.blacklistSeq}</span>
        	</td>
			<td>${status.count}</td>
			<td>${dto.userId}</td>
			<td>${dto.userName}</td>
			<td>${dto.blacklistDate}</td>
			<td>${dto.blacklistReason}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	
	<div class="btncontainer">
		<button type="button" id="delbtn">삭제</button>
	</div>


<script>

/* 	document.addEventListener("DOMContentLoaded", function () {
	    // 모든 hiddenCheckbox 요소에 대해 반복
	    var checkboxes = document.querySelectorAll('.hiddenCheckbox');
	    checkboxes.forEach(function (checkbox) {
	        // checkbox의 value 값을 가져와서 span에 넣음
	        var hiddenValue = checkbox.nextElementSibling;
	        hiddenValue.textContent = checkbox.value;
	        // checkbox의 value를 빈 문자열로 설정하여 화면에서 감춤
	        checkbox.value = '';
	    });
	}); */

	function blacklistaddview() {
		location.href = "/apa/admin/blacklistadd.do";
	}
	
/* 	$("#delbtn").click(
			
			function() {
				let obj = {
					blacklistSeq : ${dto.blacklistSeq}
				};
				
				$.ajax({
					type : 'POST',
					url : 'http://localhost:8090/apa/admin/blacklistdel',
					headers : {
						'Content-Type' : 'application/json'
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
					},
					data : JSON.stringify(obj),
					dataType : 'json',
					success : function(result) {
					},
					error : function(a, b, c) {
						console.log(a, b, c);
					}
				}); */
				
			    
			        $("#delbtn").click(function () {
			            // 체크된 체크박스 중에서 첫 번째 체크박스의 blacklistSeq 값을 가져옴
			            var blacklistSeq = $(".hiddenCheckbox:checked:first").closest("tr").find(".hiddenValue").text();

			            // 선택된 blacklistSeq 값을 서버로 전송
			            $.ajax({
			                type: 'POST',
			                url: '/apa/admin/blacklistdel',
			                headers: {
			                    'Content-Type': 'application/json',
			                    '${_csrf.headerName}': '${_csrf.token}'
			                },
			                data: JSON.stringify({ blacklistSeq: blacklistSeq }),
			                dataType: 'json',
			                success: function (result) {
			                	location.href = '/apa/admin/blacklist.do';
			                },
			                error: function (a, b, c) {
			                    console.log(a, b, c);
			                }
			            });
			        });
</script>