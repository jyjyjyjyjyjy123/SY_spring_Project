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
	<li class="nav-item active"><a class="nav-link" href="/apa/pharmacy/info.do">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>My Pharmacy</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">운영</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="/apa/pharmacy/${id}/info.do"> 
			<i class="fas fa-hospital-user fa-2x"></i>
			 <span>내 정보</span>
		</a>
		
	</li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="/apa/pharmacy/${id}/opening.do"> 
			 <i class="fas fa-laptop-medical fa-2x"></i>
			 <span>운영관리</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">조제</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages">
			 <i class="fas fa-pills fa-2x "></i> <span>조제관리</span>
		</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">조제관리</h6>
				<a class="collapse-item" href="/apa/pharmacy/${id}/dispenselist.do">전체목록</a> 
				<a class="collapse-item" href="/apa/pharmacy/${id}/dispensewaiting.do">진행목록</a> 
				
			</div>
		</div>
	</li>

	
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">



	

</ul>
