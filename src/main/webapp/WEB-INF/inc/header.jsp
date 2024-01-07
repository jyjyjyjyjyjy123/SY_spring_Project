<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<header class="site-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12 d-flex flex-wrap">
                        <p class="d-flex me-4 mb-0">
                            <i class="bi-geo-alt me-2"></i>
                            서울특별시 강남구 테헤란로 132 8층
                        </p>
                        <p class="d-flex mb-0">
                            <i class="bi-envelope me-2"></i>
                            <a href="mailto:info@company.com">
                                DoubleDragon@mail.com
                            </a>
                        </p>
                    </div>
                    <div class="col-lg-3 col-12 ms-auto d-lg-block d-none">
                        <ul class="social-icon">
                            <li class="social-icon-item">
                                <a href="/apa/auth/mylogin.do" class="social-icon-link bi-twitter"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="/apa/auth/mymy.do" class="social-icon-link bi-facebook"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="/apa/auth/myinfo.do" class="social-icon-link bi-instagram"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="/apa/auth/mylogout.do" class="social-icon-link bi-youtube"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-whatsapp"></a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </header>

        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                <a class="navbar-brand" href="/apa/main.do">
                    <img src="/apa/resources/images/logo.png" class="logo img-fluid" alt="Kind Heart Charity">
                    <span style="font-size: 2rem;display:grid;">
                        <div style="padding-top: 10px;height:30px;" class="hansans">아파! 어디가?</div>
                        <small style="font-size: 1rem;">Reserve Your Health</small>
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link click-scroll dropdown-toggle" href="/apa/search/list.do?loginuserseq=${loginuserseq}">병원/약국 찾기</a>

                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                <li><a class="dropdown-item" href="/apa/search/list.do?loginuserseq=${loginuserseq}">병원 찾기</a></li>
                                <li><a class="dropdown-item" href="/apa/search/pharmacylist.do">약국 찾기</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="/apa/advice/list.do?loginuserseq=${loginuserseq}">의학 상담</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link click-scroll dropdown-toggle" href="/selftest/${seq}/list.do">의학 정보</a>

                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                <li><a class="dropdown-item" href="#">의학 매거진</a></li>
                                <li><a class="dropdown-item" href="#">질병백과</a></li>
                               	<li>
								<sec:authorize access="hasRole('ROLE_USER')">
                                	<a class="dropdown-item" href="/apa/selftest/<sec:authentication property="principal.dto1.userseq"/>/list.do">셀프 테스트</a>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
                                	<a class="dropdown-item" href="/apa/selftest/-1/list.do">셀프 테스트</a>
								</sec:authorize>
                               	</li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="/apa/community/list.do">커뮤니티</a>
                        </li>

				<sec:authorize access="isAnonymous()">
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn btn"
						href="/apa/auth/mylogin.do">로그인</a></li>
					<li class="nav-item ms-3"><a
						class="nav-link custom-btn custom-border-btn btn"
						href="/apa/auth/clickregister.do">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('ROLE_USER')">
						<li class="nav-item ms-3"><a
							class="nav-link custom-btn custom-border-btn btn" href="/apa/user/<sec:authentication property='principal.dto1.userseq'/>/mypage.do">마이페이지</a>
						</li>
						<li class="nav-item ms-3">
							<form action="/apa/auth/mylogout.do" method="POST">
								<div>
									<button class="nav-link custom-btn custom-border-btn btn">로그아웃</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
						</li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_HOSPITAL')">
						<li class="nav-item ms-3"><a
							class="nav-link custom-btn custom-border-btn btn" href="/apa/hospital/counseling/${id}/list.do">마이페이지</a>
						</li>
						<li class="nav-item ms-3"><a
							class="nav-link custom-btn custom-border-btn btn" href="/apa/hospital/${id}/medi/today/appointment">내
								진료</a></li>
						<li class="nav-item ms-3">
						<form action="/apa/auth/mylogout.do" method="POST">
								<div>
									<button class="nav-link custom-btn custom-border-btn btn">로그아웃</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
						</li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_PHARMACY')">
						<li class="nav-item ms-3"><a
							class="nav-link custom-btn custom-border-btn btn" href="/apa/pharmacy/${id}/info.do">마이페이지</a>
						</li>
						<li class="nav-item ms-3"><form action="/apa/auth/mylogout.do" method="POST">
								<div>
									<button class="nav-link custom-btn custom-border-btn btn">로그아웃</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item ms-3"><a
							class="nav-link custom-btn custom-border-btn btn" href="/apa/admin/user.do">마이페이지</a>
						</li>
						<li class="nav-item ms-3"><form action="/apa/auth/mylogout.do" method="POST">
								<div>
									<button class="nav-link custom-btn custom-border-btn btn">로그아웃</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form></li>
					</sec:authorize>

				</sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>



