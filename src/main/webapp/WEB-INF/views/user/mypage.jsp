<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>

	input {
		border: 1px solid #c6c6c6;
	    text-align: center;
	    border-radius: 5px;
	    outline-color: #1cc88a;
	}

	#message {
		width: 250px;
		border: 0;
		text-align: left;
		font-weight: bold;
		margin-left: 10px;
		background-color: white;
	}

	#id {
		cursor: not-allowed;
		background-color: #d3d3d3;
	}

	#ssn1 {
		cursor: not-allowed;
		background-color: #d3d3d3;
	}
	
	#ssn2 {
		cursor: not-allowed;	
		background-color: #d3d3d3;
	}

	#address {
		width: 25em;
	}

	#my-info {
		display: flex;
		align-items: center;
    	margin-bottom: 30px;
    	justify-content: flex-start;
	}

	#my-info-name {
    	color: #666666;
		height: 400px;
		display: grid;
		font-weight: bold;
		align-items: center;
		margin-right: 100px;
	}

	.my-info-name-child {
		height: 20px;
	}

	.my-info-name-child:last-child {
		margin-bottom: 0px;
	}
	
	#my-info-input {
		height: 400px;
		display: grid;
		align-items: center;
	}

	#info-update-btn {
		text-align: center;
	}
	
	#update-btn {
		border: 0;
		width: 7em;
		height: 2em;
 		color: #858796;
		font-size: 1em;
		border-radius: 0.35rem;
		background-color: #edf0f7;
	}
	
	#update-btn:hover {
		background-color: #dddfeb;
	}

	#delete-user {
		border: 0;
		color: #CCC;
		float: right;
		outline: none;
		font-size: small;
		background-color: white;
	}

	#delete-user:hover {
		text-decoration: none;
	}
	
	#btn {
		border: 0;
		margin-left: 10px;
		width: 3em;
 		color: #1cc88a;
		font-size: 1em;
		border-radius: 0.35rem;
		background-color: #edf0f7;		
	}

	#btn:hover {
		background-color: #dddfeb;		
	}

	.disabled {
		cursor: not-allowed;
		background-color: #d3d3d3;			
	}

</style>
<!-- <nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	Sidebar Toggle (Topbar)
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	Page Heading
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800 hansans" style="padding-top: 28px;">내
			정보 관리</h1>
	</div>
</nav> -->
<div class="container-fluid">
	
	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12">
			<div class="card shadow mb-5">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold">내 정보</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
						<div id="my-info">
							<div id="my-info-name">
								<div class="my-info-name-child">이름</div>
								<div class="my-info-name-child">아이디</div>
								<div class="my-info-name-child">비밀번호</div>
								<div class="my-info-name-child">비밀번호 확인</div>
								<div class="my-info-name-child">주민등록번호</div>
								<div class="my-info-name-child">연락처</div>
								<div class="my-info-name-child">이메일</div>
								<div class="my-info-name-child">주소</div>
								<div class="my-info-name-child">현재 비밀번호</div>
							</div>
							<div id="my-info-input">
								<div class="my-info-input-child">
									<input type="text" name="name" id="name" maxlength="10">
								</div>
								<div class="my-info-input-child">
									<input type="text" name="id" id="id" disabled>
								</div>
								<div class="my-info-input-child">
									<input type="password" name="pw" id="pw" maxlength="16" class="disabled" disabled><button id="btn">OFF</button>
								</div>
								<div class="my-info-input-child">
									<input type="password" name="pw-confirm" id="pw-confirm" maxlength="16" class="disabled" disabled><input type="text" id="message" disabled>
								</div>
								<div class="my-info-input-child">
									<input type="text" size="7" name="ssn1" id="ssn1" disabled> - 
									<input type="text" size="9" name="ssn2" id="ssn2" disabled>
								</div>
								<div class="my-info-input-child">
									<input type="text" name="tel1" id="tel1" size="4" maxlength="3"> - 
									<input type="text" name="tel2" id="tel2" size="4" maxlength="4"> - 
									<input type="text" name="tel3" id="tel3" size="4" maxlength="4">
								</div>
								<div class="my-info-input-child">
									<input type="text" name="email" id="email" required>
								</div>
								<div class="my-info-input-child">
									<input type="text" name="address" id="address" required maxlength="70">
								</div>
								<div class="my-info-input-child">
									<input type="password" name="inputCurrentPw" id="inputCurrentPw" required maxlength="16">
								</div>
							</div>
						</div>
						<%-- <input type="hidden" name="id" value="${dto.userId}" id="id"> --%>
