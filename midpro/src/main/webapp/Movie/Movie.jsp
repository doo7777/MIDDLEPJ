<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>무비 차트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .movie-chart {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .movie {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 200px;
            text-align: center;
            padding: 10px;
            transition: transform 0.2s;
        }

        .movie img {
            width: 100%;
            border-radius: 8px 8px 0 0;
        }

        .movie h2 {
            font-size: 16px;
            color: #333;
            margin: 10px 0;
        }

        .movie p {
            margin: 5px 0;
            color: #666;
        }

        .detail-link {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #e63946;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }

        .detail-link:hover {
            background-color: #d62839;
        }

        .movie:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>무비차트</h1>
    <div class="movie-chart">
        <div class="movie" id="movie1">
            <img src="./Movieimg/범죄도시4_메인_포스터.jpg" alt="범죄도시4">
            <h2> 범죄도시4</h2>
            <p>평점: 12.3</p>
            <p>관객수: 96%</p>
            <p>개봉일: 2024.12.12</p>
            <a href="#" class="detail-link">자세히 보기</a>
        </div>
        <div class="movie" id="movie2">
            <img src="url_to_image2.jpg" alt="스빌란">
            <h2> 스빌란</h2>
            <p>평점: 12.4</p>
            <p>관객수: 95%</p>
            <p>개봉일: 2024.12.12</p>
            <a href="#" class="detail-link">자세히 보기</a>
        </div>
        <div class="movie" id="movie3">
            <img src="url_to_image3.jpg" alt="인터스텔라">
            <h2> 인터스텔라</h2>
            <p>평점: 11.0</p>
            <p>관객수: 94%</p>
            <p>개봉일: 2024.12.11</p>
            <a href="#" class="detail-link">자세히 보기</a>
        </div>
        <!-- 추가 영화 정보 -->
    </div>
</body>