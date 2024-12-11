<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
            body {
                margin: 0; /* 기본 여백 제거 */
                width: 100%;
                overflow-x: hidden;
                overflow-y: auto;
                background: black;
            }
            #main {
                border: 2px solid black; /* 메인 컨테이너에 검은색 테두리 추가 */
            }
            div {
                border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
            }
            #top {
                height: 230px; /* 원하는 높이로 조정 */
                margin-top: 20px; /* 위쪽 간격 조정 */
                overflow: hidden;
                display: flex; /* Flexbox 활성화 */
                flex-direction: column; /* 세로 방향으로 정렬 */
            }
            #top_menu {
                height: 70px; /* 상단 메뉴의 높이 설정 */
                overflow: auto; /* 창 사이즈가 줄어도 디자인 고정 */
            }
    
            .logo {
                width: 80px;
                height: auto;
            }
    
            .sidebar {
                 display: flex; /* Flexbox 사용 */
                 justify-content: center; /* 수평 중앙 정렬 */
                   align-items: center; /* 수직 중앙 정렬 (필요한 경우) */
                width: 300px;
                height: 100%;
                background: #ffffff !important;
                position: fixed;
                top: 0;
                right: -300px;
                z-index: 1;
                transition: all 0.35s ease;
                box-sizing: border-box;
                text-align: center;
            }
    
            .sidebar.open {
                right: 0;
            }
    
            .sidebar-content {
                padding: 20px;
                border: none;
                
            }
    
            .sidebar button {
                background-color: white;
                color: black;
                cursor: pointer;
                border-color: rgb(0, 0, 0);
                padding: 15px;
                min-height:5px; 
                min-width: 250px;
            }
    
            /* 로그인 버튼 hover 효과 */
            .sidebar button.loginBtn:hover {
            background-color: black;
            color: white;
            font-weight: bold;
            }
    
            /* 회원가입 버튼 hover 효과 */
            .sidebar button.signupBtn:hover {
            background-color: black; 
            color: white;
            font-weight: bold;
            }
    
            /* 상단 메뉴 아이콘 */
            .fa-solid, .fa-regular, .fa-lock {
                font-size: 24px;
                color: #ffffff;
                /* align-items: center; */
                cursor: pointer;
                padding: 10px;
            }
    
            .topIcon {
                height: 120px;
                display: flex;
                justify-content: flex-end;
                align-items: center;
                gap: 20px;
            }
    
            /* 사이드 바 안에 있는 닫기 버튼 */
            .fa-xmark {
                color: black;
                position: absolute;
                top: 10px;
                right: 10px;
            }
    
            /* <h3> 요소와 아이콘 사이에 간격 추가*/
            .sidebar h3 {
                margin-top: 50px;
            }
    
            /* 하이퍼링크 */
            a:hover {
                color: red;
            }
    
            /* 상단 메뉴아이콘 안의 메뉴들 */
            input[id*="upperMenu"] {
                display: none;
                width: 100%;
            }
            input[id*="upperMenu"] + label {
                display:block;
                padding: 10px;
                border: 1px solid;
                border-bottom: 0;
                color: white;
                font-weight: bold;
                background: black;
                cursor: pointer;
            }
            input[id*="upperMenu"] + label + div {
                max-height: 0;
                transition: all .35s;
                overflow: hidden;
                
            }
            input[id*="upperMenu"]:checked + label + div {
                max-height: 100px;
            }
    
            #movie_play {
                height: 620px;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
                background-color: black;
            }
            #movie_play video {
                max-height: 100%;
                object-fit: cover;
                margin-bottom: 20px;
            }
            #movie_chart {
                height: 400px; /* 영화 차트 영역의 높이 설정 */
            }
            #store {
                height: 300px; /* 스토어 영역의 높이 설정 */
                display: flex;
                justify-content: center;
                gap: 20px;
                width: 100%;
                max-width: 1500px;
                margin: 0 auto;
            }
            #noticeClient{
             display: flex;
              justify-content: left;
            }
            .package, .ticket, .giftcard {
                color: black;
                background: white;
                border-radius: 10px;
                text-align: center;
                /* border-color: white; */
                /* border: 2px dashed white;*/ /* 첫 번째 테두리 */
                /*outline: 2px solid white;*/ /* 두 번째 테두리 */
                /*outline-offset: 5px; */
                position: relative; /*아래 storeButton을 절대위치로 설정하기위해*/
                width: 450px;
                height: 300px;
                padding-top: 10px; /*안에 글자 조금 내려가게 윗부분 패딩설정*/
            }
    
            .package::before, .ticket::before, .giftcard::before {
                position: absolute;
                content: '';
                background: linear-gradient(-135deg, black 16px, transparent 0),
                            linear-gradient(135deg, black 16px, transparent 0);
                background-repeat: repeat-x;
                background-size: 32px;
                top: 0;
                left: 0;
                width: 100%;
                height: 32px;
            }
    
            .package::after, .ticket::after, .giftcard::after {
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
    
            #bottom {
                height: 250px; /* 하단 영역의 높이 설정 */
            }
            #company {
                height: 400px; /* 회사 정보 영역의 높이 설정 */
            }
    
            /* 드롭다운 메뉴 스타일 */
            #top_menu {
                height: 70px;
                overflow: auto;
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
            
            #noticeClient { 
                color: white; 
                padding: 0 25px; /* 좌우 패딩 설정 */ 
                border: 1px solid #f4f4f4; /* 흰색 테두리 */ 
                border-radius: 10px; 
                display: inline-block; /* 내용에 맞게 테두리 조절 */ 
                margin-left: 220px; /* 화면에서 오른쪽으로 이동 */
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
            .menubtn {
                color: white;
            }
            .menubtn2 {
                color: white;
                border: none;
                padding: 0;
                font-size: 18px;
            }
            .dropmenu {
                border: none;
                padding: 0;
                font-size: 18px;
                padding: 0 0 0 220px;
                background-color: black;
            }
            .dropmenu ul {
                background: black;
                height: 70px;
                list-style: none;
                margin: 0;
                padding: 0;
            }
            .dropmenu li {
                float: left;
                padding: 0;
            }
            .dropmenu li a {
                background: black;
                color: #fff;
                display: block;
                line-height: 70px;
                margin: 0;
                padding: 0 50px;
                text-align: center;
                text-decoration: none;
            }
            .dropmenu li a:hover, .dropmenu ul li:hover > a {
                border-bottom: 1px solid white;
            }
            .dropmenu li ul {
                background: black;
                display: none;
                height: auto;
                border: 0;
                position: absolute;
                z-index: 200;
            }
            .dropmenu li:hover ul {
                display: block;
            }
            .dropmenu li li {
                background: black;
                display: block;
                float: none;
                margin: 0;
                padding: 0;
                width: 150px;
            }
            .dropmenu li ul a {
                display: block;
                height: 70px;
                font-size: 12px;
                margin: 0;
                padding: 0 10px 0 15px;
                text-align: left;
                text-decoration: none;
            }
            .header {
                padding: 0 0 0 270px;
                color: white;
                margin-bottom: 40px;
                display: flex;
                margin-top: 50px;
            }
            .header h2, .header h4 {
                display: inline;
                margin: 0 10px;
            }
    
            .chart.show {
                opacity: 1;
                transform: translateY(0);
            }
            .chart.hide {
                opacity: 0;
                transform: translateY(20px);
            }
            button {
                background: none;
                border: none;
                color: white;
            }
            .menu-button h2 {
                color: gray;
            }
            .menu-button.active h2 {
                color: white;
            }
            #movie-list {
                color: gray;
                background: none;
                border: none;
                display: flex;
                align-items: center;
                font-size: 10pt;
                position: absolute; /* 절대 위치 설정 */
                left: 78%; /* 가운데 정렬 */
                cursor: pointer; /* 커서 변경 */
            }
            #movie_chart {
                display: flex; /* Flexbox 활성화 */
                justify-content: center; /* 수평 중앙 정렬 */
                padding: 0; /* 패딩 제거 */
                position: relative; /* 상대 위치 설정 */
            }
            .chart {
                /* width: 15%; */
                width: 200px;
                height: 300px;
                margin: 0 10px;
                display: inline-block;
                background-color: white;
                border-radius: 25px;
                transform: translateY(20px);
                transition: opacity 0.5s ease, transform 0.5s ease;
                box-sizing: border-box;
            }
    
            .hover-div {
                /* width: 15%; */ /* chart와 동일한 너비 */
                width: 200px;
                height: 300px; /* chart와 동일한 높이 */
                margin: 0 10px;
                display: none; /* 기본적으로 숨김 */
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 25px;
                box-sizing: border-box; /* 박스 크기 설정 */
                opacity: 0.8;
                z-index: 20;
                position: absolute;
    
            }
        </style>
    </head>
    <body>
        <div id="main"> <!-- 메인 컨테이너 -->
            <div id="top"> <!-- 상단 영역 -->
                <img src="sorce/img/DGV-로고.png" alt="로고" class="logo">
                <div class="topIcon">
                    <i class="fa-solid fa-lock"></i>
                    <i class="fa-regular fa-user"></i>
                    <i class="fa-solid fa-bars"></i>
                </div>
                <div class="sidebar">
                    <p>
                    <i class="fa-solid fa-xmark"></i>
                    <div class="sidebar-content"></div>
                    </p>
                </div>    
            </div>
    
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
            <div class="header">
                <button type="button" class="menu-button"><h2>무비차트</h2></button>
                <h4>|</h4>
                <button type="button" class="menu-button"><h2>상영예정작</h2></button>
                <h4>|</h4>
                <button type="button" class="menu-button"><h2>무비추천</h2></button>
                <button type="button" id="movie-list"><h3>더 많은 영화보기 +</h3></button> 
            </div>
    
            <div id="movie_chart">
                <div class="chart"></div>
                <div class="chart"></div>
                <div class="chart"></div>
                <div class="chart"></div>
                <div class="chart"></div>
            </div>
            <div id="hover_chart">
                <div class="hover-div"></div>
                <div class="hover-div"></div>
                <div class="hover-div"></div>
                <div class="hover-div"></div>
                <div class="hover-div"></div>
            </div>
            
            
            <div id="movie_chart"></div> 
            <div id="store"> <!-- 스토어 영역 -->
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
                    기프트카드 사진 넣을 곳
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
                                <strong>1234-1234</strong>
                                <span>고객센터 운영시간 (평일 09:00~18:00)
                                    <p>업무시간 외 자동응답 안내 불가능합니다.</p>
                                </span>
                            </dd>
                        </dl>
                        <div class="client_btn_wrap" id="client_btn_wrap">
                            <a href="http://www.cgv.co.kr/support/faq/default.aspx" class="btn">FAQ</a> <!-- 여기에 우리 링크 박아야함 -->
                            <a href="http://www.cgv.co.kr/support/qna/default.aspx">1:1 문의</a>  <!-- 여기에 우리 링크 박아야함 -->
                            <a href="http://www.cgv.co.kr/support/lease/default.aspx">대관/단체 문의</a>  <!-- 여기에 우리 링크 박아야함 -->
                        </div>
                    </div>
                </div>   
            <div id="company">company</div> <!-- 회사 정보 영역 -->
        </div>
    </body>
    
    
    <script>
    const login = document.querySelector('.fa-lock');
    const myPage = document.querySelector('.fa-user');
    const menu = document.querySelector('.fa-bars');
    const sidebar = document.querySelector('.sidebar');
    const closeButton = document.querySelector('.fa-xmark');
    const sidebarContent = document.querySelector('.sidebar-content');
    let signup = "";
    // 사이드바 열기닫기
    function moveSidebar(){
        sidebar.classList.toggle('open');
        signup = document.querySelector('#join');
        signup.addEventListener('click',function(){
            window.location.href = '/midpro/customer/CustomerInsert.jsp';
        });
    }
    
    //로그인버튼누르면 사이드 바 뜸
    login.addEventListener('click', function() { 
        // if(sidebar.style.right === '0px') {
        //     sidebar.style.right = '-300px'; //닫기
        // } else {
        //     sidebar.style.right = '0px'; //열기
        // }
        sidebarContent.innerHTML = ` 
                        <img src="sorce/img/DGV-로고.png" alt="로고" id="DGV" width="100" height="100">
                        <form action="/login" method="POST">
                        <label for="username">I D:</label>
                        <input type="text" id="username" name="username" placeholder="아이디를 입력하세요" required><br>
                            
                        <label for="password">PW:</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required><br><br>
                            
                        <button type="submit" class="loginBtn">Login</button>
        
                        <h6>아직 회원이 아니세요?</h6>
                        <button type="button" id="join" class="signupBtn">회원가입</button>
        
                        <h6><a href=#>비밀번호를 잊어버렸다면?</a></h6>
                        </form>  `;
        moveSidebar();                
       
    });
    //회원가입 버튼 누르면 회원가입 URL로 이동
    
    /* signup.addEventListener('click',function(){
        window.location.href = '/customer/CustomerInsert.jsp';
    }); */
    // 사이드바 닫기 버튼 클릭 시 사이드바 닫기
    closeButton.addEventListener('click', function() {
        // sidebar.style.right = '-300px';
        moveSidebar(); 
    });
    
    // ESC 눌러서 사이드 바 닫기
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            // sidebar.style.right = '-300px';
            moveSidebar(); 
        }
    });
    
    myPage.addEventListener('click', function() { 
        // if(sidebar.style.right === '0px') {
        //     sidebar.style.right = '-300px'; //닫기
        // } else {
        //     sidebar.style.right = '0px'; //열기
        // }
        sidebarContent.innerHTML = `<h3>로그인 후 이용해주세요</h3>`
        moveSidebar(); 
    });
    
    menu.addEventListener('click', function(){
        sidebarContent.innerHTML = `
                        <h3> 빠른 메뉴 찾기</h3>
                        <div class= "smallMenu">
                        <input type="checkbox" id="upperMenu1">
                        <label for="upperMenu1">영화</label>
                        <div><p>영화하위메뉴들</p></div>
                        <input type="checkbox" id="upperMenu2">
                        <label for="upperMenu2">극장</label>
                        <div><p>극장하위메뉴들</p></div>
                        <input type="checkbox" id="upperMenu3">
                        <label for="upperMenu3">예매</label>
                        <div><p>예매하위메뉴들</p></div>
                        <input type="checkbox" id="upperMenu4">
                        <label for="upperMenu4">스토어</label>
                        <div><p>스토어하위메뉴들</p></div>
                        <input type="checkbox" id="upperMenu5">
                        <label for="upperMenu5">이벤트</label>
                        <div><p>이벤트하위메뉴들</p></div>
                        <input type="checkbox" id="upperMenu6">
                        <label for="upperMenu6">혜택</label>
                        <div><p>혜택하위메뉴들</p></div>
                    </div>`;
        moveSidebar();
    });   
    
    document.addEventListener('DOMContentLoaded', function() {
        const videoPlayer = document.getElementById('videoPlayer');
    
        function movie_play(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }
    
        function loadRandomVideo() {
            const randomVideo = movie_play(1, 3);
            const sources = videoPlayer.querySelectorAll('source');
    
            sources.forEach(source => source.src = '');
    
            switch (randomVideo) {
                case 1:
                    sources[0].src = 'sorce/영상 소스파일1.mp4';
                    break;
                case 2:
                    sources[1].src = 'sorce/영상 소스파일2.mp4';
                    break;
                case 3:
                    sources[2].src = 'sorce/영상 소스파일3.mp4';
                    break;
            }
    
            videoPlayer.load();
        }
    
        loadRandomVideo();
        videoPlayer.addEventListener('ended', loadRandomVideo);
    });
    
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
    
        // '더 많은 영화보기' 버튼 클릭 시 애니메이션을 적용하지 않도록 설정
        if (movieListButton) {
            movieListButton.addEventListener('click', function(event) {
                // 애니메이션을 적용하지 않음
                charts.forEach((chart) => {
                    chart.classList.remove('show'); // 애니메이션을 제거
                });
            });
        }
    });
    
    const charts = document.querySelectorAll('.chart');
    const hoverDivs = document.querySelectorAll('.hover-div');
    
    charts.forEach((chart, index) => {
        chart.addEventListener('mouseover', () => {
            const rect = chart.getBoundingClientRect();
            const hoverDiv = hoverDivs[index];
    
            // hover-div의 위치와 크기 설정
            // hoverDiv.style.left = `${rect.left + 10}px`; // 오른쪽 여백 고려
            hoverDiv.style.left = `${rect.left-10}px`; // 오른쪽 여백 고려
            hoverDiv.style.top = `${rect.top + window.scrollY}px`; // 스크롤 위치 반영
            hoverDiv.style.display = 'block'; // hover-div 표시
        });
    
        chart.addEventListener('mouseout', () => {
            const hoverDiv = hoverDivs[index];
            hoverDiv.style.display = 'none'; // hover-div 숨김
        });
    });
    </script>
    </html>
    