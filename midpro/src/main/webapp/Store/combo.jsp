<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
        /* 전체 화면 사이즈 */
        #main {
            position: relative;
            left: 2px;
        }

        body {
            margin: 0;
            width: 100%;
            overflow-x: hidden;
            background: black;
        }

        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
        }

        /* 회사소개 */
        .bottom_line {
            margin-top: 100px;
        }

        .parent {
            position: relative; /* 부모 요소에 상대 위치 설정 */
        }

        #company {
            height: 400px; /* 회사 정보 영역의 높이 설정 */
            color: white;
            width: 700px; /* 고정 너비 유지 */
            margin: 0; /* 기본 여백 제거 */
            margin-top: 100px; /* 위쪽 여백 */
            text-align: center;
            overflow: hidden; /* 내용이 잘리도록 설정 */
            position: absolute; /* 절대 위치 설정 */
            transform: translateX(100%);
        }
        
        /* 스토어 */
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        h1 {
            margin: 0;
            color: white;
            margin-top: 20px;
        }
        
        h2, h3 {
            margin: 0;
            color: white;
        }

        /* 메인 컨테이너 */
        .store-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: black;
        }

        /* 상단 타이틀 */
        .store-header h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .store-menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            font-size: 16px;
            color: white;
            gap: 50px;
        }

        .store-menu span {
            cursor: pointer;
            padding: 5px 10px;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .store-menu .active {
            font-weight: bold;
            color: white;
            border-bottom: 2px solid white;
        }

        /* 콤보 설명 */
        .combo-title {
            margin: 30px 0;
            text-align: left;
        }

        .combo-title h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .combo-title p {
            font-size: 1.2rem;
            color: white;
        }

        /* 콤보 아이템 목록 */
        .combo-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개의 컬럼으로 나누기 */
            gap: 20px;
        }

        .combo-item {
            background: d;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .combo-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 올라가는 효과 */
        }

        .combo-item img {
            width: 100%;
            max-width: 180px; /* 이미지 크기 제한 */
            margin-bottom: 10px;
        }

        .combo-item h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .combo-item p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
        }

        .combo-item .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ef8400;
        }

        .combo-item del {
            font-size: 0.9rem;
            color: #999;
            margin-left: 5px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .combo-grid {
                grid-template-columns: repeat(2, 1fr); /* 화면이 작을 때 2개의 컬럼 */
            }
        }

        @media (max-width: 480px) {
            .combo-grid {
                grid-template-columns: 1fr; /* 화면이 더 작을 때 1개의 컬럼 */
            }
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <!-- 스토어 -->
    <div class="store-container">
        <!-- 상단 타이틀 -->
        <div class="store-header">
            <h1>스토어</h1>
            <div class="store-menu">
                <span>패키지</span>
                <span>영화관람권</span>
                <span>기프트카드</span>
                <span class="active">콤보</span>
                <span>팝콘</span>
                <span>음료</span>
                <span>스낵</span>
                <span>상품권소개</span>
                </div>
        </div>

        <!-- 콤보 설명 -->
        <div class="combo-title">
            <h2>콤보</h2>
            <p>맛있으면 0칼로리, 아는 맛이 제일 맛있어요</p>
        </div>

        <!-- 콤보 아이템 목록 -->
        <div class="combo-grid">
            <div class="combo-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/콤보(완료)/라지콤보.jpg" alt="라지콤보" />
                <h3>라지콤보</h3>
                <p>팝콘(L)2+탄산음료(L)2</p>
                <span class="price">16,000</span>
            </div>
            <div class="combo-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/콤보(완료)/더블콤보.jpg" alt="더블콤보" />
                <h3>더블콤보</h3>
                <p>팝콘(M)2+탄산(M)2</p>
                <span class="price">14,000</span>
            </div>
            <div class="combo-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/콤보(완료)/CGV콤보.jpg" alt="CGV콤보" />
                <h3>DGV콤보</h3>
                <p>팝콘(L)1+탄산음료(M)2</p>
                <span class="price">11,000</span>
            </div>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>

<script>
    const barParam = '<%=request.getParameter("bar")%>';
    if (barParam === 'on') {
        updateSidebarContent();
        moveSidebar();
    }

    // 무비차트, 상영예정작, 무비추천 클릭 시 애니메이션 적용
    document.addEventListener('DOMContentLoaded', function() {
        const header = document.querySelector('.header');
        const charts = document.querySelectorAll('.chart');
        const movieListButton = document.getElementById('movie-list'); // ID로 버튼 선택

        if (header) {
            header.addEventListener('click', function(event) {
                // 클릭된 요소가 '더 많은 영화보기' 버튼이 아닐 때만 애니메이션 적용
                if (event.target.closest('.menu-button')) {
                    charts.forEach((chart) => {
                        chart.classList.remove('show');
                        chart.classList.add('hide');
                    });

                    setTimeout(() => {
                        charts.forEach((chart, index) => {
                            setTimeout(() => {
                                chart.classList.remove('hide');
                                chart.classList.add('show');
                            }, index * 100);
                        });
                    }, 500);
                }
            });

            charts.forEach((chart, index) => {
                setTimeout(() => {
                    chart.classList.add('show');
                }, index * 100);
            });
        }
        const buttons = document.querySelectorAll('.menu-button');

        buttons.forEach(button => {
            button.addEventListener('click', function() {
                buttons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const videoPlayerElement = document.querySelector('#movie_play video'); // <video> 요소 선택
        const sourcesElement = videoPlayerElement.getElementsByTagName('source'); // source 요소를 가져옴

        function movie_play() {
            const randomNum = Math.floor(Math.random() * sourcesElement.length); // 소스의 개수에 따라 난수 생성
            return randomNum; // 난수를 반환
        }

        function loadRandomVideo() {
            const randomNum = movie_play(); // 난수 생성

            // 모든 소스의 src를 초기화
            for (let i = 0; i < sourcesElement.length; i++) {
                sourcesElement[i].src = `sorce/영상 소스파일${i + 1}.mp4`; // 파일 경로 수정
            }

            // 선택된 소스의 src를 설정
            videoPlayerElement.src = sourcesElement[randomNum].src;

            // videoPlayer가 비디오 요소인지 확인
            if (videoPlayerElement instanceof HTMLVideoElement) {
                videoPlayerElement.load(); // 비디오 소스 변경 후 비디오 로드
                videoPlayerElement.play(); // 비디오 자동 재생
            } else {
                console.error('videoPlayer is not a valid video element');
            }
        }

        loadRandomVideo(); // 랜덤 비디오 로드 함수 호출
    });
</script>
</html>

