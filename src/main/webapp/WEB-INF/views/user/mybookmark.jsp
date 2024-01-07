<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

	#favorite {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
	}

	.cardHospital {
		border: 0;
		border-radius: 10px;
		background-color: #edf0f7;
		width: 47%;
		position: relative;
		padding: 20px;
		cursor: pointer;
	}

	.cardHospital:nth-child(even) {
		margin-top: 20px;
		margin-bottom: 20px;
		margin-right: 20px;
	}

	.cardHospital:nth-child(odd) {
		margin-top: 20px;
		margin-bottom: 20px;
		margin-left: 20px;
	}
	
	#hName {
		font-size: 1.3rem;
		color: #858796;
	}
	
	#check {
		color: tomato;
	}
	
	#delete {
		position: absolute;
	    left: 94%;
	    top: 8%;
	    cursor: pointer;
   		font-size: 1.2rem;
		display: none;
	}
	
	#box2, #box3 {
		color: #858796;
	}
	
	a:hover {
		text-decoration: none;
	}
	
	.cardHospital:hover #hName {
		color: #CCC;
	}

	.cardHospital:hover #delete {
		display: block;
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
					<h5 class="m-0 font-weight-bold">즐겨찾기 병원</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body" id="favorite">
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
	    myBookmark.style.backgroundColor = '#DDDFEB';
	    
	    myBox.setAttribute('href', '/apa/user/' + seq + '/mybox.do');
	    myReview.setAttribute('href', '/apa/user/' + seq + '/myreview.do');
	}
	
	load(${seq});
	
	function load(seq) {
		
		$('.card-body').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mybookmark',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					$('.card-body').append(`
						<div class="cardHospital">
							<i class="fas fa-fw fa-times" id="delete" onclick="deleteFavor(\${item.bookmarkSeq});"></i>
							<a href="/apa/search/view.do?seq=\${item.hospitalId}&loginuserseq=\${seq}">
								<div id="box1">
									<font id="hName">
										\${item.hospitalName}
									</font>
								</div>
								<div id="box2">
									<font id="check">
										\${item.openCheck}
									</font>
									\${item.openTime} ~ \${item.closeTime}
								</div>	
								<div id="box3">
									\${item.hospitalAddress}
								</div>
							</a>	
						</div>				
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}

	function deleteFavor(seq) {
		
		if(confirm('정말로 삭제하시겠습니까?')) {
			
			$.ajax({
				type: 'DELETE',
				url: '/apa/api/user/' + seq + '/mybookmark',
				beforeSend : function(xhr) {
	                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	            },
				dataType: 'json',
				success: result => {
					if (result == 1) {
						load(userSeq);
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