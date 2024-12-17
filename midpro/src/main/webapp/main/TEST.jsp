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

        /* 비디오 영역 */
        hr {
            margin: -20px 0 0;
            border: none;
            height: 2px;
            background-color: #ef8400;
            position: relative;
            left: -2px;
        }

        #movie_play {
            height: 550px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black; /* 원래 블랙 */
        }

        /* 무비차트, 상영예정작, 무비추천 */
        .header {
            width: 100%;
            padding: 0 0 0 270px;
            margin-bottom: 40px;
            display: flex;
            margin-top: -10px;
            overflow: hidden;
            white-space: nowrap;
            position: relative;
        }

        .menu-button h2,
        .header h2 {
            color: gray;
            margin: 0 10px;
        }

        .header h4 {
            color: white;
        }

        .menu-button {
            background: none; /* 버튼 디자인 제거 */
            border: none; /* 버튼 디자인 제거 */
        }

        .menu-button.active h2 {
            color: white;
        }

        /* 더 많은 영화보기 */
        .movie-list {
            color: gray;
            background: none;
            border: none;
            align-items: center;
            font-size: 10pt;
            position: absolute; /* 절대 위치 설정 */
            top: 10%;
            left: 1450px;
            white-space: nowrap;
        }

        /* 무비 순위 목록 */
        #movie_chart {
            height: 450px;
        }

        .chart {
            width: 200px;
            height: 300px;
            margin: 0 10px;
            background-color: white;
            border-radius: 25px;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
            text-align: center;
            flex: 0 0 200px;
        }

        /* 무비순위목록 애니메이션 */
        .chart.show {
            opacity: 1;
            transform: translateY(0);
        }

        .chart.hide {
            opacity: 0;
            transform: translateY(20px);
        }

        /* 패키지, 영화관람권, 기프트카드 */
        #store {
            height: 320px;
            display: flex;
            gap: 20px;
        }

        .package,
        .ticket,
        .giftcard {
            background: white;
            border-radius: 10px;
            text-align: center;
            position: relative; /*아래 storeButton을 절대위치로 설정하기위해*/
            width: 430px;
            flex: 0 0 auto;
            padding-top: 10px; /*안에 글자 조금 내려가게 윗부분 패딩설정*/
        }

        .package::before,
        .ticket::before,
        .giftcard::before {
            position: absolute;
            content: '';
            background: linear-gradient(-135deg, black 16px, transparent 0),
                linear-gradient(135deg, black 16px, transparent 0);
            background-size: 32px;
            top: 0;
            left: 0;
            width: 100%;
            height: 32px;
            background-repeat: repeat-x;
        }

        .package::after,
        .ticket::after,
        .giftcard::after {
            position: absolute;
            content: '';
            background: linear-gradient(-45deg, black 16px, transparent 0),
                linear-gradient(45deg, black 16px, transparent 0);
            background-repeat: repeat-x;
            background-size: 32px;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 32px;
        }

        .fa-plus {
            position: absolute;
            top: 20px;
            right: 10px;
            padding: 4px 8px;
            background-color: white;
            border-radius: 8px;
            color: black;
            cursor: pointer;
        }

        /* 공지사항, 고객센터, FAQ */
        #noticeClient {
            color: white;
            width: 580px; /* 고정 너비 */
            margin-left: 250px;
            padding: 0 25px; /* 좌우 패딩 설정 */
            border: 1px solid #f4f4f4; /* 흰색 테두리 */
            border-radius: 10px;
            display: inline-block; /* 내용에 맞게 테두리 조절 */
        }

        .notice_wrap dt,
        .notice_wrap dd {
            display: inline-block;
        }

        .notice_wrap a {
            margin-right: 10px;
            color: white; /* 링크 색상을 하얀색으로 설정 */
            text-decoration: none; /* 밑줄 제거 */
        }

        .client_list {
            display: flex;
        }

        .client_list dt,
        .client_list dd {
            display: inline-block;
        }

        /* 예매하기 아이콘 */
        .reservation_btn {
            display: inline-flex; /* Flexbox 사용 */
            align-items: center; /* 수직 중앙 정렬 */
            padding: 20px 30px; /* 패딩 조정 (더 크게) */
            font-size: 18px; /* 글자 크기 조정 */
            background-color: #ef8400; /* 배경색 */
            color: white; /* 글자색 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 마우스 커서 변경 */
            width: 50px; /* 너비 조정 (필요에 따라 조정) */
            height: 2px; /* 높이 조정 (필요에 따라 조정) */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-top: 320px; /* 위쪽 여백 추가 (아래로 이동) */
        }

        .reservation_btn:hover {
            background-color: #d68a00; /* 호버 시 배경색 변경 */
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

        .client_btn_wrap a {
            display: inline-block;
            margin-right: 10px;
            color: #f4f4f4;
            text-decoration: none;
        }

        .notice_wrap {
            font-weight: bold;
            margin-top: 20px; /* 위로 공간 추가 */
            margin-bottom: 10px;
        }

        .client_btn_wrap {
            font-weight: bold;
            margin-bottom: 20px;
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

        .store-menu li {
            cursor: pointer;
            padding-bottom: 5px;
            transition: color 0.3s, border-bottom 0.3s;
        }

        .store-menu li.active {
            font-weight: bold;
            color: #ef8400;
            border-bottom: 2px solid #ef8400;
        }

        /* 패키지 설명 */
        .package-title {
            margin: 30px 0;
            text-align: left;
        }

        .package-title h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .package-title p {
            font-size: 1.2rem;
            color: white;
        }

        /* 패키지 아이템 목록 */
        .package-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개의 컬럼으로 나누기 */
            gap: 20px;
        }

        .package-item {
            background: d;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .package-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 올라가는 효과 */
        }

        .package-item img {
            width: 100%;
            max-width: 180px; /* 이미지 크기 제한 */
            margin-bottom: 10px;
        }

        .package-item h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .package-item p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
        }

        .package-item .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ef8400;
        }

        .package-item del {
            font-size: 0.9rem;
            color: #999;
            margin-left: 5px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .package-grid {
                grid-template-columns: repeat(2, 1fr); /* 화면이 작을 때 2개의 컬럼 */
            }
        }

        @media (max-width: 480px) {
            .package-grid {
                grid-template-columns: 1fr; /* 화면이 더 작을 때 1개의 컬럼 */
            }
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="Top.jsp" %>
    </div>
    <!-- 스토어 -->
    <div class="store-container">
        <!-- 상단 타이틀 -->
        <div class="store-header">
            <h1>스토어</h1>
            <div class="store-menu">
                <span class="active">패키지</span>
                <span>영화관람권</span>
                <span>기프트카드</span>
                <span>콤보</span>
                <span>팝콘</span>
                <span>음료</span>
                <span>스낵</span>
                <span>플레이존</span>
                <span>상품권소개</span>
                </div>
        </div>

        <!-- 패키지 설명 -->
        <div class="package-title">
            <h2>패키지</h2>
            <p>마음을 담아 선물하세요</p>
        </div>

        <!-- 패키지 아이템 목록 -->
        <div class="package-grid">
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/우리-패키지.jpg" alt="우리패키지" />
                <h3>우리 패키지</h3>
                <p>일반 영화 관람권 4매+더블콤보 1개</p>
                <span class="price">62,000원 <del>66,000원</del></span>
            </div>
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/나랑-너-패키지.jpg" alt="나랑 너 패키지" />
                <h3>나랑 너 패키지</h3>
                <p>일반 영화 관람권 2매+CGV콤보 1개</p>
                <span class="price">35,000원 <del>37,000원</del></span>
            </div>
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/좋은-날-패키지.jpg" alt="좋은 날 패키지" />
                <h3>좋은 날 패키지</h3>
                <p>일반 영화 관람권 1매+스몰세트 1개</p>
                <span class="price">18,000원 <del>20,000원</del></span>
            </div>
        </div>
    </div>
    
    <%@ include file="Bottom.jsp" %>
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