<!-- 						<input type="hidden" name="currentPw" id="currentPw"> -->
						<input type="hidden" name="seq" value="<sec:authentication property="principal.dto1.userseq"/>" id="seq">
						<div id="info-update-btn">
							<button id="update-btn" onsubmit="return checkAll()" onclick="edit(${seq})">수정하기</button>
						</div>

						<button id="delete-user" type="button" onclick="del(${seq})">회원 탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const id = document.getElementById('id');
	const pw = document.getElementById('pw');
	const pwConfirm = document.getElementById('pw-confirm');
	const name = document.getElementById('name');
	const email = document.getElementById('email');
	const message = document.getElementById('message');
	const btn = document.getElementById('update-btn');
// 	const currentPw = document.getElementById('currentPw');
	const inputCurrentPw = document.getElementById('inputCurrentPw');
	const myPage = document.getElementById('myPage');
	const myInfo = document.getElementById('myInfo');
	const myChild = document.getElementById('myChild');
	const myMedi = document.getElementById('myMedi');
	const myBookmark = document.getElementById('myBookmark');
	const myBox = document.getElementById('myBox');
	const myReview = document.getElementById('myReview');
	const userSeq = $('input[name=seq]').val();
	
	loadLink(userSeq);

    var isOn = true;
    $("#btn").on("click", function() {
        isOn = !isOn;
        if (isOn) {
            $(this).text('OFF');
            $("#pw").prop('disabled', true);
            $("#pw-confirm").prop('disabled', true);
            $("#pw").addClass('disabled');
            $("#pw-confirm").addClass('disabled');
        } else {
            $(this).text('ON');
            $("#pw").prop('disabled', false);
            $("#pw-confirm").prop('disabled', false);
            $("#pw").removeClass('disabled');
            $("#pw-confirm").removeClass('disabled');
        }
	});
	
	function loadLink(seq) {
	    myPage.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    
	    myInfo.setAttribute('href', '/apa/user/' + seq + '/mypage.do');
	    myInfo.style.backgroundColor = '#DDDFEB';
	    
	    myChild.setAttribute('href', '/apa/user/' + seq + '/mychild.do');
	    myMedi.setAttribute('href', '/apa/user/' + seq + '/mymedi.do');
	    myBookmark.setAttribute('href', '/apa/user/' + seq + '/mybookmark.do');
	    myBox.setAttribute('href', '/apa/user/' + seq + '/mybox.do');
	    myReview.setAttribute('href', '/apa/user/' + seq + '/myreview.do');
	}
	
	load(${seq});
	
	function load(seq) {
		pw.value = '';
		pwConfirm.value = '';
		inputCurrentPw.value = '';
		message.value = '';
		
		$.ajax({
			type: 'GET',
			url: '/apa/api/user/' + seq + '/mypage',
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			dataType: 'json',
			success: dto => {
				$('input[name=seq]').val(dto.userSeq),
				$('input[name=id]').val(dto.userId),
				$('input[name=name]').val(dto.userName),
				$('input[name=ssn1]').val(dto.userSSNs),
				$('input[name=ssn2]').val(dto.maskingSSN),
				$('input[name=tel1]').val(dto.userTels),
				$('input[name=tel2]').val(dto.userTelm),
				$('input[name=tel3]').val(dto.userTele),
				$('input[name=email]').val(dto.userEmail),
				$('input[name=address]').val(dto.userAddress)				
// 				$('input[name=currentPw]').val(dto.userPw)				
			},
			error: (a,b,c) => {
				console.log(a,b,c);
			}
		});		
		
	}
	
	// 비밀번호와 비밀번호 확인이 일치하는지 검사하는 함수를 만듭니다.
	function checkPassword() {
		
		if (pwConfirm.value.length == 0) {
	        message.value = '';
	        btn.type = "submit";			    	
	    } else if (pw.value != pwConfirm.value) {
	        message.value = '비밀번호가 일치하지 않습니다.';
	        message.style.color = "tomato";
	        btn.type = "button";
	    } else {
	        message.value = '비밀번호가 일치합니다.';
	        message.style.color = "#5BC1AC";
	        btn.type = "submit";
	    }
		
		
	}
	
