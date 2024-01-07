<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<a class="navbar-brand" href="/apa/main.do" style="text-align: center;">
		<img src="/apa/resources/images/logo.png" class="logo img-fluid"
		alt="Kind Heart Charity" style="height: 100px; width: 100px;">
	</a>

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link">
			<i class="fas fa-fw fa-folder"></i> <span>관리자 님</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<!-- <div class="sidebar-heading">고객 관리</div> -->

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>일반회원</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="/apa/admin/user.do">회원 목록</a>
				<a class="collapse-item" href="/apa/admin/blacklist.do">블랙리스트</a>
				<a class="collapse-item" href="/apa/admin/reportlist.do">신고현황</a>
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="/apa/admin/hospital.do"> <i
			class="fas fa-fw fa-chart-area"></i> <span>병원회원</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="/apa/admin/pharmacy.do"> <i
			class="fas fa-fw fa-table"></i> <span>약국회원</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<!-- <div class="sidebar-heading">병원 관리</div> -->

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/apa/admin/afterlist.do"> <i
			class="fas fa-fw fa-wrench"></i> <span>병원 사후관리</span></a></li>

</ul>
