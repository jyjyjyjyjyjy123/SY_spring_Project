<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의학상담</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<style>
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
}

.cell:hover {
	border: 1px solid #3D5AFE;
}

.cell.select {
	background-color: #3D5AFE;
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

.justify-content-start {
	margin-top: 8px;
}

.doc {
	width: 100px;
	height: 100px;
	object-fit:;
}

a {
    color: #858796;
}

 	#doctor-table {
        border-collapse: collapse; /* 테이블 표 선 보이게 설정 */
        width: 100%;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    #doctor-table img {
        border: 2px solid #ddd; /* 이미지 주변에 테두리 추가 */
        border-radius: 8px; /* 이미지 테두리를 둥글게 설정 */
        cursor: pointer;
        opacity: 0.6;
        transition: opacity 0.3s ease; /* 투명도 변화에 부드러운 효과 추가 */
    }

    #doctor-table img:hover {
        opacity: 1;
    }

    /* ... 다른 코드 ... */
    
    #counseling-waiting-table-list th,
    #counseling-answer-table-list th {
        background-color: #f2f2f2; /* 헤더 배경색 변경 */
        text-align: center;
        padding: 15px 8px;
    }

    #counseling-waiting-table-list,
    #counseling-answer-table-list {
        border-collapse: collapse; /* 테이블 표 선 보이게 설정 */
        width: 100%;
        margin-top: 20px;
    }

    #counseling-waiting-table-list td,
    #counseling-answer-table-list td {
        border: 1px solid #ddd; /* 각 셀에 테두리 추가 */
        padding: 5px 8px;
        text-align: center;
    }
    
    #counseling-waiting-table-list .date,
	#counseling-answer-table-list .date {
    	width: 150px; /* 작성날짜 너비를 늘립니다. */
	}

.maindiv {
    background-color: #f8f9fa; /* Light gray background color */
    padding: 20px; /* Add padding for better spacing */
}

.hospital-info {
     margin-top: 20px; /* Add some top margin to hospital-info */
    margin-bottom: 30px; /* Increase bottom margin to adjust the spacing */
}

.lineseedkr {
    color: #000000; /* Blue text color for lineseedkr */
}

#titlename {
    font-size: 40px; /* 변경하고자 하는 크기로 조절 */
}

#subtitlename {
    font-size: 22px; /* 변경하고자 하는 크기로 조절 */
    margin-bottom: 15px; /* 아래 여백 추가 */
}


#counseling-list h3 {
    font-size: 22px; /* Adjust font size for better visibility */
    margin-bottom: 15px; /* Add bottom margin for spacing */
}

.counseling-list {
    margin-top: 70px; /* 답변 대기 목록 위 여백을 늘립니다. */
}
</style>
</head>
<body>
	<!-- /reservation/subject.jsp -->
	<div class="maindiv">
		<form action="/apa/hospital/counseling/detail.do" method="GET">
			<div class="hospital-info">
				<h1 class="lineseedkr" id= "titlename">의학상담</h1>
				<br>
				<h3 class="lineseedkr" id="subtitlename">의사 선택</h3>
				<table id="doctor-table">
				</table>
				<div class=counseling-list id="counseling-list">
					<h3 class="lineseedkr" id="subtitlename">답변 대기 목록</h3>
					<table id="counseling-waiting-table-list">
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
						<tbody id="counseling-waiting-tbody"></tbody>
					</table>
					<br><br><br><br>
					<h3 class="lineseedkr" id="subtitlename">답변 완료 목록</h3>
					<table id="counseling-answer-table-list">
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
						<tbody id="counseling-answer-tbody"></tbody>
					</table>
				</div>

				<div id="hidden-choice-doc"></div>
				<div class="time-choice" id="time-choice"></div>
				<input type="hidden" name="hospitalId"
					value="<sec:authentication property='principal.dto2.hospitalId'/>">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</div>
		</form>
	</div>

	<script>
        window.onload = function() {
            var table = document.getElementById('counseling-table');
            var rows = Array.from(table.rows).slice(1); // 헤더 행을 제외합니다.
            rows.sort(function(rowA, rowB) {
                var statusA = rowA.querySelector('.status').textContent;
                var statusB = rowB.querySelector('.status').textContent;
                var dateA = new Date(rowA.querySelector('.date').textContent);
                var dateB = new Date(rowB.querySelector('.date').textContent);
                if (statusA === '답변대기' && statusB !== '답변대기') {
                    return -1;
                } else if (statusA !== '답변대기' && statusB === '답변대기') {
                    return 1;
                } else {
                    return dateB - dateA; // 최신 날짜가 상단으로 오게 합니다.
                }
            });
            rows.forEach(function(row) {
                table.tBodies[0].appendChild(row);
            });
        };
    </script>

</body>
<script>

/* 답변 대기 */
     

/* 의사 목록 불러오기(이미지)) */
  $(document).ready(function() {
	    var hospitalId = $('input[name="hospitalId"]').val();

	    $.ajax({
	        url: '/apa/hospital/counseling/doctors/' + hospitalId,
	        type: 'GET',
	        dataType: 'json',
	        success: function(data) {
/* 	        	alert(JSON.stringify(data)); */
	        	
	        	var table = $('#doctor-table');
	            var row = $('<tr>');  // 테이블 행을 한 번만 생성
	            $.each(data, function(index, doctor) {
	                var cell = $('<td>');
	                cell.html('<img onclick = "docchoice('+doctor.doctorSeq+','+doctor.departmentSeq+');" class="doc" src="/apa/resources/images/doc/' + doctor.doctorImage + '">');
	                row.append(cell);  // 각 이미지에 대해 새로운 셀을 추가
	            });
	            table.append(row);  // 테이블에 행을 추가
	        },
	        error: function(error) {
	            alert('Error:', error);
	        }
	    });
	});



	
	
		function docchoice(doctorSeq, departmentSeq) {
			var hospitalId = $('input[name="hospitalId"]').val();
			$('.doc').css('opacity', '0.6');
			$(event.target).css('opacity', '1');
			let obj = {
				doctorSeq : doctorSeq,
				departmentSeq : departmentSeq,
				hospitalId : hospitalId
			};
			$.ajax({
				type: 'POST',
				url: '/apa/hospital/counseling/counselingwaitinglist',
				headers : {'Content-Type' : 'application/json'
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				data : JSON.stringify(obj),
				dataType: 'json',
				success: function(result) {
					$('#counseling-waiting-tbody').html('');
					$('#counseling-answer-tbody').html('');
					
					$(result).each((index, item) => {
					console.log(item.mediCounselQuestionSeq)
						if (item.iscounselanswer == 'N') {
							let temp = `
								<tr>
									<td><a href="/apa/hospital/counseling/waitingview.do?mediCounselQuestionSeq=\${item.mediCounselQuestionSeq}&doctorSeq=\${doctorSeq}">\${item.counseltitle}</a></td>
									<td>\${item.username}</td>
									<td class="date">\${item.regdate}</td>
								</tr> 
							`;
							$('#counseling-waiting-tbody').append(temp);
						} else {
							let temp = `
								<tr>
									<td><a href="/apa/hospital/counseling/completeview.do?mediCounselQuestionSeq=\${item.mediCounselQuestionSeq}&doctorSeq=\${doctorSeq}&mediCounselAnswerSeq=\${item.mediCounselAnswerSeq}">\${item.counseltitle}</a></td>
									<td>\${item.username}</td>
									<td class="date">\${item.regdate}</td>
								</tr>
							`;
							$('#counseling-answer-tbody').append(temp);
						}
						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
			
		}
		
		 
	</script>
</html>








