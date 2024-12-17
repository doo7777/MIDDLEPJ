
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
        /* 고객센터 */
            /* 전체 레이아웃 */
            .customer-service-container {
                display: flex;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                gap: 20px;
                font-family: Arial, sans-serif;
                color: white;
            }

            /* 왼쪽 메뉴 */
            .left-menu {
                flex: 1;
            }

            .menu-button {
                background-color: #ef8400;
                color: white;
                border: none;
                width: 100%;
                padding: 10px;
                font-weight: bold;
                font-size: 16px;
                cursor: pointer;
            }

            .left-menu ul {
                margin-top: 20px;
                list-style: none;
                padding: 0;
            }

            .left-menu li {
                padding: 10px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .left-menu li:hover {
                background-color: #f8f8f8;
                color: #ef8400;
            }

            .banner-image {
                width: 100%;
                margin-top: 20px;
                border-radius: 5px;
            }

            /* 메인 컨텐츠 */
            .main-content {
                flex: 3;
            }

            .quick-search {
                background-color: #ef8400;
                color: white;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
            }

            .quick-search input {
                width: 97%;
                padding: 10px;
                margin-top: 10px;
                border: none;
                border-radius: 5px;
            }

            .quick-search-buttons{
                border-color: transparent;
                margin-top: 10px;
            }

            .quick-search-buttons span {
                background-color: white;
                color: #ef8400;
                padding: 5px 10px;
                margin: 5px;
                border-radius: 5px;
                display: inline-block;
                cursor: pointer;
                font-size: 14px;
            }

            .quick-options {
                display: flex;
                gap: 20px;
                margin-top: 5px;
            }

            .option-box {
                flex: 1;
                text-align: center;
                /* border: 1px solid #ddd; */
                padding: 15px;
                border-radius: 5px;
            }

            .option-box i {
                font-size: 30px;
                margin-bottom: 10px;
                color: white;
                height: 0.1px;
            }

            .option-box button {
                margin-top: 10px;
                padding: 5px 10px;
                background-color: #555;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .news {
                padding-left: 3px;
            }
            .news span {
                padding-left: 30px;
            }

            .notice ul li {
                display: flex;
                justify-content: space-between;
                margin-bottom: 5px;
                font-size: 14px;
            }

            .bottom-buttons {
                display: flex;
                gap: 20px;
                margin-top: 5px;
                color: black;
            }

            .button-box {
                flex: 1;
                text-align: center;
                border: 1px solid #ddd;
                padding: 20px;
                font-weight: bold;
                background-color: #f8f8f8;
                border-radius: 5px;
            }

            .additional-services {
                display: flex;
                gap: 20px;
                margin-top: 20px;
                color: black;
            }

            .service-card {
                flex: 1;
                background-color: #f8f8f8;
                border: 1px solid #ddd;
                padding: 15px;
                text-align: center;
                border-radius: 5px;
            }

            .service-card button {
                margin-top: 10px;
                padding: 5px 10px;
                background-color: #333;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
    </style>
</head>

<body>
    <div>
        <%@ include file="Top.jsp" %>
    </div>
    <div id="main"> <!-- 메인 컨테이너 -->
        <div class="customer-service-container">
            <!-- 왼쪽 메뉴 -->
            <div class="left-menu">
                <button class="menu-button active">고객센터 메인</button>
                <ul>
                    <li>공지사항</li>
                    <li>자주찾는 질문</li>
                    <li>대관신청</li>
                    <li>1:1 문의</li>
                </ul>
            </div>
        
            <!-- 메인 컨텐츠 -->
            <div class="main-content">
                <div class="quick-search">
                    <h3>자주찾는 질문 빠른검색</h3>
                    <input type="text" placeholder="검색어를 입력해 주세요">
                    <div class="quick-search-buttons">
                        <span>현금영수증</span>
                        <span>관람권</span>
                        <span>예매 환불</span>
                        <span>취소</span>
                    </div>
                </div>
        
                <div class="quick-options">
                    <div class="notice">
                        <h4>공지/뉴스</h4>
                        <ul class="news">
                            <li>[DGV] '24년 12월 문화 주간 관련 안내 <span>2024.12.04</span></li>
                            <li>[시스템점검] iOS 18 업데이트 관련 예매 서비스 이용 안내 <span>2024.09.13</span></li>
                            <li>[기타] [DGV] 해피머니상품권 사용중지 안내 <span>2024.07.25</span></li>
                            <li>[DGV] 무대인사 예매취소 정책 변경 안내 <span>2024.01.02</span></li>
                            <li>[극장] [DGV화명] 영업 종료 안내 <span>2024.12.16</span></li>
                        </ul>
                    </div>
                    <div class="option-box">
                        <i class="fa-regular fa-file-lines"></i>
                        <h4>내 상담 내역 확인</h4>
                        <p>문의하신 내용을 확인하실 수 있습니다.</p>
                        <button>문의내역 조회</button>
                    </div>
                </div>
        
                <!-- 하단 버튼 -->
                <div class="bottom-buttons">
                    <div class="button-box">DGV PREVIEW <br><span>시사회/무대인사</span></div>
                    <div class="button-box">DISCOUNT INFO <br><span>할인카드 및 혜택 안내</span></div>
                </div>
        
                <!-- 추가 서비스 -->
                <div class="additional-services">
                    <div class="service-card">
                        <h4>대관/단체 서비스</h4>
                        <p> DGV에서 진행하는 우리만의 특별한 이벤트</p>
                        <button>바로가기</button>
                    </div>
                    <div class="service-card">
                        <h4>VIP 안내</h4>
                        <p>영화를 사랑하는 당신에게 드리는 특별한 DGV VIP 혜택</p>
                        <button>바로가기</button>
                    </div>
                    <div class="service-card">
                        <h4>VIP 고객센터</h4>
                        <p>VIP 고객님을 위해 알리는 혜택</p>
                        <button>바로가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 회사 정보 영역 -->
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

