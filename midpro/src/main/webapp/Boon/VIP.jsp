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

        /* VIP 메인 영역 */
        .tit-head h2 {
            text-align: center; /* 텍스트 중앙 정렬 */
            color: white; /* 글자색 하얀색 */
            margin: 0; /* 기본 여백 제거 */
            font-size: 28px; /* 글자 크기 설정 */
            font-weight: bold; /* 굵은 글꼴 */
            margin-bottom: 20px; /* 하단 여백 추가 */
        }

        /* VIP */
        /* 전체 컨테이너 */
        .vip-lounge-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: black;
        }

        /* 타이틀 스타일 */
        .vip-lounge-title h2 {
            text-align: center;
            border-bottom: 2px solid;
            display: inline-block;
            padding-bottom: 10px;
            font-size: 28px;
            color: white;
            margin: 20px 0;
        }

        /* VIP 헤더 */
        .vip-header {
            background: black;
            color: white;
            text-align: center;
            
        }
        .vip-header h2 {
            font-size: 30px;
            font-weight: bold;
        }
        .vip-header p {
            margin-top: 10px;
            font-size: 16px;
        }

        /* VIP 배지와 프로그레스 스타일 */
        .vip-info-wrapper {
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            background: black;
            padding: 20px; /* 내부 여백 유지 */
            color: white;
            max-width: 1000px; /* 너비를 줄여서 안쪽으로 모으기 */
            margin: 0 auto; /* 중앙 배치 */
            border-radius: 10px; /* 둥근 테두리 추가 (선택사항) */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 가벼운 그림자 추가 (선택사항) */
        }

        .vip-badge {
            width: 120px;
            height: 120px;
            background: #ef8400;
            color: white;
            font-size: 20px;
            font-weight: bold;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .vip-progress {
            margin-left: 0px;
            flex: 2;
            margin-left: 30px;
        }
        .vip-progress p {
            font-size: 18px;
            font-weight: 500;
        }
        .vip-progress em {
            color: #ef8400;
            font-style: normal;
        }
        .progress-container {
            width: 100%; /* 컨테이너 너비 */
            background: none; /* 문제 해결: 배경색 제거 */
            height: 10px;
            border-radius: 5px;
            position: relative;
        }
        .progress-bar {
            width: 100%; /* 초기 값 */
            background: #ef8400; /* 진행 바 색상 */
            height: 10px;
            border-radius: 5px;
        }
        .progress-text {
            font-size: 14px;
            margin-top: 5px;
            color: #ef8400;
        }

        /* VIP 점수 기준 섹션 */
        .vip-points-container {
            margin-top: 20px;
        }
        .vip-points-section {
            border: 1px dashed white;
            padding: 20px;
            margin-bottom: 20px;
            background: black;
        }
        .vip-points-section h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ef8400;
        }
        .vip-points-section ul {
            list-style: none;
            padding-left: 0;
            line-height: 1.8;
            font-size: 14px;
            color: white;
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <!-- VIP LOUNGE 섹션 시작 -->
    <div class="vip-lounge-container">
        <div class="vip-lounge-content">
            <div class="vip-header">
                <h2>VIP LOUNGE</h2>
                <p>영화마니아라면 놓칠 수 없는 특별한 혜택</p>
            </div>

            <div class="vip-info-wrapper">
                <div class="vip-badge">
                    일반
                </div>
                <div class="vip-progress">
                    <p><span>su**jh0712</span> 님은 <em>일반</em>입니다.</p>
                    <div class="progress-container">
                        <div class="progress-bar"></div>
                    </div>
                    <p class="progress-text">
                        <span>0점</span> / <span>10,000점</span>
                    </p>
                </div>
            </div>
        </div>

        <!-- VIP 점수 기준 및 제외 기준 -->
        <div class="vip-points-container">
            <div class="vip-points-section">
                <h3>VIP점수 반영 기준</h3>
                <ul>
                    <li>· DGV에서 매표, 매점, 씨네드쉘프 F&B, 오프라인 내 써비스에서 구매하신 금액 기준 및 이벤트 보상이 합산되어 반영됩니다.</li>
                    <li>· 구매 시, CJ ONE 포인트 적립 등 고객정보가 반영된 내역으로 집계됩니다.</li>
                    <li>· 매표는 사전예매 5%, 당일예매 3%로, 상영일 기준 익월 누적 반영됩니다.</li>
                    <li>· 매점과 부대시설은 3%로, 결제일 기준 익월 반영됩니다.</li>
                    <li>· VIP점수 반영일이 2~3일 지연될 수 있습니다.</li>
                </ul>
            </div>
            <div class="vip-points-section">
                <h3>VIP점수 제외 기준</h3>
                <ul>
                    <li>· CJ ONE 포인트와 VIP점수는 무관합니다.</li>
                    <li>· CJ ONE 이벤트 보상, 실물경품 등 VIP 멤버십과 무관한 적립 내역은 제외됩니다.</li>
                    <li>· 구매 시 CJ ONE 포인트 사용을 비롯한 쿠폰 등 할인 적용된 금액은 제외됩니다.</li>
                </ul>
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

