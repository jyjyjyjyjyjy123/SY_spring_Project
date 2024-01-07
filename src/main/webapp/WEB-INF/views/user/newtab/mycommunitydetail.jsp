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
	
	#box { height: 20px;}

	#text-box {
		width: 80%;
		height: 250px;
		margin: 0 auto;
		display: grid;
	}
	
	#q-box {
		display: grid;
	}	
	
	#title {
		font-size: 1.1rem;
		color: #545454;	
		background-color: #dddfe6;
		border: 0;
		padding-left: 10px;
		margin-bottom: 2px;
		outline-color: #09734d;
		outline: none;
	}
	
	#qContent {
		font-size: 1.1rem;
		height: 200px;
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
   		outline: none;
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

	#list tr:nth-child(2) td {
		background-color: white;
		color: #545454;
	}

	#list tr:nth-child(2) td {
		border-right: 1px solid #dddfe6;
		border-bottom: 1px solid #dddfe6;
	}	

	#list tr:nth-child(2) td:last-child {
		border-right: 0;
	}	

	#txt-box {
		width: 80%;
		margin: 0 auto;
		color: #858796;
		font-size: 1.2rem;
	}
	
	#txt-hr {
		border: 0;
		background: #858796;
		height: 2px;
		width: 80%;
		margin: 0 auto;	
	}

	#comment-box {
		display: grid;
		width: 100%;
		margin: 0 auto;
	}

	#comment {
		width: 100%;
		display: flex;
		flex-flow: row wrap;
		margin-bottom: 10px;
		justify-content: center;
	}

	#comment div:nth-child(1) {
		width: 15%;
		background-color: #dddfe6;
		color: #545454;
		display: flex;
		align-items: center;
		padding-left: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		border-top: 1px solid #dddfe6;
		border-bottom: 1px solid #dddfe6;
	}
	#comment div:nth-child(2) {
		background-color: white;
		color: #545454;
		width: 42%;
		height: 100%;
		display: flex;
		align-items: center;
		padding-left: 10px;
		padding-top: 3px;
		padding-bottom: 3px;
		border-top: 1px solid #dddfe6;
		border-right: 1px solid #dddfe6;
		border-bottom: 1px solid #dddfe6;
	}
	#comment div:nth-child(3) {
		background-color: #dddfe6;
		color: #545454;
		width: 20%;
		display: flex;
		align-items: center;
		padding-left: 9px;
		padding-top: 3px;
		padding-bottom: 3px;
		border-top: 1px solid #dddfe6;
		border-right: 1px solid #dddfe6;
		border-bottom: 1px solid #dddfe6;
	}

	.btn {
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
    	border: 0;
		justify-content: center;
		background-color: #edf0f7;
		transition: all 0.5s;
	}
	
	.btn:hover {
		background-color: #dddfeb;
	}
	
	#btn-box {
	    width: 250px;
	    margin: 0 auto;
	    display: flex;
	}
</style>


<h1>내 글 상세 보기</h1>

<div id="box"></div>

<hr>

<div id="box"></div>

<div id="text-box">
	<div id="q-box">
	</div>
</div>

<table id="list">
	<tr>
		<td>회원 ID</td>
		<td>게시 날짜</td>
		<td>댓글 수</td>
		<td>좋아요 수</td>
	</tr>
	<tr>
	</tr>
</table>

<div id="box"></div>

<div id="txt-box">댓글</div>
<hr id="txt-hr">

<div id="box"></div>

<div id="comment-box">
</div>

<div id="box"></div>
<div id="btn-box">
</div>

<script>

	getUserCommunityDetail(${seq});
	getUserCommunityComment(${seq});
	
	function getUserCommunityDetail(seq) {
		
		$('#q-box').html('');
		$('#list > tbody > tr:nth-child(2)').html('');
		$('#btn-box').html('');
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mybox/getusercommunitydetail',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: dto => {
				
				$('#q-box').append(`
					<input type="text" value="\${dto.communityTitle}" id="title" name="title">
					<textarea id="qContent" name="content">\${dto.communityContent}</textarea>
				`);
				
				$('#list > tbody > tr:nth-child(2)').append(`
					<td>\${dto.userID}</td>
					<td>\${dto.communityDate}</td>
					<td>\${dto.communityCommentCount}개</td>
					<td>\${dto.communityLikeCount}회</td>
				`);				
				
				$('#btn-box').append(`
					<div class="btn" onclick="window.close()">창 닫기</div>
					<button class="btn" onclick="UserCommunityUpdate(\${dto.communitySeq})">수정</button>
				`);
				
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}

	function getUserCommunityComment(seq) {
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mybox/getusercommunitycomment',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					$('#comment-box').append(`
						<div id="comment">
							<div>\${item.userID}</div>
							<div>\${item.communityCommentContent}</div>
							<div>\${item.communityCommentDate}</div>
						</div>
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}
	
	function UserCommunityUpdate(seq) {
		
		let obj = {
				communityTitle: $('input[name=title]').val(),
				communityContent: $('textarea[name=content]').val()
		};
		
		$.ajax({
			type: 'PUT',
			url: '/apa/api/user/' + seq + '/mybox/usercommunityupdate',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				if (result == 1) {
					alert('정상적으로 수정하였습니다.');
					getUserCommunityDetail(${seq});
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