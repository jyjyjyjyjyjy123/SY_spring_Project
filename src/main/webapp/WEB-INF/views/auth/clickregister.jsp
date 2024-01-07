<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">



    <style>

        input[type=button] {
            width: 300px;
            height: 200px;
            border-radius: 10px;
            font-size: 24px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            background-color: white;
            color: #5bc1ac;
            border: none;
            margin-top: 100px;
            margin-bottom: 250px;
            cursor: pointer;
            margin-left: 150px;

        }

        input[type=button]:hover {
            background-color: #5bc1ac;
            color: white;
        }

        .h3, h3 {
            margin-top: 30px;
            font-size: 3rem;
            text-align: center;
        }



    </style>
</head>
<body>

<h1 class="h3 mb-0 text-gray-800 hansans" style="padding-top: 20px;">일반 회원가입</h1>
<div>
    <input type="button" id="select_user" value="일반회원" onclick="location.href='/apa/auth/userregister.do'">
    <input type="button" id="select_hospital" value="병원회원" onclick="location.href='/apa/auth/hospitalregister.do'">
    <input type="button" id="select_pharmacy" value="약국회원" onclick="location.href='/apa/auth/pharmacyregister.do'">
</div>



<script>

</script>
</body>
</html>
