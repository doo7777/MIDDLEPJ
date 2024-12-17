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
            <form action="=request.getContextPath()/cusLogin.do" method="POST" id="loginform">
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
                <result.getCust_name()님 반갑습니다!!<br>
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
              window.location.href = "=request.getContextPath()/cusLogout.do";
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
    
 
