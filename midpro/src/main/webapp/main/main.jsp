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
            background-color: white;
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
            cursor: pointer; 
            
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
            background-color: gray; /* 배경색 */
            color: white; /* 글자색 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 마우스 커서 변경 */
            width: 50px; /* 너비 조정 (필요에 따라 조정) */
            height: 2px; /* 높이 조정 (필요에 따라 조정) */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-top: 320px; /* 위쪽 여백 추가 (아래로 이동) */
        }

        .reservation_btn:hover {
            background-color: #333333; /* 호버 시 배경색 변경 */
        }

        /* FAQ, 1:1문의, 대관게시판 */
        .client_btn_wrap a {
            display: inline-block;
            margin-right: 10px;
            color: #f4f4f4;
            text-decoration: none;
        }
        #QR{
          position: relative;
   		  left: 31px;
    	  top: 28px;	
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
    </style>
</head>

<body>
        <%@ include file="Top.jsp" %>
    <div id="movie_play"><!-- 영화 재생 영역 -->
        <video autoplay muted loop>
            <source src="sorce/영상 소스파일1.mp4" type="video/mp4">
            <source src="sorce/영상 소스파일2.mp4" type="video/mp4"> <!-- 최종 파일명 수정해야됨 -->
            <source src="sorce/영상 소스파일3.mp4" type="video/mp4"> <!-- 최종 파일명 수정해야됨 -->
        </video>
    </div>

    <div class="header">
        <button type="button" class="menu-button"><h2>무비차트</h2></button>
        <h4>|</h4>
        <button type="button" class="menu-button"><h2>상영예정작</h2></button>
        <h4>|</h4>
        <button type="button" class="menu-button"><h2>무비추천</h2></button>
        <button type="button" class="movie-list"><h3>더 많은 영화보기 +</h3></button>
    </div>

    <div class="header" id="movie_chart">
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
        <div class="chart">
            <div class="chart reservation_btn">예매</div>
        </div>
    </div>

    <div class="header" id="store"> <!-- 스토어 영역 -->
        <div class="package">
            <i class="fa-solid fa-plus"></i>
            <h3>패키지</h3>
            <img src="sorce/img/패키지(완료)/나랑-너-패키지.jpg" width=150px height=150px>
        </div>
        <div class="ticket">
            <i class="fa-solid fa-plus"></i>
            <h3>영화관람권</h3>
            <img src="sorce/img/영화관람권(완료)/4DX-영화관람권.jpg" width=150px height=150px>
        </div>
        <div class="giftcard">
            <i class="fa-solid fa-plus"></i>
            <h3>기프트카드</h3>
        </div>
    </div>
    <br><br>
    <div id="noticeClient" style="color: white;">
        <div id="notice_wrap" class="notice_wrap">
            <dt><strong>공지사항</strong></dt>
            <dd>
                <a href="/support/news/detail-view.aspx?idx=8062" class="btn">[행사/이벤트][DGV] '24년 12월 문화 주간 관련 안내...</a>
                <a href="http://www.cgv.co.kr/support/news/default.aspx" id="notice_more" class="btn">더보기</a>
            </dd>
        </div>

        <div class="client_wrap">
            <dl class="client_list">
                <dt><strong>고객센터</strong></dt>
                <dd>
                    <strong>042-222-8202</strong>
                    <p>
                        고객센터 운영시간 (평일 09:00~18:00) <br>
                        업무시간 외 자동응답 안내 불가능합니다.
                    </p>
                </dd>
            </dl>
            <div class="client_btn_wrap" id="client_btn_wrap">
                <a href="http://www.cgv.co.kr/support/faq/default.aspx" class="btn">FAQ</a> 
                <a href="http://www.cgv.co.kr/support/qna/default.aspx">1:1 문의</a>
                <a href="http://www.cgv.co.kr/support/lease/default.aspx">대관/단체 문의</a>  
            </div>
        </div>
    </div>
            	 <img alt="QR" src="/midpro/main/sorce/img/QR.jpg" id="QR">
    <!-- 회사 정보 영역 -->
    <%@ include file="Bottom.jsp" %>
</body>

<script>
	$('.movie-list').on('click',function(){
		window.location.href = '<%=request.getContextPath()%>/Movie/movieChart1.jsp';
	});

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

