<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<style>
.justify-content-center{
	margin-top: 20px;
}
.docter-choice-start{
	display: none;
}
.date-choice-start{
	display: none;
}
.card {
	box-shadow: 0px 0px 4px 0px #000000;
}

::placeholder {
	color: #fff;
	opacity: 1;
}

:-ms-input-placeholder {
	color: #fff;
}

::-ms-input-placeholder {
	color: #fff;
}

.datepicker {
	background-color: #fff !important;
	color: #000 !important;
	border: none;
	padding: 10px !important;
	border-radius: 30px;
	text-align: center;
}

.datepicker-dropdown:after {
	border-bottom: 6px solid #000;
}

thead tr:nth-child(3) th {
	color: #000 !important;
	font-weight: bold;
	padding-top: 20px;
	padding-bottom: 10px;
}

.dow, .old-day, .day, .new-day {
	width: 40px !important;
	height: 40px !important;
	border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover,
	.decade:hover, .century:hover {
	border-radius: 6px !important;
	background-color: #eee;
	color: #000;
}

.disabled {
	color: #c7c7c7 !important;
}

.prev, .next, .datepicker-switch {
	border-radius: 0 !important;
	padding: 20px 10px !important;
	text-transform: uppercase;
	font-size: 20px;
	color: #000 !important;
	opacity: 0.8;
}

.prev:hover, .next:hover, .datepicker-switch:hover {
	background-color: inherit !important;
	opacity: 1;
}

.cell {
	border: 1px solid #BDBDBD;
	margin: 2px;
	cursor: pointer;
	border-radius: 5px;
}

.cell:hover {
	border: 1px solid #5bc1ac;
}

.cell.select {
	background-color: #5bc1acbd;
	color: #000;
}

.fa-calendar {
	color: #000;
	font-size: 30px;
	padding-top: 8px;
	padding-left: 5px;
	cursor: pointer;
}

.datepicker::placeholder {
	color: black;
}
.justify-content-start{
	margin-top: 8px;
}
.card-header{
	background-color: #dbdddd;
}
.dropdown-menu{
	margin-top: 0px;
}
</style>
<body>
	<!-- /reservation/subject.jsp -->
	<div class="maindiv" style="height: 1200px;">
		<form action="/apa/search/reservation/detail.do" method="GET">
			<div class="hospital-info ">
				<c:if test="${choicetype ne '건강검진'}">
					<div class="review-grid">
						<h2 class="lineseedkr">진료 과목 선택</h2>
						<div class="subject-choice">
							<c:forEach items="${deptlist}" var="list">
								<input type="button" class="hospital-info-dept btn custom-btn"
									value="${list.departmentname}">
							</c:forEach>
							<div id="subject-choice-dept"></div>
						</div>
					</div>
					<div class="docter-choice-start">
						<hr>
						<h2 class="lineseedkr">의사 선택</h2>
						<div class="doctor-choice" id="doctor-choice"></div>
					</div>
				</c:if>
				<c:if test="${choicetype ne '건강검진'}">
				<div class="date-choice-start">
				</c:if>
				<hr>
				<h2 class="lineseedkr">진료일 선택</h2>

				<div class="container-fluid px-0 px-sm-4 mx-auto">
					<div class="row justify-content-center mx-0">
						<div class="col-lg-10">
							<div class="card border-0">
								<div class="card-header">
									<div class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1">
										<input type="text" id="dp1" class="datepicker" onchange="dateinput();" placeholder="원하시는 진료 날짜를 선택하세요." name="choicedate" readonly>
										<span class="fa fa-calendar"></span>
									</div>
								</div>
								<div class="card-body p-3 p-sm-5" id="card-body">
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${choicetype ne '건강검진'}">
				</div>
				</c:if>
				<sec:authentication property="principal" var="user"/> 
				<input type="hidden" name="userid" value="${user.username}"> 
				<div id="hidden-choice-doc"></div>
				<div class="time-choice" id="time-choice"></div>
				<input type="hidden" name="seq" value="${dto.hospitalid}"> 
				<input type="hidden" name="choicetype" value="${choicetype}"> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<button class="reservation-button select-opacity" id="reservation-button" type="submit" disabled="disabled">다음으로</button>
			</div>
		</form>
	</div>
	<script>
		function dateinput() {
			timeload();			
		}
		function cell() {
			$('.cell').css('opacity', '0.5');
			$('.cell').css('border-color', '#BDBDBD');
			$('.cell').css('background-color', '#fff');
			
			$(event.target).css('opacity', '1');
			$(event.target).css('background-color', '#5bc1ac');
			$(event.target).css('border-color', '#5bc1ac');
			$('#time-choice').html('');
			$('#time-choice').append('<input type="hidden" id="choicetime" name="choicetime" value="">');
			$('#choicetime').val($(event.target).text());
			$('.reservation-button').attr("disabled", false);
			$('.reservation-button').css("opacity", '1');
		};
		
		$(document).ready(function(){
			$('.datepicker').datepicker({
			    format: 'yyyy-mm-dd',
			    autoclose: true,
			    startDate: '0d'
			});
	
			$('.cell').click(function(){
			    $('.cell').removeClass('select');
			    $(this).addClass('select');
			});
	
		});
	
	
		$('.hospital-info-dept').click(function(event) {
			let departmentname = $(event.target).val();
			$('.hospital-info-dept').css('background-color', '');	
			$('.hospital-info-dept').css('border-color', '');	
			$('.hospital-info-dept').css('color', '');	
			$(event.target).css('background-color', '#5bc1ac');
			$(event.target).css('border-color', '#fff');
			$(event.target).css('color', '#fff');
			$('#subject-choice-dept').html('');
			$('#subject-choice-dept').append('<input type="hidden" id="choicedept" name="choicedept" value= "">');
			$('#choicedept').val($(event.target).val());
			$('.docter-choice-start').css('display', 'inline');
			let obj = {
				departmentname,
				hospitalId : '${dto.hospitalid}'
			};
			$.ajax({
				type: 'POST',
				url: '/apa/search/reservation/finddoc',
				headers : {'Content-Type' : 'application/json'
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				data : JSON.stringify(obj),
				dataType: 'json',
				success: function(result) {
					$('#doctor-choice').html('');
					$(result).each((index, item) => {
						$('#doctor-choice').append(`
							<div>
								<img src="/apa/resources/images/doc/\${item.doctorImage}" name="choicedoc" class="docter-images" onclick="docchoice('\${item.doctorSeq}')" value="\${item.doctorImage}">
								<p class="hospital-doc-name">\${item.doctorName}</p>										
							</div>
						`);
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
		});
		function docchoice(seq) {
			$('.docter-images').css('opacity', '0.6');
			$(event.target).css('opacity', '1');
			$('#hidden-choice-doc').html('');
			$('#hidden-choice-doc').append('<input type="hidden" id="choicedoc" name="choicedoc" value= "">');
			$('#choicedoc').val(seq);
			$('.date-choice-start').css('display', 'inline');
		}
		
		function timeload() {
			var count = 1;
			var opentime = '${dto.opentime}';
			var closetime = '${dto.closetime}';
			var restopentime = '${dto.restopentime}';
			var restclosetime = '${dto.restclosetime}';
			var openH = Number(opentime.substring(0,2));
			var openM = Number(opentime.substring(3,4));
			var closeH = Number(closetime.substring(0,2));
			var closeM = Number(closetime.substring(3,4));
			var restopenH= Number(restopentime.substring(0,2));
			var restopenM = Number(restopentime.substring(3,4));
			var restcloseH = Number(restclosetime.substring(0,2));
			var restcloseM = Number(restclosetime.substring(3,4));
			
			$('#card-body').html('');
			let temp =``;
			for(openH; openH<closeH; openH++){
				if (restopenH == openH && restopenM == openM){
					openH = restcloseH;
					openM = restcloseM;
				}
				
				if (count%6 == 1){
					temp += `<div class="row text-center mx-0">`;
				}
				temp += `<div class="col-md-2 col-4 my-1 px-2"><div onclick="cell();" class="cell py-1">`;
				temp += openH+':'+openM+'0';
				temp += `</div></div>`;
				if (count%6 == 0){
					temp += `</div>`;
					$('#card-body').append(temp);
					temp =``;
				} 
				if (openM == 0) {
					openM = 3;
					openH --;
				} else if (openM == 3) {
					openM = 0;
					if (openH+1>=closeH){
						temp += `</div>`;
						$('#card-body').append(temp);
					}
				}
				count++;
			}
		}
		
	</script>
</body>