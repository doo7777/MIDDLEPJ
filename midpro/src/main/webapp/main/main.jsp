<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
body {
            margin: 0; /* 기본 여백 제거 */
        }
        #main {
            border: 2px solid black; /* 메인 컨테이너에 검은색 테두리 추가 */
        }
        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
        }
        #top {
            height: 140px; /* 상단 영역의 높이 설정 */
        }
        #top_menu {
            height: 70px; /* 상단 메뉴의 높이 설정 */
            overflow: auto; /* 창 사이즈가 줄어도 디자인 고정 */
        }
        #movie_play {
            height: 500px; /* 영화 재생 영역의 높이 설정 */
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* 비디오가 영역을 넘어갈 경우 잘리도록 설정 */
        }
        #movie_chart {
            height: 400px; /* 영화 차트 영역의 높이 설정 */
        }
        #store {
            height: 300px; /* 스토어 영역의 높이 설정 */
        }
        #bottom {
            height: 250px; /* 하단 영역의 높이 설정 */
        }
        #company {
            height: 400px; /* 회사 정보 영역의 높이 설정 */
        }

        /* 드롭다운 메뉴 스타일 */
        #top_menu{
            width: 100%;
        }
        .dropmenu {
            border: none; /* 드롭다운 메뉴의 테두리 제거 */
            padding: 0; /* 기본 패딩 제거 */
            /* font: "sans-serif"; */ /* 글꼴 설정 */
            font-size: 18px; /* 글꼴 크기 설정 */
            padding: 0 0 0 200px; /* 상단 메뉴바 위치 조정 */
            background-color: black; /* 상단 메뉴바 배경색 */
        }

        .dropmenu ul {
            background: black; /* 드롭다운 메뉴 배경색 설정 */
            height: 70px; /* 메뉴 높이 설정 */
            list-style: none; /* 리스트 스타일 제거 */
            margin: 0; /* 기본 여백 제거 */
            padding: 0; /* 기본 패딩 제거 */
        }

        .dropmenu li {
            float: left; /* 메뉴 항목을 수평으로 배치 */
            padding: 0; /* 기본 패딩 제거 */
        }

        .dropmenu li a {
            background: black; /* 메뉴 항목 배경색 설정 */
            color: #fff; /* 메뉴 항목 글자색 설정 */
            display: block; /* 블록 요소로 설정 */
            line-height: 70px; /* 메뉴 항목의 수직 중앙 정렬 */
            margin: 0; /* 기본 여백 제거 */
            padding: 0 25px; /* 좌우 패딩 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
            text-decoration: none; /* 텍스트 장식 제거 */
        }

        /* 하얀 선이 생길 메뉴 항목에 대한 스타일 */
        .highlight:hover {
            display: inline-block; /* inline-block으로 설정 */
            border-bottom: 2px solid white; /* 밑줄 추가 */
            padding-bottom: 2px; /* 텍스트와 선 사이의 간격 조정 */
        }

        .dropmenu li a:hover, .dropmenu ul li:hover > a {
            display: inline-block; /* inline-block으로 설정 */
            border-bottom: 2px solid white; /* 밑줄 추가 */
        }

        .dropmenu li ul {
            background: black; /* 하위 메뉴 배경색 설정 */
            display: none; /* 기본적으로 하위 메뉴 숨김 */
            height: auto; /* 하위 메뉴 높이 자동 설정 */
            border: 0; /* 테두리 제거 */
            position: absolute; /* 절대 위치 설정 */
            width: 200px; /* 하위 메뉴 너비 설정 */
            z-index: 200; /* z-index 설정으로 다른 요소 위에 표시 */
        }

        .dropmenu li:hover ul {
            display: block; /* 상위 메뉴 항목에 마우스를 올리면 하위 메뉴 표시 */
        }

        .dropmenu li li {
            background: black; /* 하위 메뉴 항목 배경색 설정 */
            display: block; /* 블록 요소로 설정 */
            float: none; /* 수직 배치 */
            margin: 0; /* 기본 여백 제거 */
            padding: 0; /* 기본 패딩 제거 */
            width: 300px; /* 하위 메뉴 항목 너비 설정 */
        }
        .dropmenu li ul a {
            display: block; /* 블록 요소로 설정 */
            height: 50px; /* 하위 메뉴 항목 높이 설정 */
            font-size: 14px; /* 하위 메뉴 항목 글꼴 크기 설정 */
            margin: 0; /* 기본 여백 제거 */
            padding: 0 10px 0 15px; /* 좌우 패딩 설정 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
            text-decoration: none; /* 텍스트 장식 제거 */
        }

        /* .dropmenu li ul a:hover {
            text-decoration: none; 하위 메뉴 항목에 마우스를 올려도 하얀 선이 생기지 않도록 설정
            color: #FFFFFF; 마우스 오버 시 글자색 변경
        } */

        /* .dropmenu p {
            clear: left; 왼쪽 정렬 해제
        } */
    </style>
