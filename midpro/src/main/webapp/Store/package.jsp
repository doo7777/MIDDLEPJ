<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>DGV</title> <!-- 문서 제목 -->
        <style>
            
            /* 전체 화면 사이즈 */
            body {
                margin: 0;
                width: 100%;
                overflow-x: hidden;
                /* overflow-y: auto; */ 
                background: black;
            }
            div {
                border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
            }

            /* 최상단 */
            #top {
                height: 140px; 
                overflow: hidden;
                display: flex; 
                position: relative; 
                /* flex-direction: column; */
            }
            #top_menu {
                overflow: auto; 
            }
            .logo {
                width: 150px;
                position: absolute;
                left: 250px;
                height: auto;
            }
            .DGV{
                color: rgb(216, 216, 216);
                position: absolute;
                left: 390px;
                top: 90px;
                font-weight: bold;
                overflow: hidden;
                white-space: nowrap; 
            }

            /* 우측 상단 메뉴 아이콘 */
            .fa-headset, .fa-regular, .fa-lock {
                font-size: 24px;
                color: #ffffff;
                /* align-items: center; */
                cursor: pointer;
                padding: 10px;
            }
            .topIcon {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                gap: 20px;
                border: none;
                max-width: 100%;
                flex-wrap: nowrap;
                transform: translateX(1390px); 
            }
            .icon-text {
                display: flex;
                flex-direction: column; /* 수직 정렬 */
                align-items: center; /* 수평 중앙 정렬 */
                color: white;
                position: relative;
                white-space: nowrap;
            }
            #btnfont{
                display: flex;
                position: relative;
                top: -15px;
            }

            /* 상단 메뉴바 */
            .dropmenu {
                height: 70px;
                overflow: auto;
                width: 100%;
                border: none;
                padding: 0;
                font-size: 18px;
                padding: 0 0 0 220px;
                background-color: black;
            }
            .dropmenu li a {
                color: #fff;
                display: block;
                line-height: 70px;
                margin: 0;
                padding: 0 50px;
                text-align: center;
                text-decoration: none;
            }
            .dropmenu ul {
                height: 70px;
                list-style: none;
                margin: 0;
                padding: 0;
            }
            .dropmenu li {
                float: left;
                padding: 0;
            }

            /* 하위메뉴 */
            .dropmenu li:hover ul {
                display: block; /* 마우스 올리면 하위메뉴 보여지기 */
            }
            .dropmenu li ul {
                background: black; /* 하위 메뉴 배경색 설정 */
                display: none; /* 기본적으로 하위 메뉴 숨김 */
                height: auto; /* 하위 메뉴 높이 자동 설정 */
                border: 0; /* 테두리 제거 */
                position: absolute; /* 절대 위치 설정 */
                z-index: 200; /* z-index 설정으로 다른 요소 위에 표시 */
            }
            .dropmenu li li {
                display: block; /* 블록 요소로 설정 */
                float: none; /* 수직 배치 */
                margin: 0; /* 기본 여백 제거 */
                width: 150px; /* 하위 메뉴 항목 너비 설정 */
            }
            .dropmenu li ul a {
                font-size: 13px;
                padding: 0 0 0 30px;
                text-align: left;
            }
            .dropmenu li a:hover, .dropmenu ul li:hover > a {
                border-bottom: 1px solid white;
            }

            /* 비디오 영역 */
            hr{
                margin: -20px 0 0;
                border: none;
                height: 2px;
                background-color: #ef8400;
            }
   
            /* 상단 검색창 */
            .search-container {
                position: relative;
                display: inline-block;
                left: 1370px;
                bottom: 60px;
            }
            .search-container input[type="text"] {
                padding: 10px 40px 10px 15px; /* 패딩 설정 */
                border: 2px solid #ef8400; /* 테두리 색상 */
                outline: none; /* 기본 테두리 색 제거 */
                border-radius: 5px; /* 모서리 둥글게 */
                background-color: black; /* 배경색 */
                color: white; /* 글자색 */
                font-size: 16px; /* 글자 크기 */
            }
            .search-container button {
                position: absolute;
                right: 5px;
                top: 50%;
                transform: translateY(-50%);
                background: none; /* 배경 제거 */
                border: none; /* 테두리 제거 */
                cursor: pointer; /* 커서 변경 */
                color: white; /* 아이콘 색상 */
                font-size: 18px; /* 아이콘 크기 */
            }
            
            /* 회사소개 */
            #company {
                height: 400px; /* 회사 정보 영역의 높이 설정 */
                margin-top: 5%;
                color: white;
                
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
            .menu-button.active h2 {
                color: white;
            }
            #bottom {
                height: 250px; /* 하단 영역의 높이 설정 */
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

            .policy_list { 
               display: flex; 
               flex-wrap: wrap; 
               list-style: none; 
               padding: 10; 
               margin: 0 440px; 
            } 
            .policy_list li { 
               margin-right: 15px; /* 단어 사이 간격 조절 */
               padding: 0; 
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
        <div id="main"> <!-- 메인 컨테이너 -->
            <div id="top"> <!-- 상단 영역 -->
            
                <img src="sorce/img/DGV-로고.png" alt="로고" class="logo">
                <span class="DGV">D a e d u c k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G r a n d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V i s i o n</span>
                <div class="topIcon">
                
                
                    <div class="icon-text">
                        <i class="fa-solid fa-lock" id="loginbutton"></i>
                        <h4 id="btnfont" class="login">로그인</h4>
                    </div>
                    <div class="icon-text">
                        <i class="fa-regular fa-user"></i>
                        <h4 id="btnfont" class="mypage">마이페이지</h4>
                    </div>
                    <div class="icon-text">
                        <i class="fas fa-headset"></i> 
                        <h4 id="btnfont" class="service center">고객센터</h4>
                    </div>
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
                    <li><a href="#" class="highlight">영화</a> <!-- 기모찡 -->
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
            <div class="search-container">
                <input type="text" id="search" placeholder="검색어 입력">
                <button type="button" id="searchButton">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
            <hr>


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

            <!-- 회사 정보 영역 -->
            <div id="company" class="sect-ad">
                <hr>
                    <address>(34908)대전광역시 중구 계룡로 846, 3-4층</address> 
                        <dt>이사장 :</dt>
                        <dt>김형응</dt>
                        <dd>사업자등록번호 :</dd>
                        <dt>306-82-05291</dt>
                        <dd>대표전화 :</dd>
                        <dt>042-222-8202</dt>
                    <p>&copy; DGV. All Rights Reserved</p>
            </div>
        </div>  
    </body>
    
    <script>
    const login = document.querySelector('#loginbutton');
    const myPage = document.querySelector('.fa-user');
    // const menu = document.querySelector('.fa-bars');
    const sidebar = document.querySelector('.sidebar');
    const closeButton = document.querySelector('.fa-xmark');
    const sidebarContent = document.querySelector('.sidebar-content');
    
    
    function updateSidebarContent() {
        sidebarContent.innerHTML = ` 
            <img src="sorce/img/DGV-로고.png" alt="로고" id="DGV" width="100" height="100">
            <form action="request.getContextPath()/cusLogin.do" method="POST" id="loginform">
            if(result==null){
            <div class="IDBtn"> 
            <img src="sorce/img/로그인/ID사진.png" alt="ID" id="DGV" width="30" height="30" class="ID_img"> 
            <input type="text" title="아이디" id="username" name="cust_id"  required class="IDBtn_box">
            <br><br> 
            </div> 
            <div class="PWBtn"> 
            <img src="sorce/img/로그인/PW사진.png" alt="PW" id="DGV" width="32" height="32" class="PW_img">
            <input type="password" title="패스워드" id="password" name="cust_pw"  required class="PWBtn_box">
            <br><br> 
            </div>
            <button type="submit" class="login" id="login">Login</button>
                <h6>아직 회원이 아니세요?</h6>
                <button type="button" id="join" class="signupBtn">회원가입</button>
                <h6><a href="#">비밀번호를 잊어버렸다면?</a></h6>
                }else{
                result.getCust_name()님 반갑습니다!!<br>
                현재 DGV 등급 :result.getCust_grade()등급
                <button type="button" id="logout">로그아웃</button>
                }
            </form>`;
    }; 
    
    function moveSidebar() {
        sidebar.classList.toggle('open');
        const signup = document.querySelector('#join');
        if (signup) {
            signup.addEventListener('click', function() {
                window.location.href = '/midpro/customer/Signup.jsp';
            });
        }
        const logout = document.querySelector("#logout");
        if(logout){
           logout.addEventListener('click',function(){
              window.location.href = "request.getContextPath()/cusLogout.do";
           });
        }
        
    }
   
    const barParam = 'request.getParameter("bar")';
    if (barParam === 'on') {
        updateSidebarContent();
        moveSidebar();
    }

    login.addEventListener('click', function() {
        updateSidebarContent();
        moveSidebar();
    });
    
    // 사이드바 닫기 버튼 클릭 시 사이드바 닫기
    closeButton.addEventListener('click', function() {
        moveSidebar(); 
    });
    
    // ESC 눌러서 사이드 바 닫기
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            moveSidebar(); 
        }
    });
    
    // 마이페이지 클릭 시 메시지 표시
    myPage.addEventListener('click', function() { 
        sidebarContent.innerHTML = `<h3>로그인 후 이용해주세요</h3>`;
        moveSidebar(); 
    }); 
</script>
</html>
    
 
