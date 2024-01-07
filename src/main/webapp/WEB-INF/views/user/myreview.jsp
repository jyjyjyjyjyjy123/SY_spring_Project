<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

	.list {
		text-align: center;
	}
		
	.list > thead > tr > th {
	    color: #858796;
		font-size: 1.3rem;
	    background-color: #edf0f7;
	    font-weight: lighter;
	    border-right: 1px solid #CCC;
    }

	.list > thead > tr > th:last-child, .list > tbody > tr > td:last-child {
		border-right: 0;
	}

	.list > tbody > tr > td {
		font-size: 1.2rem;
		color: #858796;
		padding-top: 8px;
		padding-bottom: 8px;
		border-right: 1px solid #edf0f7;
		border-bottom: 1px solid #edf0f7;
	}
	
	#qlist > thead > tr > th:nth-child(1) { width: 250px; }
	#qlist > thead > tr > th:nth-child(2) { width: 400px; }
	#qlist > thead > tr > th:nth-child(3) { width: 250px; }
	#qlist > thead > tr > th:nth-child(4) { width: 150px; }
	#qlist > thead > tr > th:nth-child(5) { width: 100px; }
	
	.btn {
	    background-color: #edf0f7;
	    color: #858796;
	    border: 0;
	    border-radius: 5px;
	    padding-left: 10px;
	    padding-right: 10px;
	    padding-top: 5px;
	    padding-bottom: 5px;
	}
	
	.btn:hover {
		background-color: #dddfeb;
	}
</style>
<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12">
			<div class="card shadow mb-5">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold">의학 상담 보관함</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<h5 class="m-0 font-weight-bold"
						style="padding-bottom: 20px;">리뷰 관리</h5>
					<table id="qlist" class="list">
						<thead>
							<tr>
								<th>병원명</th>
								<th>리뷰 내용</th>
								<th>등록 날짜</th>
								<th>상세 보기</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="userSeq" value="${seq}">

<script>

	const myPage = document.getElementById('myPage');
	const myInfo = document.getElementById('myInfo');
	const myChild = document.getElementById('myChild');
	const myMedi = document.getElementById('myMedi');
	const myBookmark = document.getElementById('myBookmark');
	const myBox = document.getElementById('myBox');
	const myReview = document.getElementById('myReview');
	const userSeq = $('input[name=userSeq]').val();
	
	loadLink(userSeq);
	
	function loadLink(seq) {
	    myPage.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    myInfo.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    myChild.setAttribute('href', '/apa/user/' + seq + '/mychild.do');
	    myMedi.setAttribute('href', '/apa/user/' + seq + '/mymedi.do');
	    myBookmark.setAttribute('href', '/apa/user/' + seq + '/mybookmark.do');
	    myBox.setAttribute('href', '/apa/user/' + seq + '/mybox.do');
	    
	    myReview.setAttribute('href', '/apa/user/' + seq + '/myreview.do');
	    myReview.style.backgroundColor = '#DDDFEB';
	}
	
	myReviewList(${seq});
	
	function myReviewList(seq) {
		
		$('#qlist > tbody').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/myreview',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					
					let reviewList = item.isReviewDelete == 'y' 
					? ``
					: `	
						<tr>
							<td>\${item.hospitalName}</td>
							<td>\${item.reviewContent}</td>
							<td>\${item.appointmentDate}</td>
							<td><button onclick="myReviewDetail(\${item.reviewSeq})" class="btn">상세 보기</button></td>
							<td><button onclick="deleteReview(\${item.reviewSeq})" class="btn">삭제</button></td>				
						</tr>`;	
					$('#qlist > tbody').append(`
						\${reviewList}
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}


	function myReviewDetail(seq) {
		
        var winHeight = 1000;
        var winWidth = 800;
        var winTop = (screen.height / 2) - (winHeight / 2);
        var winLeft = (screen.width / 2) - (winWidth / 2);
        window.open('http://localhost:8090/apa/user/' + seq + '/myreviewdetail.do', '리뷰 상세 조회', 'height=' + winHeight + ',width=' + winWidth + ',top=' + winTop + ',left=' + winLeft);		
		
	}	
	
	function deleteReview(seq) {
		
		if(confirm('정말로 삭제하시겠습니까?')) {
			
			$.ajax({
				type: 'PUT',
				url: '/apa/api/user/' + seq +'/myreview/deletereview',
				beforeSend : function(xhr) {
	                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	            },
				dataType: 'json',
				success: result => {
					if (result == 1) {
						myReviewList(${seq});
						alert('정상적으로 삭제하였습니다.');
					} else {
						alert('failed');
					}
				},
				error: (a,b,c) => {
					console.log(a,b,c);
				}
			});
	    }
        
	}	
	
</script>