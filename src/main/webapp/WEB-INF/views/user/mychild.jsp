<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#list {
		text-align: center;
	}
	
	#list > thead > tr > th {
		color: #858796;
		font-size: 1.3rem;
		background-color: #edf0f7;
		font-weight: lighter;
		border-right: 1px solid #CCC;
	}

	
	#list > thead > tr > th:nth-child(1) {
		width: 150px;
	}
	
	#list > thead > tr > th:nth-child(2) {
		width: 250px;
	}
	
	#list > thead > tr > th:nth-child(3) {
		width: 150px;
	}
	
	#list > thead > tr > th:nth-child(4) {
		width: 150px;
	}
	
	#list > tbody > tr > td {
		font-size: 1.2rem;
		color: #858796;
		border-bottom: 1px solid #edf0f7;
		border-right: 1px solid #edf0f7;
	}
	
	#list > thead > tr > th:last-child {border-right: 0;}
	#list > tbody > tr > td:last-child {border-right: 0;}
	
	#list > tbody > tr > td > input {
		text-align: center;
	}
	
	#list > tbody > tr > td > div > input {
		text-align: center;
	}
	
	#list > tbody > tr > td:nth-child(1) > input {
		width: 148px;
	}
	
	#list > tbody > tr > td:nth-child(2) > div > input {
		width: 80px;
	}
	
	#list > tbody > tr > td:nth-child(3) > div > input {
		width: 60px;
	}
	
	#list > tbody > tr > td:nth-child(4) > div {
		display: flex;
		justify-content: space-evenly;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	
	#list > tbody > tr > td:nth-child(4) > div > i {
		font-size: 2rem;
		cursor: pointer;
	}
	
	#list > tbody > tr > td:nth-child(4) > div > i:hover {
		color: #3b3b3b;
	}
	
	.out, .in, .add {
		margin-top: 20px;
		background-color: #edf0f7;
		color: #858796;
		border: 0;
		border-radius: 5px;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 5px;
		padding-bottom: 5px;
		/* font-size: 1.2rem; */
	}
	
	.out:hover , .in:hover , .add:hover {
		background-color: #dddfeb;
	}
	
	#add, #btnAdd {
		display: none;
	}
	
	#add > tbody > tr > th {
		padding-right: 3rem;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	input {
		border: 1px solid #c6c6c6;
		text-align: center;
		border-radius: 5px;
		outline-color: #1cc88a;
	}
	
	#name {
		width: 13rem;
	}
	
	#ssn1 {
		width: 5.5rem;
	}
	
	#ssn2 {
		width: 6.5rem;
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
					<h5 class="m-0 font-weight-bold">내 자녀</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<table id="list">
						<thead>
							<tr>
								<th>이름</th>
								<th>주민등록번호</th>
								<th>관계</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

					<div>
						<button class="out" id="toggleAdd" type="button">자녀 등록</button>
					</div>

					<table id="add">
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name" maxlength="10"></td>
						</tr>
						<tr>
							<th>주민등록번호</th>
							<td><input type="text" name="ssn1" id="ssn1" maxlength="6">
								- <input type="text" name="ssn2" id="ssn2" maxlength="7">
							</td>
						</tr>
					</table>
					<div id="btnAdd">
						<button class="add" type="button" onclick="add(${seq});">등록하기</button>
					</div>
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
	    myChild.style.backgroundColor = '#DDDFEB';

	    myMedi.setAttribute('href', '/apa/user/' + seq + '/mymedi.do');
	    myBookmark.setAttribute('href', '/apa/user/' + seq + '/mybookmark.do');
	    myBox.setAttribute('href', '/apa/user/' + seq + '/mybox.do');
	    myReview.setAttribute('href', '/apa/user/' + seq + '/myreview.do');
	}
	
	load(${seq});
	
	function load(seq) {
		
		$('#list > tbody').html('');
		
		$.ajax ({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mychild',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: list => {
				$(list).each((index, item) => {
					$('#list > tbody').append(`
						<tr>
							<td>\${item.childName}</td>
							<td>\${item.childSSNs}-\${item.childSSNe}
								<div></div>
							</td>
							<td>
								<div>\${item.userRelation}</div>
								<input type="hidden" name="relation" value="\${item.userRelation}">
							</td>
							<td>
								<div>
									<i class="fas fa-fw fa-edit" onclick="edit(\${item.childSeq});"></i>
									<i class="fas fa-fw fa-times" onclick="del(\${item.childSeq});" id="delete-child"></i>
								</div>
							</td>
						</tr>				
					`);
					
				});
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}

	$('#toggleAdd').click(function() {
		
		//alert($('#add').css('display'));
		
		 
		if ($('#add').css('display') == 'none') {
			$('#add').css('display', 'table');
			$(this).removeClass('out');
			$(this).addClass('in');
			$(this).text('접기');
			$('#btnAdd').css('display', 'block');
			$("#name").focus();
			if ($('input[name=relation]').val() == null) {
				$('#add tr:nth-child(3)').html('');
				$('#add tr:nth-child(2)').after(`
					<tr>
						<th>관계</th>
						<td>
							<select name="parent" id="parent">
								<option value="부">부</option>
								<option value="모">모</option>
							</select>
						</td>
					</tr>
				`);
				$('#btnAdd').html('');
				$('#btnAdd').append(`
					<button class="add" type="button" onclick="add2(${seq});">등록하기</button>
				`);
			} else {
				$('#btnAdd').html('');
				$('#btnAdd').append(`
					<button class="add" type="button" onclick="add1(${seq});">등록하기</button>
				`);
			}
		} else {
			$('#add').css('display', 'none');
			$(this).removeClass('in');
			$(this).addClass('out');
			$(this).text('자녀 등록');
			$('#btnAdd').css('display', 'none');
		} 
				
		
	});

	
	function edit(seq) {
		 
			//클릭 > 수정 버튼(<span>) 
			
			let name = $(event.target).parents('tr').children().eq(0).text();
			
			$(event.target).parents('tr').children().eq(0).append(`<input type="text" name="editChildName" value="\${name}" maxlength="10">`);
			
			$(event.target).parents('tr').children().eq(3).children().html(`<i class="fas fa-fw fa-edit" onclick="editOk(\${seq});"></i>`);
	}
	
	function editOk(seq) {
		
		let obj = {
				childName: $('input[name=editChildName]').val()
		};
		
		$.ajax({
			type: 'PUT',
			url: '/apa/api/user/' + seq + '/mychild',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
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
	
	function del(seq) {
		
		if(confirm('정말로 탈퇴하시겠습니까?')) {
			$.ajax({
				type: 'PATCH',
				url: '/apa/api/user/' + seq + '/mychild',
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

	function add1(seq) {
		
		let obj = {
				userSeq: userSeq,
				childName: $('input[name=name]').val(),
				childSSNs: $('input[name=ssn1]').val(),
				childSSNe: $('input[name=ssn2]').val()
		};
		
		$.ajax({
			type: 'POST',
			url: '/apa/api/user/' + seq + '/mychild',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				if (result == 1) {
					load(userSeq);
					
					//입력 폼 초기화
					$("#name").val('');
					$("#ssn1").val('');
					$("#ssn2").val('');					
					
				} else {
					alert('failed');
				}
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
	}	

	function add2(seq) {
		
		let obj = {
				userSeq: userSeq,
				childName: $('input[name=name]').val(),
				childSSNs: $('input[name=ssn1]').val(),
				childSSNe: $('input[name=ssn2]').val(),
				userRelation: $('select[name=parent]').val()
		};
		
		$.ajax({
			type: 'POST',
			url: '/apa/api/user/' + seq + '/myfirstchild',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				if (result == 1) {
					load(userSeq);
					$('#toggleAdd').click();
					$('#add tr:nth-child(3)').html('');
					//입력 폼 초기화
					$("#name").val('');
					$("#ssn1").val('');
					$("#ssn2").val('');					
					
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