// 	function currentPwCheck() {

// 		if (currentPw.value != inputCurrentPw.value) {
// 			btn.type = "button";
// 		} else {
// 			btn.type = "submit";
// 		}
		
// 	}
	
	
// 	function changePassword() {
		
// 		if (pw.value != currentPw.value) {
				
// 			pwConfirm.setAttribute('required', '');
			
// 		} else if (pw.value == currentPw.value) {
			
// 			pwConfirm.removeAttribute('required');					
			
// 		}
		
// 	}
	
	// 이벤트 리스너를 추가하여 'pw-confirm'의 값이 변경될 때마다 함수를 실행합니다.
	pwConfirm.addEventListener('keyup', checkPassword);
	pw.addEventListener('keyup', changePassword);
	inputCurrentPw.addEventListener('keyup', currentPwCheck);
	
	
	document.getElementById('delete-user').addEventListener('click', function() {
	    if(confirm('정말로 탈퇴하시겠습니까?')) {
	        // 사용자가 확인을 선택한 경우, 폼을 제출합니다.
	        document.getElementById('delete-form').submit();
	    } else {
	        // 사용자가 취소를 선택한 경우, 이전 페이지로 돌아갑니다.
	    }
	});
	
	

	
	function edit(seq) {
		
		checkAll();
		
		function checkAll(){
		    if (!pw.disabled && !validatePassword(id.value, pw.value, pwConfirm.value)){
		        return false;
		    } else if(!checkMail(email.value)){
		        return false;
		    } else if(!checkName(name.value)){
		        return false;
		    }
		    return true;
		}
		
		function checkExistData(value, dataName){
		    if(value == ""){
		        alert(dataName + "입력해주세요!");
		        return false;
		    }
		    return true;
		}
		
		function validatePassword(id, pw, pwchecked) {
		    var pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
		    if(!pwRegExp.test(pw)){
		        alert("비밀번호는 영문 대소문자와 특수문자, 숫자 4~12자리로 입력해야합니다!");
		        pw.value = "";
		        pw.focus();
		        return false;
		    }
		
		    if(id == pw){
		        alert("아이디와 비밀번호는 같을 수 없습니다!");
		        pw.value = "";
		        pwConfirm.value = "";
		        pwConfirm.focus();
		        return false;
		    }
		    return true;
		}
		
		function checkMail(email){
		    if(!checkExistData(email, "이메일을"))
		        return false;
		    var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		    if(!emailRegExp.test(email)){
		        alert("이메일 형식이 올바르지 않습니다!");
		        email.value = "";
		        email.focus();
		        return false;
		    }
		    return true;
		
		}
		
		function checkName(name){
		    if(!checkExistData(name, "이름을"))
		        return false;
		    var nameRegExp = /^[가-힣]{2,10}$/;
		    if(!nameRegExp.test(name)){
		        alert("이름이 올바르지 않습니다.");
		        name.value = "";
		        name.focus();		        
		        return false;
		    }
		    return true;
		}
		
		let obj = {
			userSeq: $('input[name=seq]').val(),
			userName: $('input[name=name]').val(),
			userPw: $('input[name=pw]').val(),
			userTels: $('input[name=tel1]').val(),
			userTelm: $('input[name=tel2]').val(),
			userTele: $('input[name=tel3]').val(),
			userEmail: $('input[name=email]').val(),
			userAddress: $('input[name=address]').val(),
			inputCurrentPw: $('input[name=inputCurrentPw]').val()
		};
		
		$.ajax({
			type: 'PUT',
			url: '/apa/api/user/' + seq + '/mypage',
			headers: {'Content-Type': 'application/json'},
			beforeSend : function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
			data: JSON.stringify(obj),
			dataType: 'json',
			success: result => {
				if (result == 1) {
					alert("정상적으로 수정하였습니다.");
					load(seq);
				} else if (result == -5){
					alert('현재 비밀번호가 다릅니다.')
			        inputCurrentPw.value = "";
			        inputCurrentPw.focus();	
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
				url: '/apa/api/user/' + seq + '/mypage',
				beforeSend : function(xhr) {
	                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	            },
				dataType: 'json',
				success: result => {
					if (result == 1) {
						location.href = '/apa/main.do';
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