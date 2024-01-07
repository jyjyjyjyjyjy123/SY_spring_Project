<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
input {
	border: 1px solid #c6c6c6;
	text-align: center;
	border-radius: 5px;
	outline-color: #1cc88a;
}

#ssn1 {
	background-color: white;
}

#ssn2 {
	background-color: white;
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
	padding-left: 20px;
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

.my-info-input-child {
	
}

#info-register-btn {
	text-align: center;
}

#register-btn {
	border: 0;
	width: 7em;
	height: 2em;
	color: white;
	font-size: 1em;
	border-radius: 0.35rem;
	background-color: #5BC1AC;
}

.mb-5 {
	margin-bottom: 3rem !important;
	margin-top: 3rem !important;
}

.h3, h1, h2, h3, h4, h5, h6 {
	margin-top: 0;
	margin-bottom: 0.5rem;
	font-weight: 500;
	line-height: 1.2;
	padding-top: 40px;
}

form[name="userJoin"]>input[typ="button"] {
	border: 1px solid gray;
	vertical-align: top;
	height: 3rem;
	box-sizing: border-box;
}

form[name="userJoin"]>inputp[name="addr1"], form[name="userJoin"]>input[name="addr2"]
	{
	width: 270px;
}

@media ( min-width : 1200px) .h3 , h3 {
	font-size
	
	 
	
	:
	
	 
	
	2rem
	
	
	;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<div id="wrapper">
		<main id="main">
			<div class="container-fluid">

				<!-- Content Row -->
				<div class="row">
					<!-- Area Chart -->
					<div class="col-xl-12">
						<div class="card shadow mb-5" style="margin: 0 auto; width: 80%;">
							<!-- Card Header - Dropdown -->
							<div
								class="d-sm-flex align-items-center justify-content-between mb-4">
								<h1 class="h3 mb-0 text-gray-800 hansans"
									style="margin-left: 40px;">
									약국 <small>회원가입</small>
								</h1>
							</div>
							<div class="card-body">
								<form method="POST" action="/apa/auth/pharmacyregisterok.do"
									name="pharmacyJoin">
									<div id="my-info">
										<div id="my-info-name">
											<div class="my-info-name-child">상호명</div>
											<div class="my-info-name-child">사업자등록번호</div>
											<div class="my-info-name-child">아이디</div>
											<div class="my-info-name-child">비밀번호</div>
											<div class="my-info-name-child">비밀번호 확인</div>
											<div class="my-info-name-child">연락처</div>
											<div class="my-info-name-child">이메일</div>
											<div class="my-info-name-child">주소</div>
											<!-- <div class="my-info-name-child">개인정보 이용동의</div> -->
										</div>
										<div id="my-info-input">
											<div class="my-info-input-child">
												<input type="text" name="pharmacyName"  required>
											</div>
											<div class="my-info-input-child">
												<input type="text" size="3" id="ssn1" name="ssn1"> -
												<input type="text" size="2" id="ssn2" name="ssn2"> -
												<input type="text" size="5" id="ssn3" name="ssn3">
											</div>
											<div class="my-info-input-child">
												<input type="text" name="pharmacyId" required>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="pharmacyPw" 
													required>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="pwchecked" 
													required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="tel1" size="4"  required>
												- <input type="text" name="tel2" size="4" 
													required> - <input type="text" name="tel3" size="4"
													 required>
											</div>
											<div class="my-info-input-child">
												<input type="email" name="pharmacyEmail"
													 required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="zipcode" maxlength="5" readonly>
												<input type="button" value="우편번호검색" id="address_btn"><br>
												<input type="text" name="addr1" readonly> <input
													type="text" name="addr2">
											</div>
										<!-- 	<div class="my-info-input-child">
												<input type="checkbox" name="info" id="info" required>
											</div> -->
											<input type="hidden" name="auth" value="pharmacy">
										</div>
									</div>

									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}">
									<div id="info-register-btn">
										<input type="button" id="register-btn" value="가입하기"
											onclick="checkAll()">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


		</main>
	</div>



	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
 		
            function checkAll() {
            	
          
                if (!checkUserId($('input[name=pharmacyId]').val())) {
                 	
                    return false;
                } 
                
                else if (!checkPassword($('input[name=pharmacyId]').val(), $('input[name=pharmacyPw]').val(), $('input[name=pwchecked]').val())) {
                    return false;
                    
                } 
                
                else if (!checkMail($('input[name=pharmacyEmail]').val())) {
                    return false;
                
                } 
                
                else if (!checkName($('input[name=pharmacyName]').val())) {
                    return false;
                    
                
                } 
                
                
              /*   else if (!clickCheck($('input[name=info]'))) {
                    return false;
                } */
                
                document.pharmacyJoin.submit();
            }
            
            /* function clickCheck(target) {
                document.querySelectorAll(`input[type=checkbox]`)
                    .forEach(el => el.checked = false);
                target[0].checked = true;
            } */
            
            function checkExistData(value, dataName) {
                if (value == "") {
                    alert(dataName + "입력해주세요!");
                    return false;
                }
                return true;
            }

            function checkUserId(pharmacyId) {
             	
                if (!checkExistData(pharmacyId, "아이디를"))
                    return false;

                var idRegExp = /^(?=.*?[a-z])(?=.*?[0-9]).{4,12}$/;
                if (!idRegExp.test(pharmacyId)) {
                    alert("아이디는 영문 소문자와 숫자 4~12자리로 입력해야합니다!");
                    $('input[name=pharmacyId]').val("");
                    $('input[name="pharmacyId"]').focus();
                    return false;
                }
                return true;
            }

             function checkPassword(pharmacyId, pharmacyPw, pwchecked) {
            	 
                if (!checkExistData(pharmacyId, "비밀번호를"))
                    return false;
                if (!checkExistData(pwchecked, "비밀번호 확인을"))
                    return false;
                var pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,16}$/;
                if (!pwRegExp.test(pharmacyPw)) {
                    alert("비밀번호는 영문 대소문자와 특수문자, 숫자 4~16자리로 입력해야합니다!");
                    $('input[name=pharmacyPw]').val("");
                    $('input[name="pharmacyPw"]').focus();
                    return false;
                }

                if (pharmacyPw != pwchecked) {

                    alert("두 비밀번호가 맞지 않습니다.");
                    $('input[name=pharmacyPw]').val("");
                    $('input[name=pwchecked]').val("");
                    $('input[name="pwchecked"]').focus();
                    return false;
                }

                if (pharmacyId == pharmacyPw) {
                    alert("아이디와 비밀번호는 같을 수 없습니다!");
                    $('input[name=pharmacyId]').val("");
                    $('input[name=pharmacyPw]').val("");
                    $('input[name="pharmacyPw"]').focus();
                    return false;
                }
                return true;
            }

            
            function checkMail(pharmacyEmail) {
            	
                if (!checkExistData(pharmacyEmail, "이메일을"))
                    return false;
                var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
                if (!emailRegExp.test(pharmacyEmail)) {
                    alert("이메일 형식이 올바르지 않습니다!");
                    $('input[name=pharmacyEmail]').val("");
                    $('input[name="pharmacyEmail"]').focus();
                    return false;
                }
                return true;

            }

            
            function checkName(pharmacyName) {
            	
                if (!checkExistData(pharmacyName, "이름을"))
                    return false;

                var nameRegExp = /^[가-힣]{2,15}$/;
                if (!nameRegExp.test(pharmacyName)) {
                    alert("이름이 올바르지 않습니다.");
                    $('input[name=pharmacyName]').val("");
                    $('input[name="pharmacyName"]').focus();
                    return false;
                }
                return true;
            }

           
        </script>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
			const address_btn = document.querySelector("#address_btn");
			address_btn.addEventListener("click",() => {
				
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	
		        	let fullAddr = '';
		        	let extraAddr = '';
		        	
		        	if(data.userSelectedType === 'R'){
		        		fullAddr = data.roadAddress;	        	
		        	} else {
		        		fullAddr = data.jibunAddress;
		        	}
		        	
		        	if(data.userSelectedType ==='R'){
		        		if(data.bname !== ''){
		        			extraAddr += data.bname;
		        		}
		        		if(data.bulidingName !== ''){
		        			extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);	
		        		}
		        		
		        		fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
		        	}
		        	
		        	document.pharmacyJoin.addr1.value = fullAddr;
		        	document.pharmacyJoin.zipcode.value = data.zonecode;
		        	document.pharmacyJoin.addr2.focus();
		        }
		    }).open();

			});
		</script>
</body>
</html>








