<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table.open {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 5px solid #98a9a2;
	margin: 20px 10px;
}

table.open th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.open td {
	width: 349px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.info-container {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
}

.info-item {
	margin-right: 20px;
	margin-bottom: 10px;
}

.checkbox-label {
	margin-left: 5px;
}

#open-update-btn {
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

.open-info table {
	font-weight: bold; /* 글씨체를 bold로 지정 */
	border-radius: 10px;
}

.border-left-time {
	border-left: 0.25rem solid #bdcac5 !important;
}

.border-bottom-time {
	border-bottom: 0.25rem solid #edf0f7 !important;
}

.border-left-night {
	border-left: 0.25rem solid #b6c3be !important;
}

.border-bottom-night {
	border-bottom: 0.25rem solid #1cc88a !important;
}

.border-left-holiday {
	border-left: 0.25rem solid #a4b3ad !important;
}

.border-bottom-holiday {
	border-bottom: 0.25rem solid #36b9cc !important;
}

.border-left-dayoff {
	border-left: 0.25rem solid #98a9a2 !important;
}

.border-bottom-dayoff {
	border-bottom: 0.25rem solid #f6c23e !important;
}

.border-left-dispense {
	border-left: 0.25rem solid #778982 !important;
}

.border-bottom-dispense {
	border-bottom: 0.25rem solid #f6c23e !important;
}

.text-time {
	color: #1d449d !important;
}

a.text-time:hover, a.text-time:focus {
	color: #224abe !important;
}

.text-night {
	color: #1d449d !important;
}

a.text-night:hover, a.text-night:focus {
	color: #13855c !important;
}

.text-holiday {
	color: #1d449d !important;
}

a.text-holiday:hover, a.text-holiday:focus {
	color: #258391 !important;
}

.text-dayoff {
	color: #1d449d !important;
}

a.text-dayoff:hover, a.text-dayoff:focus {
	color: #dda20a !important;
}

.text-dispense {
	color: #1d449d !important;
}

a.text-dispense:hover, a.text-dispense:focus {
	color: #dda20a !important;
}

.opening-c {
    flex: 0 0 25%;
    max-width: 20%;
  }
  
</style>
<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
	 <div id="content">
			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Page Heading -->
				<div class="col-auto">
					<i class="fas fa-laptop-medical fa-2x text-navy-300"></i>
				</div>
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800 hansans"
						style="padding-top: 28px;">운영 관리</h1>
				</div>
			</nav>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">

						<!-- 운영시간 -->
						<div class="opening-c col-md-6 mb-4">
							<div class="card border-left-time shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-time text-uppercase mb-1">
												운영시간</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${pharmacyOpeningInfo.openTime}
												~ ${pharmacyOpeningInfo.closeTime}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clock fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Earnings (Monthly) Card Example -->
						<div class="opening-c col-md-6 mb-4">
							<div class="card border-left-night shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-night text-uppercase mb-1">
												야간 운영 여부</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${pharmacyOpeningInfo.isPharmarcyNightcare}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-moon fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Earnings (Monthly) Card Example -->
						<div class="opening-c col-md-6 mb-4">
							<div class="card border-left-holiday shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-holiday text-uppercase mb-1">
												휴일 운영 여부</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${pharmacyOpeningInfo.isPharmarcyHoliday}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar-check fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Earnings (Monthly) Card Example -->
						<div class="opening-c col-md-6 mb-4">
							<div class="card border-left-dayoff shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-dayoff mb-1">휴무
												요일</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${pharmacyOpeningInfo.pharmacyDayOff}요일</div>
												</div>
												<div class="col"></div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Pending Requests Card Example -->
						<div class="opening-c col-md-6 mb-4">
							<div class="card border-left-dispense shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-dispense text-uppercase mb-1">
												조제 여부</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${pharmacyOpeningInfo.isDispense}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-pills fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">운영 정보</h6>
									<div class="dropdown no-arrow"></div>
								</div>
								<div class="card-body">
									<div id="open-info">
										<table class="open" style="width: 50%;">
											<tr>
												<th scope="row">운영시간</th>
												<td>${pharmacyOpeningInfo.openTime}~ ${pharmacyOpeningInfo.closeTime}</td>
											</tr>
											<tr>
												<th scope="row">운영여부</th>
												<td>▪야간: ${pharmacyOpeningInfo.isPharmarcyNightcare} ▪휴일:
													${pharmacyOpeningInfo.isPharmarcyHoliday} ▪조제: ${pharmacyOpeningInfo.isDispense}</td>
											</tr>
											<tr>
												<th scope="row">휴무일</th>
												<td>${pharmacyOpeningInfo.pharmacyDayOff}요일</td>
											</tr>

										</table>
									</div>
								</div>
							<div id="open-update-btn">
								<button id="update-btn"
									onclick="location.href='/apa/pharmacy/opening/add.do">등록하기</button>
								<button id="update-btn"
									onclick="location.href='/apa/pharmacy/opening/edit.do">수정하기</button>
							</div>
							
							  <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                       <!-- Content Row -->

            <!-- End of Main Content -->

          

        </div>
        <!-- End of Content Wrapper -->

    </div>