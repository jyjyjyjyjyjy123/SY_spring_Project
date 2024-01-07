<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

#login_button {
	width: 80%;
	background-color: #5bc1ac;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
}

#login_button:hover {
	background-color: #3f8f7b;
}

body {
	background-color: #f8f9fa;
	font-family: 'Roboto', sans-serif;
}

#main {
	margin: 130px auto;
	width: 60%;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

#main>h1 {
	color: #5bc1ac;
	font-size: 30px;
	text-align: center;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}



table.vertical {
	width: 80%;
	margin: 0 auto;
}

table.vertical input[type=text], table.vertical input[type=password] {
	width: 100%;
	display: block;
	margin: 0 auto;
}

#find {
	display: flex;
	justify-content: space-evenly;
	width: 50%;
	margin: 0 auto;
}

#login-box {
	height: 50px;
	display: flex;
	justify-content: space-around;
}

#btn-box {
	display: flex;
	justify-content: center;
}

.cb {
	display: none;
}

label {
	cursor: pointer;
	width: 100%;
	text-align: center;
	line-height: 50px;
	transition: all 0.5s;
}

.checked-label {
	color: white;
	background-color: #5bc1ac;
}
</style>
<body>

	<!--  
		*** 주의
		1. method="POST"
		2. action="/컨텍스트명/login"
		3. id : name="username"
		3. pw : name="password"
	-->
	<main id="main">
		<form action="/apa/login" method="POST" id="form1" onsubmit="return handleFormSubmission();">
			<div id="login-box">
				<label for="select_user" class="checked-label">일반회원</label> <input
					type="checkbox" id="select_user" name="checked" value="1"
					onclick="clickCheck(this)" class="cb" checked> <label
					for="select_hospital">병원</label> <input type="checkbox"
					id="select_hospital" name="checked" value="2"
					onclick="clickCheck(this)" class="cb"> <label
					for="select_pharmacy">약국</label> <input type="checkbox"
					id="select_pharmacy" name="checked" value="3"
					onclick="clickCheck(this)" class="cb">

			</div>
			<br> <br>
			<table class="vertical">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="username"
						placeholder="ID" required id="username"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="password"
						placeholder="Password" required></td>
				</tr>
			</table>
			<br>
			<div id="btn-box">
				<button class="in" id="login_button">login</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</form>
	</main>
	<script>
	function handleFormSubmission() {
        var checkboxes = document.querySelectorAll('#login-box input[type="checkbox"]');
        var selectedCheckbox = Array.from(checkboxes).find(checkbox => checkbox.checked);

        if (!selectedCheckbox) {
            alert('회원 유형을 선택해주세요.'); // 선택된 체크박스가 없을 경우 알림
           	resetForm();
            return false; // 폼 제출 방지
        }
      

    }
	
	 function resetForm() {
         $('#form1')[0].reset(); // jQuery를 사용한 폼 초기화
     }
	
    function clickCheck(target){
        document.querySelectorAll(`input[type=checkbox]`)
            .forEach(el => el.checked = false);

        target.checked = true;

    }

    function clickCheck(element) {
        var label = document.querySelector('label[for=' + element.id + ']');

        if (element.checked) {
            label.classList.add('checked-label');
        } else {
            label.classList.remove('checked-label');
        }

        // Ensure only one checkbox is checked at a time
        var checkboxes = document.querySelectorAll('#login-box input[type="checkbox"]');
        checkboxes.forEach(function(checkbox) {
            if (checkbox !== element) {
                checkbox.checked = false;
                document.querySelector('label[for=' + checkbox.id + ']').classList.remove('checked-label');
            }
        });
        sel = element.value;
    }
    
    let sel = 0;
    
    $('#form1').submit(function() {
    	//alert(sel);
    	$("#username").val(sel + $("#username").val());
    	//alert($("#username").val());
    });
</script>
</body>