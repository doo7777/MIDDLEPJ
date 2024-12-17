<%@page import="Vo.TheaterVO"%>
<%@page import="Vo.CustomerVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
<style>
            
            /* 전체 화면 사이즈 */
            #main{
                position: relative;
                left: 2px;
            }
            
            body {
                margin: 0;
                width: 100%;
                overflow-x: hidden;
                /* overflow-y: auto; */ 
                background: blue;
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
                position: relative;
                left: -2px;
            }
            #movie_play {
                height: 550px;
                display: flex;
                justify-content: center;
                align-items: center;
                /* overflow: hidden; */
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
            .menu-button h2, .header h2{
                color: gray;
                margin: 0 10px;
            }
            .header h4{
                color: white;
            }
            .menu-button { 
                background: none; /* 버튼 디자인 제거 */
                border: none; /* 버튼 디자인 제거 */
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
                /* display: flex;  */
                /* justify-content: center;  */
                /* padding: 0;  */
                /* position: relative; */
                height: 450px; 
                /* width: 100%; */
                /* overflow: hidden; */
            }
            .chart {
                width: 200px;
                height: 300px;
                margin: 0 10px;
                /* display: inline-block; */
                background-color: white;
                border-radius: 25px;
                transform: translateY(20px);
                transition: opacity 0.5s ease, transform 0.5s ease;
                text-align: center;
                /* flex-shrink: 0; */
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
                /* justify-content: center; */
                gap: 20px;
                /* overflow: hidden; */
                /* width: 100%; */
                /* max-width: 1500px; */
                /* margin: 0 auto; */
                /* position: relative; */ /* 또는 absolute */
                /* margin-left: -240px; */ /* 원하는 위치로 조정 */
                /* width: 100%; */
            }
            .package, .ticket, .giftcard {
                background: white;
                border-radius: 10px;
                text-align: center;
                position: relative; /*아래 storeButton을 절대위치로 설정하기위해*/
                width: 430px;
                flex: 0 0 auto;
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
            .bottom_line{
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
            #company {
                height: 400px; /* 회사 정보 영역의 높이 설정 */
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
	        
	        
	        
	        
	        
	        
	        
	        .name{
	       margin-left: 260px;
	       color: white;
	        	
	        }
	        #detail{
                color: white;
                margin-left: 260px;
                width: 1360px;
                height: 600px;
                background-color: rgb(52, 52, 52);
                display: flex; /* Flexbox 사용 */
                justify-content: center; /* 가로 방향 가운데 정렬 */
                align-items: center; /* 세로 방향 가운데 정렬 */
                position: relative;
	        }
	        .information{
	        	width: 1360px;
	        	height: 180px;
	        	background-color: black;
	        	position: absolute;
	        	bottom: 0;
	        	opacity: 70%;
	        	font-weight: bold;
	        }
			.vertical-line {
			    width: 2px; /* 세로줄의 두께 */
			    height: 70%; /* 세로줄의 높이를 70%로 변경 */
			    background-color: white; /* 세로줄의 색상 */
			    position: absolute;
			    left: 50%; /* 가운데 정렬 */
			    top: 50%; /* 세로 방향 가운데 정렬 */
			    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
			    opacity: 80%
			}
			#transportation {
			    margin-left: 260px;
			    width: 1360px;
			    height: 250px;
			    background-color: transparent; /* 'non'은 유효한 색상이 아닙니다. 'transparent'로 수정 */
			    display: flex; /* Flexbox 사용 */
			    justify-content: center; /* 세로 방향 가운데 정렬 */
			    align-items: flex-start; /* 가로 방향 왼쪽 정렬 */
			    position: relative;
			    border-radius: 20px;
			    border: 2px solid gray;
			    flex-direction: column; /* 세로 방향으로 정렬 */
			}
			
			.subway, .bus {
			    width: 80px;
			    height: 80px;
			    margin-top: 20px;
			    margin-bottom: 20px;
			    margin-left: 50px;
			}
			.bus {
			    width: 80px; /* 너비 설정 */
			    height: 80px; /* 높이 설정 */
			    background-size: cover; /* 배경 이미지 크기 조정 */
			    background-position: center; /* 배경 이미지 중앙 정렬 */
			    margin-top: 20px; /* 위쪽 여백 */
			    margin-bottom: 20px; /* 아래쪽 여백 */
			    margin-left: 50px; /* 왼쪽 여백 */
			}





</style>
</head>
   <%CustomerVO result = (CustomerVO)session.getAttribute("ok"); %> 

