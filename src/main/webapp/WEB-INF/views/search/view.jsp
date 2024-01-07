<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
</style>
<main>
	<div class="maindiv">
		<div>
			<div class="review-grid">
				<h2>${dto.hospitalname}</h2>
				<div class="social-icon-item">
					<button type="button" id="bookmark-button"
						class="bookmark-icon-link bi-star-fill"
						<c:forEach items="${bookmarkcount}" var="dto">
									<c:if test="${dto.userseq == loginuserseq}">
										    style="color: gold;"
									</c:if>
								</c:forEach>></button>
				</div>
			</div>
			<div class="hospital-info-flex">
			<div class="hospital-info-grid">
				<c:if test="${dto.face == 'y' or dto.face == 'Y'}">
					<p class="box-content box-content-color">대면</p>
				</c:if>
				<c:if test="${dto.face == 'n' or dto.face == 'N'}">
					<p class="box-content">대면</p>
				</c:if>
				<c:if test="${dto.unface == 'y' or dto.unface == 'Y'}">
					<p class="box-content box-content-color">비대면</p>
				</c:if>
				<c:if test="${dto.unface == 'n' or dto.unface == 'N'}">
					<p class="box-content">비대면</p>
				</c:if>
				<c:if test="${dto.housecall == 'y' or dto.housecall == 'Y'}">
					<p class="box-content box-content-color">왕진</p>
				</c:if>
				<c:if test="${dto.housecall == 'n' or dto.housecall == 'N'}">
					<p class="box-content">왕진</p>
				</c:if>
				<c:if test="${dto.ishealthcheck == 'y' or dto.ishealthcheck == 'Y'}">
					<p class="box-content box-content-color">건강검진</p>
				</c:if>
				<c:if test="${dto.ishealthcheck == 'n' or dto.ishealthcheck == 'N'}">
					<p class="box-content">건강검진</p>
				</c:if>
				<c:if test="${dto.vaccination == 'y' or dto.vaccination == 'Y'}">
					<p class="box-content box-content-color">예방접종</p>
				</c:if>
				<c:if test="${dto.vaccination == 'n' or dto.vaccination == 'N'}">
					<p class="box-content">예방접종</p>
				</c:if>
				<c:if
					test="${dto.ishospitalnightcare == 'y' or dto.ishospitalnightcare == 'Y'}">
					<p class="box-content box-content-color">야간진료</p>
				</c:if>
				<c:if
					test="${dto.ishospitalnightcare == 'n' or dto.ishospitalnightcare == 'N'}">
					<p class="box-content">야간진료</p>
				</c:if>
				<c:if
					test="${dto.ishospitalholiday == 'y' or dto.ishospitalholiday == 'Y'}">
					<p class="box-content box-content-color">주말진료</p>
				</c:if>
				<c:if
					test="${dto.ishospitalholiday == 'n' or dto.ishospitalholiday == 'N'}">
					<p class="box-content">주말진료</p>
				</c:if>
			</div>
			<div>
				<p class="hospital-info-info bi-telephone"> ${dto.hospitaltel}</p>
				<p class="hospital-info-info bi-mailbox"> ${dto.hospitalemail}</p>
			</div>				
			</div>				
		</div>
		<hr>
		<div style="display: flex; justify-content: space-around; text-align: center; padding-top: 15px;">
			<div>
				<h6>영업시간</h6>
				<p>${dto.opentime} ~ ${dto.closetime}</p>
			</div>
			<div>
				<h6>휴게시간</h6>
				<p>${dto.restopentime} ~ ${dto.restclosetime}</p>
			</div>
			<div>
				<h6>주간 휴무일</h6>
				<p>${dto.hospitaldayoff}</p>
			</div>
		</div>  
		<hr>
		<div style="display:flex; justify-content: space-evenly; padding-top: 25px;">
			<c:forEach items="${deptlist}" var="list">
			<div class="hospital-dept-doclist">
				<div style="padding-left: 0;">
					<div style="display:flex;">
						<c:forEach items="${doclist}" var="doc">
							<c:if test="${list.departmentname == doc.departmentname}">
								<div style="display:block; margin-left: 5px;">
									<img class="docter-images" style="opacity: 1;"
										src="/apa/resources/images/doc/${doc.doctorImage}">
									<div style="text-align: center; padding-top: 8px;">${list.departmentname}</div>
									<p class="" style="margin-top: 5px; text-align: center;">${doc.doctorName}</p>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			</c:forEach> 
		</div>
		<hr>	
		<div>
			<h5>병원 위치</h5>
			<p class="hospital-info-info">${dto.hospitaladdress}</p>
			<div id="map" style="width: auto; height: 400px;"></div>
			<!-- 지도를 담을 영역 만들기 -->
		</div>
		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('ROLE_USER')">
			<div class="container">
				<a class="reservation-button js-click-modal">예약하기</a>
				<div class="reservation-modal">
					<div>
						<form action="/apa/search/reservation/select.do" method="GET">
							<div class="hospital-info-type">
								<div>
									<c:if test="${dto.face == 'y' || dto.face == 'Y'}">
										<div>
											<div>
												<button type="button" class="type-button" onclick="typechoice()" value="${dto.face}">대면</button>
											</div>
										</div>
									</c:if>
									<c:if test="${dto.unface == 'y' || dto.unface == 'Y'}">
										<div>
											<div>
												<button type="button" class="type-button" onclick="typechoice()" value="${dto.unface}">비대면</button>
											</div>
										</div>
									</c:if>
									<c:if test="${dto.housecall == 'y' || dto.housecall == 'Y'}">
										<div style="">
											<div>
												<button type="button" id="housecall" class="type-button" onclick="typechoice()" value="${dto.housecall}">왕진</button>
												<p class="hide-tag" style="margin: 0 0;">왕진 문의는 ${dto.hospitalname}(${dto.hospitaltel})으로 주시면 감사하겠습니다.</p>
											</div>
										</div>
									</c:if>
									<c:if test="${dto.ishealthcheck == 'y' || dto.ishealthcheck == 'Y'}">
										<div>
											<div>
												<button type="button" class="type-button" onclick="typechoice()" value="${dto.ishealthcheck}">건강검진</button>
											</div>
										</div>
									</c:if>
									<c:if test="${dto.vaccination == 'y' || dto.vaccination == 'Y'}">
										<div>
											<div>
												<button type="button" class="type-button" onclick="typechoice()" value="${dto.vaccination}">예방접종</button>
											</div>
										</div>
									</c:if>
								</div>
								<div class="reservation-modal-button-list">
									<div id="choice-type"></div>
									<input type="hidden" name="seq" value="${dto.hospitalid}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<button type="submit" class="js-close-modal reservation-modal-button" disabled="disabled">다음으로</button>
									<a class="js-close-modal reservation-modal-button">닫기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			</sec:authorize>
		</sec:authorize>
		<hr>
		<div>
			<div style="display: flex; justify-content: space-between;">
				<h5>리뷰</h5>
				<c:if test="${positive != 0 or negative != 0}">
				<div class="review-progress-bar">
					<c:if test="${positive >= 10}">
					<div class="review-progress" style="width: ${positive}%;">좋아요(${positive}%)</div>
					</c:if>
					<c:if test="${100 - positive >= 10}">
					<div class="review-progress-negative" style="width: ${100 - positive}%;">싫어요(${100 - positive}%)</div>
					</c:if>
				</c:if>
				</div>
			</div>
			<div style="padding-top: 15px;">
				<c:forEach items="${reviewlist}" var="reviewlist" begin="0" end="9" step="1"> 
				<div>
					<div class="review-grid">
						<div>${reviewlist.userId}</div>
						<div class="hospital-info-grid reviewtaglist">
							<c:forEach items="${reviewtaglist}" var="reviewtaglist">
									<c:if test="${reviewtaglist.reviewSeq == reviewlist.reviewSeq}">
										<p class="box-content">${reviewtaglist.tagContent}</p>
									</c:if>
							</c:forEach>
						</div>
					</div>
					<p>${reviewlist.reviewContent}</p>
				</div>
				</c:forEach>
				<c:forEach items="${reviewlist}" var="reviewlist" begin="10" step="1">
				<div class="hidden-review">
					<div class="review-grid">
						<div>${reviewlist.userId}</div>
						<div class="hospital-info-grid reviewtaglist ">
							<c:forEach items="${reviewtaglist}" var="reviewtaglist">
									<c:if test="${reviewtaglist.reviewSeq == reviewlist.reviewSeq}">
										<p class="box-content">${reviewtaglist.tagContent}</p>
									</c:if>
							</c:forEach>
						</div>
					</div>
					<p>${reviewlist.reviewContent}</p>
				</div> 	
				</c:forEach>
			</div>
			<hr>
			<div class="taglist-button" style="text-align: center;">더보기</div>
			<hr>
			<c:if test="${positive == 0 and negative == 0}">
				<h4 style="text-align: center; margin-top: 30px;">등록된 리뷰가 없습니다.</h4>
			</c:if>
		</div>
		</div>
	</div>
