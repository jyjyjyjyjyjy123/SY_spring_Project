<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Example</title>
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
form[name="userJoin"] > input[typ="button"]{
	border: 1px solid gray;
	vertical-align: top;
	height: 3rem;
	box-sizing:border-box;
}
form[name="userJoin"] > inputp[name="addr1"], form[name="userJoin"] > input[name="addr2"]{
	width: 270px;

}
@media ( min-width : 1200px) .h3 , h3 {
	font-size : 2rem;
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
									style="margin-left: 40px;">회원가입</h1>
							</div>
							<div class="card-body">
								<form method="POST" action="/apa/auth/userregisterok.do"
									name="userJoin">
									<div id="my-info">
										<div id="my-info-name">
											<div class="my-info-name-child">회원선택</div>
											<div class="my-info-name-child">이름</div>
											<div class="my-info-name-child">아이디</div>
											<div class="my-info-name-child">비밀번호</div>
											<div class="my-info-name-child">비밀번호 확인</div>
											<div class="my-info-name-child">주민등록번호</div>
											<div class="my-info-name-child">연락처</div>
											<div class="my-info-name-child">이메일</div>
											<div class="my-info-name-child">주소</div><br>
<!-- 											<div class="my-info-name-child">개인정보 이용동의</div> -->
										</div>
										<div id="my-info-input">
											<div class="my-info-input-child">
												<input type="text" name="username"  required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="userid"  required>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="userpw" 
													required>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="pwchecked" 
													required>
											</div>
											<div class="my-info-input-child">
												<input type="text" size="7" id="ssn1" name="ssn1"
													 required> - <input type="password"
													size="9" id="ssn2" name="ssn2"  required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="tel1" size="4"  required>
												- <input type="text" name="tel2" size="4" 
													required> - <input type="text" name="tel3" size="4"
													 required>
											</div>
											<div class="my-info-input-child">
												<input type="email" name="useremail"
													 required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="zipcode" maxlength="5" readonly>
												<input type="button" value="우편번호검색" id="address_btn"><br>
												<input type="text" name="addr1" readonly>
												<input type="text" name="addr2">												
											</div>
											<!-- <div class="my-info-input-child">
												<input type="checkbox" name="info" id="info" required>
											</div>
 -->											<input type="hidden" name="auth" value="user">
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
            	
          
                if (!checkUserId($('input[name=userid]').val())) {
                	
                    return false;
                } 
                
                 else if (!checkPassword($('input[name=userid]').val(), $('input[name=userpw]').val(), $('input[name=pwchecked]').val())) {
                    return false;
                    
                } 
                
                else if (!checkMail($('input[name=useremail]').val())) {
                    return false;
                
                } 
                
                else if (!checkName($('input[name=username]').val())) {
                    return false;
                    
                
                } 
                
                else if (!checkBirth($('input[name=ssn1]').val(), $('input[name=ssn2]').val())) {
                    return false;
                } 
                
                /*  else if (!clickCheck($('input[name=info]'))) {
                    return false;
                }  */
                
                document.userJoin.submit();
            }
            
            function clickCheck(target) {
                document.querySelectorAll(`input[type=checkbox]`)
                    .forEach(el => el.checked = false);
                target[0].checked = true;
            } 
            
            function checkExistData(value, dataName) {
                if (value == "") {
                    alert(dataName + "입력해주세요!");
                    return false;
                }
                return true;
            }

            function checkUserId(userid) {
             	
                if (!checkExistData(userid, "아이디를"))
                    return false;

                var idRegExp = /^(?=.*?[a-z])(?=.*?[0-9]).{4,12}$/;
                if (!idRegExp.test(userid)) {
                    alert("아이디는 영문 소문자와 숫자 4~12자리로 입력해야합니다!");
                    $('input[name=userid]').val("");
                    $('input[name="userid"]').focus();
                    return false;
                }
                return true;
            }

             function checkPassword(userid, userpw, pwchecked) {
            	 
                if (!checkExistData(userpw, "비밀번호를"))
                    return false;
                if (!checkExistData(pwchecked, "비밀번호 확인을"))
                    return false;
                var pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,16}$/;
                if (!pwRegExp.test(userpw)) {
                    alert("비밀번호는 영문 대소문자와 특수문자, 숫자 4~16자리로 입력해야합니다!");
                    $('input[name=userpw]').val("");
                    $('input[name="userpw"]').focus();
                    return false;
                }

                if (userpw != pwchecked) {

                    alert("두 비밀번호가 맞지 않습니다.");
                    $('input[name=userpw]').val("");
                    $('input[name=pwchecked]').val("");
                    $('input[name="pwchecked"]').focus();
                    return false;
                }

                if (userid == userpw) {
                    alert("아이디와 비밀번호는 같을 수 없습니다!");
                    $('input[name=userid]').val("");
                    $('input[name=userpw]').val("");
                    $('input[name="userpw"]').focus();
                    return false;
                }
                return true;
            }

            
            function checkMail(useremail) {
            	 
                if (!checkExistData(useremail, "이메일을"))
                    return false;
                var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
                if (!emailRegExp.test(useremail)) {
                    alert("이메일 형식이 올바르지 않습니다!");
                    $('input[name=useremail]').val("");
                    $('input[name="useremail"]').focus();
                    return false;
                }
                return true;

            }

            
            function checkName(username) {
            	 
                if (!checkExistData(username, "이름을"))
                    return false;

                var nameRegExp = /^[가-힣]{2,15}$/;
                if (!nameRegExp.test(username)) {
                    alert("이름이 올바르지 않습니다.");
                    $('input[name=username]').val("");
                    $('input[name="username"]').focus();
                    return false;
                }
                return true;
            }

            function checkBirth(ssn1, ssn2) {
            	 
                if (!checkExistData(ssn1, "주민등록번호를")
                    || !checkExistData(ssn2, "주민등록번호를"))
                    return false;

                var totalSsn = "" + ssn1 + ssn2;

                var ssnArr = new Array();
                var sum = 0;
                var plus = 2;

                for (var i = 0; i < 12; i++) {
                    ssnArr[i] = totalSsn.charAt(i);
                    if (i >= 0 && i <= 7) {
                        sum += totalSsn[i] * plus;
                        plus++;
                        if (i == 7)
                            plus = 2;
                    } else {
                        sum += totalSsn[i] * plus;
                        plus++;
                    }
                }

                if (ssnArr.length < 12) {
                    alert("주민등록번호는 13자리 입니다.");
                    $('input[name=ssn1').val("");
                    $('input[name=ssn2]').val("");
                    $('input[name="ssn1"]').focus();
                    return false;
                }

                var result = 11 - (sum % 11) % 10
                if (result != totalSsn.charAt(12)) {
                    alert("유효하지않은 주민번호입니다.");
                    $('input[name=ssn1').val("");
                    $('input[name=ssn2]').val("");v
                    $('input[name="ssn1"]').focus();
                    return false;
                }
                return true;

            } 

        </script>
        
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		        	
		        	document.userJoin.addr1.value = fullAddr;
		        	document.userJoin.zipcode.value = data.zonecode;
		        	document.userJoin.addr2.focus();
		        }
		    }).open();

			});
		</script>
</body>
</html>








