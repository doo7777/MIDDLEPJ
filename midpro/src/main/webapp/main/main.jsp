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
            height: 140px; /* 상단 영역의 높이 설정 */
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
            width: 400px;
            height: 100%;
            background: #ffffff !important;;
            position: fixed;
            top: 0;
            right: -400px;
            z-index:1;
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
            display: flex;
            justify-content: center;
            gap: 20px;
            width: 100%;
            max-width: 1500px;
            margin: 0 auto;
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
        <div id="noticeClient" style="color: white;">
                <div id="notice_wrap" class="notice_wrap">
                    <dt><strong>공지사항</strong></dt>
                    <dd>
                        <a href="/support/news/detail-view.aspx?idx=8062" class="btn">[행사/이벤트][DGV] '24년 12월 문화 주간 관련 안내</a>
                        <a href="http://www.cgv.co.kr/support/news/default.aspx" id="notice_more" class="btn">더보기</a>
                    </dd>
                </div>

                <div class="client_wrap">
                    <dl class="client_list">
                        <dt><strong>고객센터</strong></dt>
                        <dd>
                            <strong>1234-1234</strong>
                            <span>고객센터 운영시간 (평일 09:00~18:00)
                                <p>업무시간 외 자동응답 안내 가능합니다.</p>
                            </span>
                        </dd>
                    </dl>
                    <div class="client_btn_wrap" id="client_btn_wrap">
                        <a href="http://www.cgv.co.kr/support/faq/default.aspx" class="btn">FAQ</a>
                        <a href="http://www.cgv.co.kr/support/qna/default.aspx">1:1 문의</a>
                        <a href="http://www.cgv.co.kr/support/lease/default.aspx">대관/단체 문의</a>
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
</script>
</html>
