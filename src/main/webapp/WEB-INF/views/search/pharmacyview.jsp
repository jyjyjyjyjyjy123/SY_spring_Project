<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<main>
	<div class="maindiv">
		<div>
			<div class="review-grid">
				<h2>${dto.pharmacyname}</h2>
			</div>
			<div class="hospital-info-flex">
				<div class="hospital-info-grid">
					<c:if
						test="${dto.ispharmarcynightcare == 'y' or dto.ispharmarcynightcare == 'Y'}">
						<p class="box-content box-content-color">야간진료</p>
					</c:if>
					<c:if
						test="${dto.ispharmarcynightcare == 'n' or dto.ispharmarcynightcare == 'N'}">
						<p class="box-content">야간진료</p>
					</c:if>
					<c:if
						test="${dto.ispharmarcyholiday == 'y' or dto.ispharmarcyholiday == 'Y'}">
						<p class="box-content box-content-color">주말진료</p>
					</c:if>
					<c:if
						test="${dto.ispharmarcyholiday == 'n' or dto.ispharmarcyholiday == 'N'}">
						<p class="box-content">주말진료</p>
					</c:if>
				</div>
				<div>
					<p class="hospital-info-info bi-telephone">${dto.pharmacytel}</p>
					<p class="hospital-info-info bi-mailbox">${dto.pharmacyemail}</p>
				</div>
			</div>
		</div>
		<hr>
		<div
			style="display: flex; justify-content: space-around; text-align: center; padding-top: 15px;">
			<div>
				<h6>영업시간</h6>
				<p>${dto.opentime}~ ${dto.closetime}</p>
			</div>
			<div>
				<h6>주간 휴무일</h6>
				<p>${dto.pharmacydayoff}</p>
			</div>
		</div>
		<hr>
		<div>
			<h5>약국 위치</h5>
			<p class="hospital-info-info">${dto.pharmacyaddress}</p>
			<div id="map" style="width: auto; height: 400px;"></div>
			<!-- 지도를 담을 영역 만들기 -->
		</div>
		<%-- <div class="container">
			<a href="/apa/search/reservation/select.do?seq=${dto.pharmacyid}">
				<button class="reservation-button">예약하기</button>
			</a>
		</div> --%>
</main>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.49934, 127.0333), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	//지도를 생성합니다    2
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${dto.pharmacyaddress}', function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});
</script>