<body>
       
        <div id="main"> <!-- 메인 컨테이너 -->
            <div id="top"> <!-- 상단 영역 -->
            
                <img src="main/sorce/img/DGV-로고.png" alt="로고" class="logo">
                <span class="DGV">D a e d u c k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G r a n d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V i s i o n</span>
                <div class="topIcon">
                
                
                
                    <div class="icon-text">
                        <i class="fa-solid fa-lock" id="loginbutton"></i>

                        <%if(result==null){ %>
                        <h4 id="btnfont" class="login">로그인</h4>
                        <%}else{ %>
                        <h4 id="btnfont" class="logout">로그아웃</h4>
                        <%} %>
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
            
            
            
            
            
            
            
            
    <%
      TheaterVO vo = (TheaterVO)request.getAttribute("theaterVo");  
      String tnm = vo.getTheater_name();
      String timg = vo.getTheater_img();
      String tadd = vo.getTheater_address();
      String ttel = vo.getTheater_tel();
      String tno = vo.getTheater_notice();
      String tsc = vo.getTheater_screen();
      String tbus = vo.getTheater_bus();
      String tsub = vo.getTheater_sub();
      String tspot1 = vo.getTheater_spot1();
      String tspot2 = vo.getTheater_spot2();
   %>

<h3 class="name">DGV <%=tnm %></h3>
<div id="detail" style="background-image: url('<%=request.getContextPath() %>/theaterImage.do?theaterName=<%=vo.getTheater_name() %>'); background-size: cover; background-position: center;">
    <div class="information">
        <div class="left-content" style="position: absolute; left: 0; width: 50%; height: 100%; padding: 20px; box-sizing: border-box;">
            <!-- 왼쪽에 입력할 내용 -->
            <p>대전광역시 중구 계백로 1700 백화점세이<br>
            대전광역시 중구 문화동 1-16 세이백화점 신관</p>
            <p><%=ttel %><br>
            <%=tsc %></p>
        </div>
        <div class="vertical-line"></div> 
        <div class="right-content" style="position: absolute; right: 0; width: 50%; height: 100%; padding: 20px; box-sizing: border-box;">
            <!-- 오른쪽에 입력할 내용 -->
            <p>공지사항+</p>
            <p><%=tno %></p>
        </div>
    </div>
</div>
<br>
<br>

<h3 class="name">대중교통</h3>
<div id="transportation">
<div class="bus" style="background-image: url('${pageContext.request.contextPath}/theater/아이콘 이미지/bus.png');"></div>
<div class="subway"></div>
</div>
이미지 경로 테스트

<%--             <img src="${pageContext.request.contextPath}/theater/아이콘 이미지/bus.png" alt="Bus Icon"/> --%>

            
<!--    <h2>영화관 상세정보</h2> -->
<!--    <br><br> -->
   

<%--    <h3><%=tnm %></h3> --%>
<!--    *공지*<br> -->
<%--    <%=tno %><br><br> --%>
   
<!--    이미지 자리 : <br>    -->

<!--    <br><br> -->
   
   
<%--    주소 : <%=tadd %><br><br> --%>
<%--    전화번호 : <%=ttel %><br><br> --%>
<%--    상영관 : <%=tsc %><br><br> --%>
   교통 정보 <br>
    버스 : <%=tbus %><br>
    지하철 : <%=tsub %><br>   
   <br>
   
   
   
