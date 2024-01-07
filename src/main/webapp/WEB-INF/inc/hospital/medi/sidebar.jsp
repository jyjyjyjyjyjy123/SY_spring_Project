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
	<li class="nav-item active"><a class="nav-link" href="/apa/hospital/${id}/medi/today/appointment">
			<i class="far fa-hospital"></i> <span>내 진료</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">진료 관리</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li id="side-main-today" class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-stethoscope"></i> <span>오늘의
				진료</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<!-- <h6 class="collapse-header">Custom Components:</h6> -->
				<a id="side-sub-today-appointment" class="collapse-item" href="/apa/hospital/${id}/medi/today/appointment">오늘의 예약 내역</a> 
				<a id="side-sub-today-treatment" class="collapse-item" href="/apa/hospital/${id}/medi/today/treatment">오늘의 진료 내역</a>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li id="side-main-all" class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> 
		<i class="fas fa-file-medical"></i> <span>모든 진료</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a id="side-sub-all-appointment" class="collapse-item" href="/apa/hospital/${id}/medi/all/appointment">모든 예약 내역</a> 
				<a id="side-sub-all-treatment" class="collapse-item" href="/apa/hospital/${id}/medi/all/treatment">모든 진료 내역</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">환자 관리</div>

	<!-- Nav Item - Charts -->
	<li id="side-main-patient" class="nav-item"><a class="nav-link" href="/apa/hospital/${id}/medi/patient"> 
		<i class="fas fa-hospital-user"></i> <span>내원환자</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

</ul>
