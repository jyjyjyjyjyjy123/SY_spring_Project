<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<tiles:insertAttribute name="mypageAsset" />
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper" style="background-color: #000000;">

		<tiles:insertAttribute name="sidebar" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<tiles:insertAttribute name="header" />
				
				<tiles:insertAttribute name="content" />
				

			</div>
			<!-- End of Main Content -->
			<tiles:insertAttribute name="footer" />
				

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	

	



</body>

</html>