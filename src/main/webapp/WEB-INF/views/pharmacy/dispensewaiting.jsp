<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<style>

  .display {
            border-collapse: collapse;
            width: 100%;
        }
        .display th, .display td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        .display th {
            background-color: #f2f2f2;
        }
        
        #dispense-list-btn {
		text-align: center;
		}
		
		#list-btn {
			border: 0;
			background-color: #edf0f7;
			color: #424263;
			width: 7em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		
		#finishBtn{
			border: 0;
			background-color: #edf0f7;
			color: #424263;
			width: 6em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		
		#rejectBtn{
			border: 0;
			background-color: #edf0f7;
			color: #424263;
			width: 4em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		#approveBtn{
			border: 0;
			background-color: #edf0f7;
			color: #424263;
			width: 4em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		#searchBtn{
			border: 0;
			background-color: #dadce2;
			color: #424263;
			width: 4em;
			height: 2em;
			border-radius: 0.35rem;
			font-size: 1em;
		}
		
		
		.button-class:hover {
		    border: 5px solid #5BC1AC; /* 강조 효과를 주고 싶은 색상으로 변경하세요 */
		}
		#pagebar {
		    text-align: center;
		}
		
		.sort-btn {
		    background: none;
		    border: none;
		    padding: 0;
		    font: inherit;
		    cursor: pointer;
		    outline: inherit;
		}
		
		
.border-left-waiting {
	border-left: 0.25rem solid #bdcac5 !important;
}

.border-bottom-waiting {
	border-bottom: 0.25rem solid #edf0f7 !important;
}

.border-left-dispensing {
	border-left: 0.25rem solid #b6c3be !important;
}

.border-bottom-dispensing {
	border-bottom: 0.25rem solid #1cc88a !important;
}

.border-left-complete {
	border-left: 0.25rem solid #a4b3ad !important;
}

.border-bottom-complete {
	border-bottom: 0.25rem solid #36b9cc !important;
}

.border-left-pickup {
	border-left: 0.25rem solid #98a9a2 !important;
}

.border-bottom-pickup {
	border-bottom: 0.25rem solid #f6c23e !important;
}


.text-waiting {
	color: #1d449d !important;
}

a.text-waiting:hover, a.text-waiting:focus {
	color: #224abe !important;
}

.text-dispensing {
	color: #1d449d !important;
}

a.text-dispensing:hover, a.text-dispensing:focus {
	color: #13855c !important;
}

.text-complete {
	color: #1d449d !important;
}

a.text-complete:hover, a.text-complete:focus {
	color: #258391 !important;
}

.text-pickup {
	color: #1d449d !important;
}

a.text-pickup:hover, a.text-pickup:focus {
	color: #dda20a !important;
}


		

</style>

