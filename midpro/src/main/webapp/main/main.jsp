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
                overflow-y: auto;
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
                flex-direction: column;
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
            /* 패키지, 영화관람권, 기프트카드 */
            #store {
                height: 300px; 
                display: flex;
                justify-content: center;
                gap: 20px;
                /* width: 100%; */
                /* max-width: 1500px; */
                /* margin: 0 auto; */
            }
            .package, .ticket, .giftcard {
                background: white;
                border-radius: 10px;
                text-align: center;
                position: relative; /*아래 storeButton을 절대위치로 설정하기위해*/
                width: 450px;
                padding-top: 10px; /*안에 글자 조금 내려가게 윗부분 패딩설정*/
                /* color: black; */
                /* border-color: white; */
                /* border: 2px dashed white;*/ /* 첫 번째 테두리 */
                /*outline: 2px solid white;*/ /* 두 번째 테두리 */
                /*outline-offset: 5px; */
                /* height: 300px; */
            }
            .package::before, .ticket::before, .giftcard::before {
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
            /* 우측 상단 메뉴 아이콘 */
            .fa-headset, .fa-regular, .fa-lock {
                font-size: 24px;
                color: #ffffff;
                /* align-items: center; */
                cursor: pointer;
                padding: 10px;
            }
            .topIcon {                
                position: relative;
                right: 250px;
                top: 50px;
                /* height: 2500px; */
                display: flex;
                justify-content: flex-end;
                align-items: center;
                gap: 20px;
            }
            .icon-text {
                display: flex;
                flex-direction: column; /* 수직 정렬 */
                align-items: center; /* 수평 중앙 정렬 */
                color: white;
                position: relative;
            }
            #btnfont{
                display: flex;
                position: relative;
                top: -15px;
            }


            /* 상단 검색창 */
            .search-container {
                position: relative;
                display: inline-block;
                left: 1393px;
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
            #company {
                height: 400px; /* 회사 정보 영역의 높이 설정 */
            }
            #noticeClient { 
                color: white; 
                width: 580px; /* 고정 너비 */ 
                margin-left: 250px; 
            } 
            .notice_wrap dt, .notice_wrap dd { 
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
            .client_list dt, .client_list dd { 
                display: inline-block; 
            } 
            .sect-ad {
                width: 1000px; /* 고정 너비 */ 
            } 
            /* 회사정보(주소) */
            .company_info { 
                width: 1000px; /* 고정 너비 */ 
                display: block;
                margin-left: 200px; 
                display: inline-block; 
            }  
            .company_info _wrap { 
                width: 1000px; 
                color: white; 
                display: inline-block; 
            } 
            .company_info address { 
                display: inline-block; 
                width: 1000px; /* 고정 너비 */ 
            } 
            .company_info_list dt, .company_info_list dd { 
                display: inline-block; 
                margin-right: 10px; 
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
            .company_info_wrap { /* 주소 */
               display: flex; 
               align-items: center; 
               margin-left: 450px; 
            } 
           
            .company_info address, .company_info_list, .company_info p { /* 주소간격 */
               margin: 0; 
               padding: 1; 
            } 
            .company_info_list { 
               display: inline; 
               align-items: right; 
            } 
            .company_info_list dt  { 
               display: inline; 
               margin-right: 1px; 
            } 
            .company_info_list dd { 
               display: inline; 
               margin-right: 1px; 
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
                    <h4 id="btnfont" class="logout">로그아웃</h4>
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
        <div id="noticeClient" style="color: white;">
            <div id="notice_wrap" class="notice_wrap">
            <dl>
                <dt><strong>공지사항</strong></dt>
                <dd>
                    <a href="/support/news/detail-view.aspx?idx=8062" class="btn">[행사/이벤트][DGV] '24년 12월 문화 주간 관련 안내...</a>
                    <a href="http://www.cgv.co.kr/support/news/default.aspx" id="notice_more" class="btn">더보기</a>
                </dd>
                </dl>
            </div>

            <div class="client_wrap">
                <dl class="client_list">
                    <dt><strong>고객센터</strong></dt>
                    <dd>
                        <strong>1234-1234</strong>
                        <p>
                            고객센터 운영시간 (평일 09:00~18:00) <br>
                            업무시간 외 자동응답 안내 불가능합니다.
                        </p>
                    </dd>
                </dl>
                <div class="client_btn_wrap" id="client_btn_wrap">
                    <a href="http://www.cgv.co.kr/support/faq/default.aspx" class="btn">FAQ</a> <!-- 여기에 우리 링크 박아야함 -->
                    <a href="http://www.cgv.co.kr/support/qna/default.aspx">1:1 문의</a>  <!-- 여기에 우리 링크 박아야함 -->
                    <a href="http://www.cgv.co.kr/support/lease/default.aspx">대관/단체 문의</a>  <!-- 여기에 우리 링크 박아야함 -->
                </div>
            </div>
        </div>   
        <!-- 회사 정보 영역 -->
        <div id="company" class="sect-ad">
            <iframe src="" width="100%" height="10" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Bottom" id="Bottom"></iframe>
        </div>
        <br><br><hr><br>
        <div class="company_info_wrap" style="color: white;">
            <div class="company_info">
                <address>(34908)대전광역시 중구 계룡로 846, 3-4층</address> 
                <dl class="company_info_list">
                    <dt>이사장 :</dt>
                    <dt>김형응</dt>
                    <dd>사업자등록번호 :</dd>
                    <dt>306-82-05291</dt>
                    <dd>대표전화 :</dd>
                    <dt>042-222-8202</dt>
                </dl>
                <p>&copy; DGV. All Rights Reserved</p>
            </div>
        </div>
</body>
</html>