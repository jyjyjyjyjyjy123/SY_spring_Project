<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<body>
	
	<!-- /reservation/select.jsp -->	
	<div class="maindiv">
		<form action="/apa/search/reservation/complete.do" method="GET">
		<div class="detail-userinfo-list">
			<div class="userinfo-list">
				<h1 class="userinfo-list-h1 hansans">상세정보 입력</h1>
				<table class = "detail-userinfo-table">
					<tr>
						<th>진료 대상</th>
						<td colspan="2">
							<input type="button" class="rezuser-choice-user dept-tag btn custom-btn" value="본인">
							<input type="button" class="rezuser-choice-child dept-tag btn custom-btn" value="자녀">
						</td>
					</tr>
					<tr class="rezuser-choice-hide">
						<th>자녀 선택</th>
						<td colspan="2">
							<c:forEach items="${childlist}" var="list">
								${list.childname}<input type="radio" class="choice-child" name="childseq" value="${list.childseq}" disabled="disabled">
							</c:forEach>
						</td>
					</tr>
					<tr class="rezuser-choice-hide">
						<th>자녀 주민등록번호</th>
						<td colspan="2">
							<input type="text" class="child-Firstssn" value="" style="width: 90px" disabled="disabled">- 
							<input type="text" class="child-lastssn" value="" style="width: 90px" disabled="disabled">
						</td>
					</tr>
					<tr>
						<th>본인 이름</th>
						<td colspan="2"><input type="text" name="username" value="${userlist.username}" style="width: 80px" required></td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td colspan="2">
							<input type="text" value="${firstssn}" style="width: 90px" required>- 
							<input type="text" value="${lastssn}" style="width: 90px" required>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">
							<input type="text" value="${firsttel}" style="width: 50px" required> -
							<input type="text" value="${middeltel}" style="width: 60px" required> -
							<input type="text" value="${lastltel}" style="width: 60px" required>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input type="text" value="${userlist.useraddress}"  style="width: 400px" required></td>
						
					</tr>					
					<tr>
						<th>상세사항</th>
						<td colspan="2"><textarea class="detail-userinfo-detail" name="symptom" cols="80" rows="8" ></textarea></td>

					</tr>
					<c:if test="${choicetype ne '건강검진' and choicetype ne 'drug'}">
						<tr>
							<th rowspan="4">처방 약 사후처리</th>
							<td class="oneclickservice" colspan="2">
								<div>
									<input type="button" class="detail-userinfo-button" value="원클릭">
									<p>원하는 약국에 예약을 동시에!</p>
								</div>
							</td>
						</tr>
						<tr class="oneclickhide">
							<th>병원 선택</th>
							<td>
								<select id="pharmacyid" name="pharmacyid" disabled>
									<option value="" selected disabled>약국을 선택해 주세요</option>
									<c:forEach items="${pharmacylist}" var="dto">
										<option value="${dto.pharmacyid}">${dto.pharmacyname} - ${dto.pharmacyaddress}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr class="oneclickhide">
							<th style = "width: 120px;">수령방법</th>
							<td>
								방문수령<input type="radio" name="pickupway" value="방문수령" checked="checked" disabled >
								퀵<input type="radio" name="pickupway" value="퀵" disabled >
							</td>
						</tr>
						<tr class="oneclickhide">
							<th>수령 시간</th>
							<td colspan="" id="timepickermaker">
								<input type="text" class="timepicker" name="choicepharmacytime" id="timepicker" readonly disabled>
							</td>
						</tr>
					</c:if>
				</table>
				<input type="hidden" name="hospitalid" value="${hospitalid}">
				<input type="hidden" name="userseq" value="${userseq}">
				<input type="hidden" name="treatmentway" value="${choicetype}">
				<input type="hidden" name="doctorseq" value="${choicedoc}">
				<input type="hidden" name="appointmentdate" value="${choicedate} ${choicetime}:00">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<button type="submit" class="reservation-button"> 예약하기 </button>
			</div>			
		</div>
		</form>
	</div>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script>
		let pharmacytime = {
				opentime : null,
				closetime : null
		};
		$('#pharmacyid').change(function() {
			let parmacyseq = $(event.target).val();
			$.ajax({
				type : 'POST',
				url : '/apa/search/reservation/pharmacychoice',
				headers : { 
					'Content-Type' : 'application/json'
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				data : parmacyseq,
				dataType : 'json',
				success : function(result){
					$('#timepickermaker').html('');
					$('#timepickermaker').append('<input type="text" class="timepicker" name="choicepharmacytime" id="timepicker" readonly>');					
					$('.timepicker').timepicker({
					    timeFormat: 'HH:mm',
					    interval: 30,
					    minTime: result.opentime,
					    maxTime: result.closetime,
					    defaultTime: '12:00',
					    startTime: result.opentime,
					    dynamic: false,
					    dropdown: true,
					    scrollbar: true
					});
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});
		
		$(".choice-child").change(function() {
			let childseq = $(event.target).val();
			$.ajax({
				type : 'POST',
				url : '/apa/search/reservation/child',
				headers : { 
					'Content-Type' : 'application/json'
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				data : childseq,
				dataType : 'json',
				success : function(result){
					$(".child-Firstssn").val(result.firstssn);
					$(".child-lastssn").val(result.lastssn); 					
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}); 
		
		$(".rezuser-choice-user").click(function() {
			$(".rezuser-choice-hide").slideUp();
			$('.rezuser-choice-hide input').attr("disabled", true);
			$('.rezuser-choice-hide input').attr("required", false);
		});
		
		$(".detail-userinfo-button").click(function() {
			if ($(".oneclickhide").is(":visible")){
				$(".oneclickhide").slideUp();
				$(".oneclickhide input").attr("disabled", true);
				$(".oneclickhide input").attr("required", false);
				$(".oneclickhide select").attr("disabled", true);
				$(".oneclickhide select").attr("required", false);
			} else {
				$(".oneclickhide").slideDown();
				$(".oneclickhide input").attr("disabled", false);
				$(".oneclickhide input").attr("required", true);
				$(".oneclickhide select").attr("disabled", false);
				$(".oneclickhide select").attr("required", true);
			}
		});
		$(".rezuser-choice-child").click(function() {
			if ($(".rezuser-choice-hide").is(":visible")){
				$(".rezuser-choice-hide").slideUp();
				$('.rezuser-choice-hide input').attr("disabled", true);
				$('.rezuser-choice-hide input').attr("required", false);
			} else {
				$(".rezuser-choice-hide").slideDown();
				$('.rezuser-choice-hide input').attr("disabled", false);
				$('.rezuser-choice-hide input').attr("required", true);
			}
		});
	</script>
</body>