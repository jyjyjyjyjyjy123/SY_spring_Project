<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- patient.jsp -->

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-12 col-lg-7 rgst-div">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">내원환자</h5>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<table id="register-list" class="list">
						<thead>
							<tr>
								<th>번호</th>
							</tr>
							<%-- <c:if test="${registerList.size() != 0}">
								<tr>
									<th>번호</th>
									<th>예약번호</th>
									<th>접수자</th>
									<th>예약일시</th>
									<th>의사</th>
									<th>상세증상</th>
									<th>신청일시</th>
									<th>확인</th>
								</tr>
							</c:if> --%>
						</thead>

						<tbody>

							<tr>
								<td>${patientList.size()}</td>
							</tr>
							<%-- <c:forEach items="${registerList}" var="dto" varStatus="status">
								<tr
									onclick="location.href='/apa/hospital/diagnosis/register-view.do?mediSeq=${dto.mediSeq}';">
									<td>${status.count}</td>
									<td>${dto.mediSeq}</td>
									<td>${dto.userName}</td>
									<td>${dto.treatmentDate}</td>
									<td>${dto.doctorName}</td>
									<c:if test="${dto.symptom == null}">
										<td class="symptomNull">(미작성)</td>
									</c:if>
									<c:if test="${dto.symptom != null}">
										<td>${dto.symptom}</td>
									</c:if>
									<td>${dto.regdate}</td>
									<td>
										<button type="button" name="btnApproval" id="btnApproval"
											onclick="approvalRegister('${dto.mediSeq}');">승인</button>
										<button type="button" name="btnDecline" id="btnDecline"
											onclick="declineRegister('${dto.mediSeq}');">거절</button>
									</td>
								</tr>
							</c:forEach> --%>

							<%-- <c:if test="${registerList.size() == 0}">
								<h4 class="null-msg">오늘 신청된 예약이 없습니다.</h4>
							</c:if> --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<script>

	//사이드바 css설정
	$('#side-main-patient > a').css('background-color', '#dddfeb');
	
</script>