</head>
<body>
    <div id="main"> <!-- 메인 컨테이너 -->
        <div id="top">top</div> <!-- 상단 영역 -->
        <div id="top_menu" class="dropmenu"> <!-- 드롭다운 메뉴 -->
            <ul>
                <li><a href="#" class="highlight">영화</a> <!-- 영화 메뉴 항목 -->
                    <ul>
                        <li><a href="#">무비차트</a></li> <!-- 하위 메뉴: 무비차트 -->
                        <li><a href="#">상영예정작</a></li> <!-- 하위 메뉴: 상영예정작 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight" id="current">극장</a></li> <!-- 극장 메뉴 항목 -->
                <li><a href="#" class="highlight">예매</a> <!-- 예매 메뉴 항목 -->
                    <ul>
                        <li><a href="#">빠른예매</a></li> <!-- 하위 메뉴: 빠른예매 -->
                        <li><a href="#">상영스케줄</a></li> <!-- 하위 메뉴: 상영스케줄 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight">스토어</a> <!-- 스토어 메뉴 항목 -->
                    <ul>
                        <li><a href="#">패키지</a></li> <!-- 하위 메뉴: 패키지 -->
                        <li><a href="#">영화관람권</a></li> <!-- 하위 메뉴: 영화관람권 -->
                        <li><a href="#">기프트카드</a></li> <!-- 하위 메뉴: 기프트카드 -->
                        <li><a href="#">콤보</a></li> <!-- 하위 메뉴: 콤보 -->
                        <li><a href="#">팝콘</a></li> <!-- 하위 메뉴: 팝콘 -->
                        <li><a href="#">음료</a></li> <!-- 하위 메뉴: 음료 -->
                        <li><a href="#">스낵</a></li> <!-- 하위 메뉴: 스낵 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight">이벤트</a> <!-- 이벤트 메뉴 항목 -->
                    <ul>
                        <li><a href="#">스페셜</a></li> <!-- 하위 메뉴: 스페셜 -->
                        <li><a href="#">영화/예매</a></li> <!-- 하위 메뉴: 영화/예매 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight">혜택</a> <!-- 혜택 메뉴 항목 -->
                    <ul>
                        <li><a href="#">DGV 할인정보</a></li> <!-- 하위 메뉴: DGV 할인정보 -->
                        <li><a href="#">VIP 라운지</a></li> <!-- 하위 메뉴: VIP 라운지 -->
                    </ul>
                </li>
            </ul>
        </div>

        <div id="movie_play"><!-- 영화 재생 영역 -->
            <video autoplay muted loop>
                <source src="sorce/영상 소스파일1.mp4" type="video/mp4">
            </video>
        </div>
        <div id="movie_chart"></div> 
        <div id="store">store</div> <!-- 스토어 영역 -->
        <div id="bottom">bottom</div> <!-- 하단 영역 -->
        <div id="company">company</div> <!-- 회사 정보 영역 -->
    </div>
</body>
</html>