<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">					

					<!-- Page Heading -->
					<div class="col-auto">
						<i class="fas fa-pills fa-2x text-navy-300"></i>
					</div>
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800 hansans"
							style="padding-top: 28px;">조제 진행 목록: 제조대기</h1>
					</div>
				</nav>
				
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">

						<!-- 제조중 -->
						<div class="col-xl-3 col-md-6 mb-4 button-class" id="waiting">
							<div class="card border-left-waiting shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">제조 대기</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="waitingCount">${cntDTO.waitingCnt} 건 </div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 40%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4 button-class" id="dispensing">
							<div class="card border-left-dispensing shadow h-100 py-2"
								id="dispensing">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">제조중
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="dispensingCount">${cntDTO.dispensingCnt} 건</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 60%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-prescription-bottle-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4 button-class" id="complete">
							<div class="card border-left-complete shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1 onclick="addBorderEffect(this, 'waiting')">제조
												완료</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="completeCount">${cntDTO.dispenseFinCnt} 건</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 75%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4 button-class" id="pickup">
							<div class="card border-left-pickup shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div 
												class="text-xs font-weight-bold text-info text-uppercase mb-1">수령 완료</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="pickUpCount">${cntDTO.pickUpFinCnt} 건</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 100%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-shopping-basket fa-2x text-gray-300"></i>
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
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<button type="button" class="sort-btn" id="latestBtn">최신순</button>
									<h6 class="m-0 font-weight-bold text-primary">제조대기</h6>
									
								</div>
								<table id="dispense" class="display" style="width: 100%">
							    <thead>
							        <tr>
							            <th>제조번호</th>
							            <th>병원이름</th>
							            <th>환자성명</th>
							            <th>연락처</th>
							            <th>요청일자</th>
							            <th>수령예정일자</th>
							            <th>수령방법</th>
							            <th>진행상태</th>
							            <th>확인</th>
							        </tr>
							    </thead>
							    <tbody>
							        <c:forEach items="${dispenseWaiting}" var="dto">
							            <tr>
							                <td>${dto.dispenseListSeq}</td>                                                
							                <td>${dto.hospitalName}</td>
							                <td>${dto.userName}</td>
							                <td>${dto.userTel}</td>
							                <td>${dto.appointmentDate}</td>
							                <td>${dto.regdate}</td>
							                <td>${dto.pickUpWay}</td>
							                <td>${dto.dispenseStatus}</td>
							                <td><input type="checkbox" name="dispenseIds" value="${dto.dispenseListSeq}"></td>	
							            </tr>       
							        </c:forEach>        
							    </tbody>
							</table>
							<div style="margin-top: 10px; text-align: center;">
							    <button id="approveBtn">승인</button>
							    <button id="rejectBtn">거부</button>
							</div>
							
							<div id="pagebar">${pagebar}</div>
							
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-area">
									<canvas id="myAreaChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				
			</div>
		</div>	
	<script>
	 
	const pharmacyId = 'sla0623';	
		
	 
		$(document).ready(function() {
		    // 제조 대기 클릭 시
			 $("#waiting").click(function() {
			        location.href = "/apa/pharmacy/" + pharmacyId +"/dispensewaiting.do";
			    });

			    // 제조 중 클릭 시
			    $("#dispensing").click(function() {
			        location.href = "/apa/pharmacy/" + pharmacyId +"/dispensing.do";
			    });

			    // 제조 완료 클릭 시
			    $("#complete").click(function() {
			        location.href = "/apa/pharmacy/" + pharmacyId +"/dispensecomplete.do";
			    });

			    // 수령 완료 클릭 시
			    $("#pickup").click(function() {
			        location.href = "/apa/pharmacy/" + pharmacyId +"/dispensepickup.do";
			    });
		});
		  
	
		      
		$(document).ready(function() {
		    $('#approveBtn').on('click', function() {
		        const selectedItems = document.querySelectorAll('input[name="dispenseIds"]:checked');

		        if (selectedItems.length === 0) {
		            alert("선택된 처방내역이 없습니다.");
		            return; // 선택된 항목이 없으면 함수 종료
		        }

		      //  alert("선택된 항목 수: " + selectedItems.length);
		        const confirmApproval = confirm("선택한 처방내역을 승인하시겠습니까?");
		        const dispenseIds = Array.from(selectedItems).map(item => parseInt(item.value));
		       // alert("선택한 dispenseListSeq: " + dispenseIds.join(','));
		       // console.log(dispenseIds);	//여기까지 찍힘
		        
		        const data = {
		        	    id: pharmacyId,
		        	    action: 'approve',
		        	    dispenseIds: dispenseIds.join(',')
		        	};

	        	const jsonData = JSON.stringify(data);
		        
		        if (confirmApproval) {
		            const url = '/apa/api/pharmacy/' + pharmacyId + '/dispensewaiting';	//제조대기에 보내서 값 업데이트 함
		           
		            
		            $.ajax({
		                type: 'PUT',
		                url: '/apa/api/pharmacy/' + pharmacyId + '/dispensewaiting',
		                dataType: 'text',
		                beforeSend : function(xhr) {
		                     xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
		                  },
		                data: JSON.stringify({ id:pharmacyId
    										,action:'approve'
		                					, dispenseIds: dispenseIds.join(',')
		                						}), 
		                //traditional: true,
		                contentType: 'application/json; charset=UTF-8',		            
		                success: function(response) {
		                    alert('성공적으로 승인되었습니다.'); 
		                    location.reload(); // 페이지 새로고침
		                },
		                error: function(a, b, c) {
		                	alert('실패');
							console.log(a, b, c);
							console.error("에러 발생:", error);
		                }
		               
		            });
		        } else {
		            alert("처리가 취소되었습니다.");
		        }
		    });
		});
		
		
		
		$("#rejectBtn").click(function () {
			  const selectedItems = document.querySelectorAll('input[name="dispenseIds"]:checked');

		        if (selectedItems.length === 0) {
		            alert("선택된 처방내역이 없습니다.");
		            return; // 선택된 항목이 없으면 함수 종료
		        }

		        //alert("선택된 항목 수: " + selectedItems.length);
		        const confirmApproval = confirm("선택한 처방내역을 거절하시겠습니까?");
		        const dispenseIds = Array.from(selectedItems).map(item => parseInt(item.value));
		       // alert("선택한 dispenseListSeq: " + dispenseIds.join(','));
		       // console.log(dispenseIds);	
		        
		        const data = {
		        	    id: pharmacyId,
		        	    action: 'approve',
		        	    dispenseIds: dispenseIds.join(',')
		        	};

	        	const jsonData = JSON.stringify(data);
		        
		        if (confirmApproval) {
		            const url = '/apa/api/pharmacy/' + pharmacyId + '/dispensewaiting';	//제조대기에 보내서 값 업데이트 함
		           
		            
		            $.ajax({
		                type: 'PUT',
		                url: '/apa/api/pharmacy/' + pharmacyId + '/dispensewaiting',
		                dataType: 'text',
		                beforeSend : function(xhr) {
		                     xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
		                  },
		                data: JSON.stringify({ id:pharmacyId
  											,action:'reject'
		                					, dispenseIds: dispenseIds.join(',')
		                						}), 
		                //traditional: true,
		                contentType: 'application/json; charset=UTF-8',		            
		                success: function(response) {
		                    alert('성공적으로 거절되었습니다.'); 
		                    location.reload(); // 페이지 새로고침
		                },
		                error: function(a, b, c) {
		                	alert('실패');
							console.log(a, b, c);
							console.error("에러 발생:", error);
		                }
		               
		            });
		        } else {
		            alert("처리가 취소되었습니다.");
		        }
		    });
		
		$(document).ready(function() {
			$('#latestBtn').on('click', function() {
				location.reload(); // 페이지 새로고침
			});
		});
		
		
	</script>		