<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스토어</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        .section {
            margin-bottom: 40px;
        }
        .section h2 {
            background-color: #ddd;
            padding: 10px;
            border-radius: 5px;
        }
        .item {
            display: inline-block;
            width: 30%;
            margin: 10px;
            background: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            text-align: center;
        }
        .item h3 {
            margin: 10px 0;
        }
        .item .price {
            color: red;
            font-weight: bold;
        }
        .cart {
            position: absolute;
            right: 20px;
            top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>스토어</h1>
        <div class="cart">
            <a href="cart.jsp"><i class="fas fa-shopping-cart"></i> 장바구니(0)</a>
        </div>
    </header>
    <div class="container">
        <!-- 패키지 섹션 -->
        <div class="section">
            <h2>패키지</h2>
            <div class="item">
                <h3>우리 패키지</h3>
                <p class="price">62,000원 <span style="text-decoration: line-through;">66,000원</span></p>
            </div>
            <div class="item">
                <h3>나랑 내 패키지</h3>
                <p class="price">35,000원 <span style="text-decoration: line-through;">37,000원</span></p>
            </div>
            <div class="item">
                <h3>좋은 날 패키지</h3>
                <p class="price">18,000원 <span style="text-decoration: line-through;">26,000원</span></p>
            </div>
        </div>

        <!-- 영화관람권 섹션 -->
        <div class="section">
            <h2>영화관람권</h2>
            <div class="item">
                <h3>CGV 영화관람권</h3>
                <p class="price">13,000원</p>
            </div>
            <div class="item">
                <h3>IMAX 영화관람권</h3>
                <p class="price">18,000원</p>
            </div>
            <div class="item">
                <h3>4DX 영화관람권</h3>
                <p class="price">19,000원</p>
            </div>
        </div>

        <!-- 기프트카드 섹션 -->
        <div class="section">
            <h2>기프트카드</h2>
            <div class="item">
                <h3>PACONNIE A형</h3>
                <p class="price">금액선택</p>
            </div>
            <div class="item">
                <h3>PACONNIE B형</h3>
                <p class="price">금액선택</p>
            </div>
            <div class="item">
                <h3>PACONNIE C형</h3>
                <p class="price">금액선택</p>
            </div>
        </div>
    </div>
</body>
</html>
