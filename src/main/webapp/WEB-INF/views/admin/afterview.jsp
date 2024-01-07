<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 0;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        table {
            margin: 20px;
            width: calc(100% - 40px);
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #edf0f7;
        }

        th {
            background-color: #edf0f7;
            border-right: 1px solid #e3e6f0;
            padding-left: 20px;
            padding-right: 10px;
            font-weight: bold;
        }

        button {
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 1.1rem;
            width: 100px;
            height: 40px;
            margin: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #5469d4;
        }

        .wrap-doughnut {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .chart {
            position: relative;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #dddfeb;
            transition: 0.3s;
        }

        .center-doughnut {
            background: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            font-size: 15px;
            transform: translate(-50%, -50%);
        }

        .revcontent {
            text-align: center;
            margin: 20px;
            font-weight: bold;
        }
        
	    button {
			border: none;
			border-radius: 5px;
			color: #000;
			font-size: 1.1rem;
			width: 80px;
			height: 40px;
			margin-right: 10px;
		}
		
		button:hover {
			background-color: #dddfeb;
		}
    </style>
</head>
<body>

<main>
    <div class="container">
        <table>
            <tr>
                <th>아이디</th>
                <c:forEach items="${afterview}" var="afterview">
                    <td>${afterview.hospitalId}</td>
                </c:forEach>
            </tr>
            			<tr>
				<th>병원명</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.hospitalName}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>사업자등록번호</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.hospitalSSN}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>연락처</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.hospitalTel}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>주소</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.hospitalAddress}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>이메일</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.hospitalEmail}</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach items="${afterview}" var="afterview">
				<th>가입 일자</th>
				<td>${afterview.hospitalJoinDate}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>탈퇴 유무</th>
				<c:forEach items="${afterview}" var="afterview">
				<td>${afterview.isHospitalUnregister}</td>
				</c:forEach>
			</tr>
				<c:forEach items="${afterview}" var="afterview">
			<input type="text" name="hospitalId" id="hospitalId" value="${afterview.hospitalId}" hidden>
				</c:forEach>
        </table>

        <div class="wrap-doughnut">
            <div class="chart doughnut">
                <c:forEach items="${afterview}" var="afterview">
                    <span class="center-doughnut">${afterview.negativePercentage}%</span>
                </c:forEach>
            </div>
            <div class="revcontent">
                <c:forEach items="${afterview}" var="afterview">
                    총 태그 개수: ${afterview.totalTags}<br> 긍정: ${afterview.positiveTags}<br>
                    부정: ${afterview.negativeTags}
                </c:forEach>
            </div>
        </div>

        <div style="text-align: center;">
            <button id="okbtn">사후처리</button>
            <button id="okbtn" onclick="location.href='/apa/admin/afterlist.do';">뒤로가기</button>
        </div>
    </div>
</main>

<script>
    $(document).ready(function () {
        $("#okbtn").click(function () {
            var hospitalId = $('#hospitalId').val();

            $.ajax({
                type: 'POST',
                url: '/apa/admin/afteredit',
                headers: {
                    'Content-Type': 'application/json',
                    '${_csrf.headerName}': '${_csrf.token}'
                },
                data: JSON.stringify({ hospitalId: hospitalId }),
                dataType: 'json',
                success: function (result) {
                    location.href = '/apa/admin/afterlist.do';
                },
                error: function (a, b, c) {
                    console.log(a, b, c);
                }
            });
        });
    });
</script>

</body>
</html>