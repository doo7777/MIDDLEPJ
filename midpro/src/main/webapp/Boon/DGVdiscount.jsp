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

        /* 할인정보 메인 영역 */
        .tit-head h2 {
            text-align: center; /* 텍스트 중앙 정렬 */
            color: white; /* 글자색 하얀색 */
            margin: 0; /* 기본 여백 제거 */
            font-size: 28px; /* 글자 크기 설정 */
            font-weight: bold; /* 굵은 글꼴 */
            margin-top: 20px; /* 아래쪽 여백 */
            margin-bottom: 20px; /* 하단 여백 추가 */
        }
        /* 메뉴 링크 스타일 */
        .menu-links {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            gap: 20px; /* 항목 간 간격 */
            margin-bottom: 20px; /* 아래쪽 여백 */
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        .menu-links a {
            color: white; /* 글자색을 흰색으로 설정 */
            text-decoration: none; /* 밑줄 제거 */
            font-weight: bold; /* 글자 굵기 설정 */
        }

        .menu-links a:hover {
            color: red; /* 마우스 호버 시 색상 변경 (예: 빨간색) */
        }
        /* 서브메뉴 스타일 */
        .submenu {
            margin-top: 10px;
            text-align: left; /* 서브메뉴 왼쪽 정렬 */
            padding-left: 20px; /* 왼쪽 여백 추가 */
            position:absolute; 
            top: 40px;
            right: 260px;
            border: 1px solid transparent; /* 테두리를 투명하게 설정 */
        }
        .submenu ul {
            list-style: none; /* 목록 스타일 제거 */
            margin: 0;
            padding: 0;
        }
        .submenu ul li {
            display: inline; /* 가로로 배치 */
            margin: 0 10px; /* 항목 간 간격 */
        }
        /* 링크 스타일 */
        .submenu ul li a {
            text-decoration: none; /* 밑줄 제거 */
            color: white; /* 글자색 */
        }
        /* 링크 호버 효과 */
        .submenu ul li a:hover {
            color: red; /* 호버 시 색상 변경 */
        }
        .custom-hr {
            border: none; /* 기본 테두리 제거 */
            height: 2px; /* 줄 두께 */
            background-color: white; /* 줄 색상 */
            width: 85%; /* 줄의 너비 */
            margin: 10px 0; /* 상하 간격, 좌우 여백 제거 */
            text-align: left; /* 텍스트 정렬 */
        }

        /* 메인 배너 이미지 */
        .banner {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            gap: 20px; /* 이미지 간격 */
            margin: 20px auto; /* 상하 여백 및 중앙 배치 */
            width: 80%; /* 배너 전체 너비 줄이기 */
        }

        .banner img {
            width: 45%; /* 각 이미지의 너비 */
            height: auto;
            border-radius: 10px;
        }

        /* 탭 메뉴 */
        .tabs {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            gap: 30px; /* 항목 간 간격 */
            margin: 30px auto; /* 상하 여백 및 중앙 배치 */
            border-bottom: 1px solid #ddd;
            width: 70%; /* 탭 메뉴 너비 */
        }

        .tabs a {
            color: gray;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none; /* 밑줄 제거 */
        }

        .tabs a:hover,
        .tabs a.hot {
            color: red;
        }

        /* 이벤트 이미지 섹션 */
        .content-box {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            gap: 20px; /* 이미지 간 간격 */
            margin: 30px auto; /* 상하 여백 및 중앙 배치 */
            width: 80%; /* 이벤트 정보 전체 너비 */
        }

        .content-item {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 45%; /* 각 이벤트 항목 너비 */
        }

        .content-item img {
            width: 100%; /* 이미지 너비 조정 */
            height: auto;
            border-radius: 10px;
        }

        .content-item h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .content-item p {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <!-- 광고 부분 -->
    <div class="tit-head">
        <h2>DGV 할인정보</h2>
        <div class="menu-links">
            <a href="#">할인카드</a> | 
            <a href="#">KT 영화 무료/할인</a> | 
            <a href="#">LGU+ 나만의콕 영화무료</a>
        </div>
    </div>

    <!-- 배너 -->
    <div class="banner">
        <img src="https://via.placeholder.com/500x300" alt="배너 이미지1">
        <img src="https://via.placeholder.com/500x300" alt="배너 이미지2">
    </div>

    <!-- 탭 메뉴 -->
    <div class="tabs">
        <a href="#" class="hot">hot</a>
        <a href="#">통신사</a>
        <a href="#">신용카드</a>
        <a href="#">포인트</a>
        <a href="#">극장별할인</a>
    </div>

    <!-- 이벤트 정보 -->
    <div class="content-box">
        <div class="content-item">
            <img src="https://via.placeholder.com/250x200" alt="이벤트 이미지">
            <h3>GS&POINT 회원이라면 할인!</h3>
            <p>DGV에서 포인트로 영화 보자!</p>
        </div>
        <div class="content-item">
            <img src="https://via.placeholder.com/250x200" alt="이벤트 이미지">
            <h3>신세계포인트로 영화관람</h3>
            <p>영화 예매 시 500P 단위 사용!</p>
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