<!-- 지도 api 영역 -->
   <div id="map" style="width:500px;height:400px;"></div>
   <!-- 실제 지도를 그리는 Javascript API -->
   
   
   
   
   <br>
   <input type="button" id="timeBtn" value="상영시간표">
   <button onclick="openRateTable()">요금표 보기</button>
   <br>
   
   
   
   
    <!-- 회사 정보 영역 -->
            <hr class="bottom_line">

            <div id="company" class="sect-ad">
                <div class="company_text">
                    <address>(34908)대전광역시 중구 계룡로 846, 3-4층</address> 
                        <dt>이사장 : 김형응&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호 : 306-82-05291&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대표전화 : 042-222-8202</dt>
                    &copy; DGV. All Rights Reserved
                </div>
            </div>
        </div>
    </body>
    
       
   
   
   <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b988732ec0d52355546afa135081f218"></script>
   <script>
      var container = document.getElementById('map');            // 지도를 표시할 영역(div)
      var options = {                                    // 지도 생성할 때 필요한 기본 옵션
            
//          center: new kakao.maps.LatLng(36.321059, 127.408915),   // 지도의 중심좌표
         center: new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>),   // 지도의 중심좌표 
         
         level: 3                                    // 지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options);         // 지도 생성 및 객체 리턴
      
            
      
      // 마커 표시하기 --------------------------------------------------------------------------------------
      var markerPosition  = new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>); // 마커가 표시될 위치

      var marker = new kakao.maps.Marker({                  // 마커 생성
          position: markerPosition
      });

      
      marker.setMap(map);                               // 마커가 지도 위에 표시되도록 설정
      //marker.setMap(null);                              // 마커 제거 코드
      
      // 컨트롤 올리기 ---------------------------------------------------------------------------------------
      var mapTypeControl = new kakao.maps.MapTypeControl();       // 지도 타입 전환할 수 있는 컨트롤 생성
      
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도에 타입컨트롤 추가, 표시 위치 설정
      
      var zoomControl = new kakao.maps.ZoomControl();            // 확대축소 제어할 줌 컨트롤 생성
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);       // 지도에 줌컨트롤 추가, 표시 위치 설정
      
      
      
      
      function openRateTable() {
          // 새 창을 열고 요금표 HTML을 작성
          var newWindow = window.open("", "요금표", "width=400,height=300");
          newWindow.document.write(`
              <html>
              <head>
                  <title>요금표</title>
                  <style>
                      body { font-family: Arial, sans-serif; }
                      table { width: 100%; border-collapse: collapse; }
                      th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                      th { background-color: #f2f2f2; }
                  </style>
              </head>
              <body>
                  <h2>요금표</h2>
                  <table>
                      <tr>
                          <th>좌석</th>
                          <th>요금</th>
                      </tr>
                      <tr>
                          <td>일반석</td>
                          <td>16,000원</td>
                      </tr>
                      <tr>
                          <td>프리미엄</td>
                          <td>18,000원</td>
                      </tr>
                      <tr>
                          <td>조조 및 심야</td>
                          <td>14,000원</td>
                      </tr>
                  </table>
                  <br>
                  <button id="closeBtn" onclick="window.close()">닫기</button>
              </body>
              </html>
          `);
          newWindow.document.close(); // 문서 작성 완료
      }
      
      const login = document.querySelector('#loginbutton');
      const myPage = document.querySelector('.fa-user');
      // const menu = document.querySelector('.fa-bars');
      const sidebar = document.querySelector('.sidebar');
      const closeButton = document.querySelector('.fa-xmark');
      const sidebarContent = document.querySelector('.sidebar-content');
      
      
      function updateSidebarContent() {
          sidebarContent.innerHTML = ` 
              <img src="main/sorce/img/DGV-로고.png" alt="로고" id="DGV" width="100" height="100">
              <form action="<%=request.getContextPath()%>/cusLogin.do" method="POST" id="loginform">
              <%if(result==null){%>
              <div class="IDBtn"> 
              <img src="main/sorce/img/로그인/ID사진.png" alt="ID" id="DGV" width="30" height="30" class="ID_img"> 
              <input type="text" title="아이디" id="username" name="cust_id" data-title="아이디를 " data-message="입력하세요." required="required" class="IDBtn_box">
              <br><br> 
          </div> 
          <div class="PWBtn"> 
          <img src="main/sorce/img/로그인/PW사진.png" alt="PW" id="DGV" width="32" height="32" class="PW_img">
          <input type="password" title="패스워드" id="password" name="cust_pw" data-title="패스워드를 " data-message="입력하세요." required="required" class="PWBtn_box">
          <br><br> 
      </div>
                  <button type="submit" class="login" id="login">Login</button>
                  <h6>아직 회원이 아니세요?</h6>
                  <button type="button" id="join" class="signupBtn">회원가입</button>
                  <h6><a href="#">비밀번호를 잊어버렸다면?</a></h6>
                  <%}else{%>
                  <%=result.getCust_name()%>님 반갑습니다!!<br>
                  현재 DGV 등급 :<%=result.getCust_grade()%>등급
                  <button type="button" id="logout">로그아웃</button>
                  <%}%>
              </form>`;
      }; 
      

      function moveSidebar() {
          sidebar.classList.toggle('open');
          <%if(result==null){%>
          const signup = document.querySelector('#join');
          if (signup) {
              signup.addEventListener('click', function() {
                  window.location.href = '/midpro/customer/Signup.jsp';
              });
          }
          <%}else{%>
          const logout = document.querySelector("#logout");
          if(logout){
             logout.addEventListener('click',function(){
                window.location.href = "<%=request.getContextPath()%>/cusLogout.do";
             });
          }
          <%}%>
          
      }



      const barParam = '<%=request.getParameter("bar")%>';
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

   


   
   
</body>
</html>