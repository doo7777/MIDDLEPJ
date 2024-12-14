<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .movie-details {
            display: flex;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .movie-poster img {
            max-width: 300px;
            border-radius: 8px 0 0 8px;
        }

        .movie-info {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .movie-info h1 {
            font-size: 24px;
            margin: 0;
        }

        .movie-info h2 {
            font-size: 20px;
            color: #888;
        }

        .movie-info p {
            margin: 5px 0;
        }

        button {
            margin-top: 10px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            color: white;
            background-color: #007bff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .movie-description {
            margin-top: 20px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .movie-links {
            margin-top: 20px;
        }

        .movie-links a {
            color: #007bff;
            text-decoration: none;
        }

        .movie-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="movie-details">
        <div class="movie-poster">
            <img src="../main/sorce/img/영화포스터/영화1.jpg" alt="소방관 포스터">
        </div>
        <div class="movie-info">
            <h1>소방관</h1>
            <h2>FIRE FIGHTERS</h2>
            <p>예매율: <strong>14.0%</strong> | 평점: <strong>93%</strong></p>
            <p>감독: 곽경택 | 배우: 주연 (문준원), 곽도원, 유재명, 김민재, 오대환, 이준혁, 장영남</p>
            <p>장르: 드라마 | 기본 정보: 12세이상관람가, 106분, 한국</p>
            <p>개봉일: 2024.12.04</p>

            <button class="trailer-button">프리뷰</button>
            <button class="reserve-button">예매하기</button>
        </div>
    </div>
    
    <div class="movie-description">
        <h3>주요 정보</h3>
        <p>살리기 위해, 살아남기 위해 하루하루가 마지막 현장인 소방관 팀은 열악한 환경 속에서도 화재 진압을 위해 구조는 한 하나의 목표로 의기투합한다.</p>
        <p>어느 날, 11시 신고 전화를 홍제동에 화재가 발생했다는 긴급 상황이 접수되자 팀원들은 위기감 직감한다.</p>
        <p>누군가의 가족, 친구, 사랑하는 사람, 우리가 기억해야 할 그 이름.</p>
        <p><strong>소방관</strong> 2001년 가장 빛났던 그들의 이야기를 기억하겠습니다.</p>
    </div>

    <div class="movie-links">
        <a href="#cast-crew">감독/출연</a> |
        <a href="#trailer">트레일러</a> |
        <a href="#stills">스틸컷</a> |
        <a href="#reviews">평점/리뷰</a> |
        <a href="#showtimes">상영시간표</a>
    </div>
</body>
</html>
