<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #007BFF;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원가입</h1>
        <form action="<%=request.getContextPath() %>/cusInsert.do" method="post">
            <label for="cust_id">아이디:</label>
            <input type="text" id="cust_id" name="cust_id" required placeholder="아이디를 입력하세요.">

            <label for="cust_pw">비밀번호:</label>
            <input type="password" id="cust_pw" name="cust_pw" required placeholder="비밀번호를 입력하세요.">

            <label for="cust_name">이름:</label>
            <input type="text" id="cust_name" name="cust_name" required placeholder="이름을 입력하세요.">

            <label for="cust_email">이메일:</label>
            <input type="email" id="cust_email" name="cust_email" required placeholder="이메일을 입력하세요.">

            <label for="cust_tel">전화번호:</label>
            <input type="tel" id="cust_tel" name="cust_tel" required placeholder="전화번호를 입력하세요.">

            <label for="cust_post">우편번호:</label>
            <input type="text" id="cust_post" name="cust_post" required placeholder="우편번호를 입력하세요.">

            <label for="cust_add">주소:</label>
            <input type="text" id="cust_add" name="cust_add" required placeholder="주소를 입력하세요.">

            <label for="cust_detailAdd">상세주소:</label>
            <input type="text" id="cust_detailAdd" name="cust_detailAdd" required placeholder="상세주소를 입력하세요.">

            <button type="submit">회원가입</button>
        </form>
    </div>
</body>
</html>