</main>
<script>
	$(document).ajaxSend(function(e, xhr, options) {
	xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	});
	function typechoice() {
		$('.type-button').css('opacity', '0.4');
		$(event.target).css('opacity', '1');
		$('#choice-type').html('');
		$('#choice-type').append('<input type="hidden" id="choicetype" name="choicetype" value= "">');
		$('#choicetype').val($(event.target).text());
		$('.reservation-modal-button').attr("disabled", false);
		console.log($(event.target).text());
		if ($(event.target).text() === '왕진') {
			$('#housecall').text('왕진 문의는 ${dto.hospitalname}(${dto.hospitaltel})으로 주시면 감사하겠습니다.');
			$('.reservation-modal-button').attr("disabled", true);
		}else{
			$('#housecall').text('왕진');			
		}
	}
	$('.js-click-modal').click(function() {
		$('.container').addClass('modal-open');
		$(".js-close-modal").css('opacity', '10');
		$(".js-click-modal").css('opacity', '0');
		$(".reservation-modal").toggleClass("emphasized");
	});

	$('.js-close-modal').click(function() {
		$('.container').removeClass('modal-open');
		$(".js-close-modal").css('opacity', '0');
		$(".js-click-modal").css('opacity', '10');
		$(".reservation-modal").toggleClass("emphasized");
	});
	$("#bookmark-button").click(
			function() {
				var color = $(this).css('color');
				let obj = {
					userseq : 1,
					hospitalid : '${dto.hospitalid}'
				};
				if ($("#bookmark-button").css('color') === 'rgb(255, 215, 0)') {
					$.ajax({
						type : 'POST',
						url : '/apa/search/bookmarkout',
						headers : {
							'Content-Type' : 'application/json'
						},
						beforeSend : function(xhr) {
							xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
						},
						data : JSON.stringify(obj),
						dataType : 'json',
						success : function(result) {
							$("#bookmark-button").css('color', 'black');
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
					});
				} else {

					$.ajax({
						type : 'POST',
						url : '/apa/search/bookmark',
						headers : { 
							'Content-Type' : 'application/json'
						},
						beforeSend : function(xhr) {
							xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
						},
						data : JSON.stringify(obj),
						dataType : 'json',
						success : function(result) {
							$("#bookmark-button").css('color', 'gold');
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
					});
				}
			});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(37.49934, 127.0333), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 생성합니다    2
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${dto.hospitaladdress}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	$(".taglist-button").click(function() {
		if ($(".hidden-review").is(":visible")){
			$(".hidden-review").slideUp();
			$(".taglist-button").text("더보기");    				
		} else {
			$(".hidden-review").slideDown();
			$(".taglist-button").text("숨기기");
		}
	});
</script>