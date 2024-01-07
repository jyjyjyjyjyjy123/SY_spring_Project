<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
    /* 색상 정의 */
    :root {
        --button-background: #edf0f7;
        --button-hover: #dddfeb;
    }

    /* 스타일 적용 */
    main {
        margin-top: 5rem;
    }

    form {
        margin: 0 auto;
        max-width: 400px;
    }

    .btn-primary {
        background-color: var(--button-background);
        color: black;
        border: none;
    }

    .btn-primary:hover {
        background-color: var(--button-hover);
    }
</style>

<main class="container">
    <form id="blacklistForm">
        <div class="mb-3">
            <label for="userId" class="form-label">아이디</label>
            <input type="text" class="form-control" id="userId" name="userId" required>
        </div>
        <div class="mb-3">
            <label for="blacklistReason" class="form-label">사유</label>
            <input type="text" class="form-control" id="blacklistReason" name="blacklistReason" required>
        </div>
        <input type="button" class="btn btn-primary btn-lg btn-block" value="등록" onclick="add();">
        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='/apa/admin/blacklist.do';">뒤로가기</button>
    </form>
</main>

<script>
	function add() {
	    let obj = {
	        userId: $('input[name=userId]').val(),
	        blacklistReason: $('input[name=blacklistReason]').val()
	    };
	
	    $.ajax({
	        type: 'POST',
	        url: '/apa/admin/blacklistadd',
	        headers: {'Content-Type': 'application/json', '${_csrf.headerName}': '${_csrf.token}'},
	        data: JSON.stringify(obj),
	        dataType: 'json',
	        success: result => {
	            if (result == 1) {
	                location.href = '/apa/admin/blacklist.do';
	            } else {
	                alert('failed');
	            }
	        },
	        error: (a, b, c) => {
	            console.log(a, b, c);
	        }
	        });
	}
</script>      
