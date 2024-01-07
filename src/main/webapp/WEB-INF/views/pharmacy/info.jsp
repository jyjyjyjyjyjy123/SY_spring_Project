<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	#pharmacyId {
		cursor: not-allowed;
		background-color: #d3d3d3;
	}

	#pharmacySSNs {
		cursor: not-allowed;
		background-color: #d3d3d3;
	}
	
	#pharmacySSNm{
		cursor: not-allowed;	
		background-color: #d3d3d3;
	}
	#pharmacySSNe{
		cursor: not-allowed;	
		background-color: #d3d3d3;
	}

	#address {
		width: 25em;
	}

	#my-info {
		display: flex;
		align-items: center;
    	justify-content: flex-start;
    	margin-bottom: 30px;
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
	.my-info-input-child {
	}

	#info-update-btn {
		text-align: center;
	}
	
#update-btn {
		border: 0;
		width: 7em;
		height: 2em;
		color: #424263;
		font-size: 1em;
		border-radius: 0.35rem;
		background-color: #edf0f7;
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
	
</style>
<body id="page-top">
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Page Heading -->
				<div class="col-auto">
					<i class="fas fa-hospital-user fa-2x text-navy-300"></i>
				</div>
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800 hansans"
						style="padding-top: 28px;">내 정보</h1>
				</div>
			</nav>
			<div class="container-fluid">

				<!-- Content Row -->

				<div class="row">

					<!-- Area Chart -->
					<div class="col-xl-12">
						<div class="card shadow mb-5">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">내 정보</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<!-- <form method="POST" action="/apa/pharmacy/info/edit.do"> -->
									<div id="my-info">
										<div id="my-info-name">
											<div class="my-info-name-child">이름</div>
											<div class="my-info-name-child">아이디</div>
											<div class="my-info-name-child">비밀번호</div>
											<div class="my-info-name-child">비밀번호 확인</div>
											<div class="my-info-name-child">사업자등록번호</div>
											<div class="my-info-name-child">연락처</div>
											<div class="my-info-name-child">이메일</div>
											<div class="my-info-name-child">주소</div>
											<div class="my-info-name-child">현재 비밀번호</div>
										</div>
										<div id="my-info-input">
											<div class="my-info-input-child">
												<input type="text" name="name" id="name"
													value="${pharmacyInfo.pharmacyName}">
											</div>
											<div class="my-info-input-child">
												<input type="text" name="id" value="${pharmacyInfo.pharmacyId}"
													id="id" disabled>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="pw" value="${pharmacyInfo.pharmacyPw}"
													id="pw">
											</div>
											<div class="my-info-input-child">
												<input type="password" name="pw-confirm" id="pw-confirm">
												<div id="message" disabled></div>
											</div>
											<div class="my-info-input-child">
												<input type="text" value="${pharmacyInfo.pharmacySSNs}" size="3"
													id="pharmacySSNs" disabled> - <input type="text"
													value="${pharmacyInfo.pharmacySSNm}" size="2" id="pharmacySSNm"
													disabled> - <input type="text"
													value="${maskingSSN}" size="9" id="pharmacySSNe" disabled>

											</div>
											<div class="my-info-input-child">
												<input type="text" name="tel1" value="${pharmacyInfo.pharmacyTels}"
													size="4"> - <input type="text" name="tel2"
													value="${pharmacyInfo.pharmacyTelm}" size="4"> - <input
													type="text" name="tel3" value="${pharmacyInfo.pharmacyTele}"
													size="4">
											</div>
											<div class="my-info-input-child">
												<input type="text" name="email" value="${pharmacyInfo.pharmacyEmail}"
													required>
											</div>
											<div class="my-info-input-child">
												<input type="text" name="address" id="address"
													value="${pharmacyInfo.pharmacyAddress}" required>
											</div>
											<div class="my-info-input-child">
												<input type="password" name="inputCurrentPw"
													id="inputCurrentPw" required>
											</div>
										</div>
									</div>
									<input type="hidden" name="id" value="${pharmacyInfo.pharmacyId}"
										id="id"> <input type="hidden" name="currentPw"
										value="${pharmacyInfo.pharmacyPw}" id="currentPw"> <input
										type="hidden" name="ssn1" value="${pharmacyInfo.pharmacySSNs}" size="3"
										id="ssn1"> <input type="hidden" name="ssn2"
										value="${pharmacyInfo.pharmacySSNm}" size="2" id="ssn2"> <input
										type="hidden" name="ssn3" value="${maskingSSN}" size="9"
										id="ssn3">

									<div id="info-update-btn">
										<button id="update-btn">수정하기</button>
									</div>
								<!-- </form> -->
								<%-- <form method="GET" action="/apa/pharmacy/info/edit.do" id="delete-form">
										<button id="delete-user" type="button">회원 탈퇴</button>
										<input type="hidden" name="id" value="${dto.pharmacyId}">
									</form> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>