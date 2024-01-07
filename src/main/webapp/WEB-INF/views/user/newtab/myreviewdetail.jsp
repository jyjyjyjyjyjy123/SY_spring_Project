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
	
	#box {
		height: 20px;
	}
	
	#text-box {
		width: 80%;
		height: 220px;
		margin: 0 auto;
		display: grid;
		/* justify-content: center; */
	}
	
	#q-box {
		display: grid;
	}
	
	#qContent {
		width: 100%;
		height: 200px;
		resize: none;
		background-color: #edf0f7;
		border-color: white;
		border-left-width: 0px;
		border-right-width: 0px;
		border-top-width: 2px;
		border-bottom-width: 0px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		box-shadow: 1px;
		padding-left: 10px;
		outline-color: #858796;
		color: #48494e;
		font-size: 1rem;
	}
	
	#list {
		text-align: center;
		margin: 0 auto;
		width: 80%;
		border-spacing: 0;
		font-size: 1.2rem;
	}
	
	#list tr td:nth-child(1) {
		width: 150px;
	}
	
	#list tr td:nth-child(2) {
		width: 100px;
	}
	
	#list tr td:nth-child(3) {
		width: 100px;
	}
	
	#list tr td:nth-child(4) {
		width: 150px;
	}
	
	#list tr:nth-child(1) td {
		background-color: #edf0f7;
		border-right: 1px solid #CCC;
		border-bottom: 1px solid #CCC;
		color: #48494e;
	}
	
	
	#list tr:nth-child(3) td {
		background-color: #edf0f7;
		color: #858796;
	}
	
	#list tr:nth-child(2) td {
		background-color: white;
		border-bottom: 1px solid #CCC;
		border-right: 1px solid #CCC;
		color: #48494e;
	}
	
	#list tr:nth-child(4) td {
		background-color: white;
		color: #858796;
	}
	
	#list tr:nth-child(1) td:last-child {
		border-right: 0;
	}
	
	#list tr:nth-child(2) td:last-child {
		border-right: 0;
	}
	
	#txt-box {
		width: 80%;
		margin: 0 auto;
		color: #48494e;
		font-size: 1.2rem;
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
		border-radius: 5px;
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
	
	#tag-box {
		width: 80%;
		margin: 0 auto;
		display: flex;
		flex-flow: row wrap;
	    justify-content: space-evenly;
	}
	
	.tag {
		border-radius: 15px;
		padding-top: 3px;
		padding-bottom: 3px;		
		width: 150px;
		text-align: center;
		margin-bottom: 10px;
		color: white;	
	}
	
	#goodTag { background-color: #2bc194; }
	
	#badTag { background-color: tomato; }
</style>



<h1>리뷰 작성</h1>

<div id="box"></div>

<hr>

<div id="box"></div>
<div id="text-box">
	<div id="q-box">
	</div>
</div>

<table id="list">
	<tr>
		<td>병원명</td>
		<td>진료 의사</td>
		<td>진료 방식</td>
		<td>방문 날짜</td>
	</tr>
	<tr>
	</tr>
</table>

<div id="box"></div>
<div id="txt-box">태그</div>
<hr id="txt-hr">
<div id="box"></div>

<div id="tag-box">
</div>

<div id="box"></div>

<div class="btn" onclick="window.close()">창 닫기</div>

<div id="box"></div>
<div id="box"></div>

<script>

	getUserReviewDetail(${seq});
	getUserReviewDetailTag(${seq});
	
	function getUserReviewDetail(seq) {
		
		$('#q-box').html('');
		$('#list > tbody > tr:nth-child(2)').html('');
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/myreview/getuserreviewdetail',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: dto => {
				
				$('#q-box').append(`
					<textarea id="qContent" name="content" disabled>\${dto.reviewContent}</textarea>
				`);
				
				$('#list > tbody > tr:nth-child(2)').append(`
					<td>\${dto.hospitalName}</td>
					<td>\${dto.doctorName}</td>
					<td>\${dto.treatmentWay}</td>
					<td>\${dto.appointmentDate}</td>
				`);				
				
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}

	function getUserReviewDetailTag(seq) {
		
		$('#tag-box').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/myreview/getuserreviewdetailtag',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					
					let tagList = item.tagType == '긍정'
					? `<div id="goodTag" class="tag">\${item.tagContent}</div>`
					: `<div id="badTag" class="tag">\${item.tagContent}</div>`;
					
					$('#tag-box').append(`
						\${tagList}
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}
	
</script>