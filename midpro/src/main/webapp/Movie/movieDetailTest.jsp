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
	        
	       
			#movie-detail {
			position: relative;
			padding: 10px 0px;
		    max-width: 1200px;
		    margin: auto;
		    margin-bottom: 40px;
			}
			
			.movieDetailBox {
		    display: flex;               /* 부모 요소에 flexbox를 적용 */
		    gap: 10px; /* 간격 추가 */
    		padding: 10px;
    		/*background-color: white;*/
    		border-radius: 10px;
    		width: 100%; /* 너비를 부모의 100%로 설정 */
    		max-width: 900px; /* 영화 정보 박스 최대 너비 제한 */
			}
			
			/* 포스터 박스 */
			.posterBox {
			    flex: 1; /* 가변 크기 */
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    border-style: none;
			}
			
			.moviePoster {
		    max-width: 200px;
		    height: auto;
		    margin-right: 5px;          /* 포스터와 영화 정보 사이의 간격 */
			}			
			
			/* 정보 박스 */
			.infoBox {
			    flex: 2; /* 포스터보다 더 큰 영역 */
			    display: flex;
			    flex-direction: column;
			    justify-content: flex-start;
			    gap: 0; /* 추가 간격 제거 */
    			margin: 5px;
    			border-style: none;
			}
			
			
			.infoBox h1 {
		    font-size: 24px;
		    margin-bottom: 15px;
		    color: rgb(239, 132, 0);
			}
		
			.infoBox p {
			    font-size: 14px;
			    color: white;
			    margin: 10px; /* 각 항목 간 간격을 없앰 */
    			padding: 0; /* 추가적인 여백을 제거 */
    			line-height: 1.2; /* 줄 간격 조정 */
			}
			
			.reservationButton {
		    background-color: rgb(239, 132, 0);
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100px;
			}
			
			.reservationButton:hover {
            font-weight: bold;
        	}
			
			
			
            nav {
                display: flex;
                justify-content: space-around;
                background-color: rgb(239, 132, 0);
                color: #fff;
                padding: 10px 0;
                max-width: 50%; /* 화면의 반만 차지 */
                margin: 0 auto; /* 중앙 정렬 */
                margin-bottom: 5px;  /* 버튼과 탭 내용 간의 간격 */
            }
            nav button {
                background: none;
                border: none;
                color: white;
                font-weight: bold;
                padding: 10px 20px;
                cursor: pointer;
            }
            nav button:hover {
                background-color: orange;
            }
            .tab-content {
                display: none;
                margin-top: 20px;  /* 탭 내용과 버튼 간의 간격 */
                color: white;
                text-align: center;
                
            }
            .tab-content.active {
                display: block;
            }

        </style>
        
    </head>
    
   <%CustomerVO result = (CustomerVO)session.getAttribute("ok"); %> 
    
    <body>
       
        <div id="main"> <!-- 메인 컨테이너 -->
            <div id="top"> <!-- 상단 영역 -->
            
                <img src="../main/sorce/img/DGV-로고.png" alt="로고" class="logo">
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

            <!-- 영화 메인 영역 -->
             <div id="movie-detail">

        	</div>
            
            <main>
            	<nav>
                <button data-tab ="summary">줄거리</button>
                <button data-tab ="trailer">트레일러</button>
                <button data-tab ="poster">스틸</button>
                <button data-tab ="rating">리뷰</button>
                <button data-tab ="schedule">상영시간표</button>
            	</nav>
            	<!-- 탭 내용들 -->
                <div id="summary" class="tab-content">
                    <h1>줄거리</h1>
                    <p id="movie-summary"></p>
                </div>
                <div id="trailer" class="tab-content">
                    <h1>트레일러</h1>
                </div>
                <div id="poster" class="tab-content">
                    <h1>스틸 이미지</h1>
                    <div class="image-gallery">
			        <button class="arrow left-arrow">&#8592;</button>
			        <img id="poster-image" src="" alt="스틸 이미지" />
			        <button class="arrow right-arrow">&#8594;</button>
			    </div>
                </div>
                <div id="review" class="tab-content">
                    <h1>리뷰</h1>
                    <p>리뷰 내용</p>
                </div>
                <div id="schedule" class="tab-content">
                    <h1>상영시간표</h1>
                    <p>상영 시간표 정보</p>
                </div>
                
             </main>
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
            <form action="<%=request.getContextPath()%>/cusLogin.do" method="POST" id="loginform">
            <%if(result==null){%>
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

        // 영화 js
        const tabs = document.querySelectorAll("nav button");
        const contents = document.querySelectorAll(".tab-content");

        tabs.forEach(tab => {
            tab.addEventListener("click", () => {
                // 모든 탭 내용 숨기기
                contents.forEach(content => content.classList.remove("active"));
                // 클릭한 탭 내용 표시
                document.getElementById(tab.dataset.tab).classList.add("active");
            });
        });

        const movies = [
        { title: "소방관", image: "../main/sorce/img/영화포스터/영화1.jpg", releaseDate: "2024.12.04", rating: "94%", director: "곽경택", cast: ["주원", "곽도원", "유재명", "이유영"], },
        { title: "대가족", image: "../main/sorce/img/영화포스터/영화2.jpg", releaseDate: "2024.12.11", rating: "96%", director: "양우석", cast: ["김윤석", "이승기", "김성령", "이순재"] },
        { title: "하얼빈", image: "../main/sorce/img/영화포스터/영화3.jpg", releaseDate: "2024.12.24", rating: "99%", director: "우민호", cast: ["현빈", "박정민", "조우진", "전여빈"] },
        { title: "모아나2", image: "../main/sorce/img/영화포스터/영화4.jpg", releaseDate: "2024.11.27", rating: "92%", director: "데이비드 데릭 주니어", cast: ["아우이 크라발호" , "드웨인 존슨"] },
        { title: "위키드", image: "../main/sorce/img/영화포스터/영화5.jpg", releaseDate: "2024.11.20", rating: "94%", director: "존 추", cast: ["아리아나 그란데", "신시아 에리보", "조나단 베일리"] },
        { title: "더 크로우", image: "../main/sorce/img/영화포스터/영화6.jpg", releaseDate: "2024.12.11", rating: "69%", director: "루퍼트 샌더스", cast: ["빌 스카스가드", "FKA 트위그스"] },
        { title: "크리스마스에 기적을 만날 확률", image: "../main/sorce/img/영화포스터/영화7.jpg", releaseDate: "2024.12.11", director: "곤 사토시", rating: "90%", cast: ["에모리 토오루", "오카모토 마야"] },
        { title: "이처럼 사소한 것들", image: "../main/sorce/img/영화포스터/영화8.jpg", releaseDate: "2024.12.11", rating: "95%", director: "팀 밀란츠", cast: ["킬리언 머피", "에밀리 왓슨"] },
        { title: "아키라", image: "../main/sorce/img/영화포스터/영화9.jpg", releaseDate: "2024.12.11", rating: "91%", director: "오토모 가츠히로", cast: ["이와타 미츠오", "사사키 노조무"] },
        { title: "극장판 짱구는 못말려", image: "../main/sorce/img/영화포스터/영화10.jpg", releaseDate: "2024.12.18", rating: "99%", director: "사사키 시노부", cast: ["박영남", "강희선", "김환진"] },
        { title: "퍼스트레이디", image: "../main/sorce/img/영화포스터/영화11.jpg", releaseDate: "2024.12.12", rating: "88%", director: "애몽", cast:["다큐멘터리"] },
        { title: "서브스턴스", image: "../main/sorce/img/영화포스터/영화12.jpg", releaseDate: "2024.12.11", rating: "92%", director: "코랄리 파르자", cast:["데미 무어", "마가렛 퀄리", "데니스 퀘이드"] },
        { title: "1승", image: "../main/sorce/img/영화포스터/영화13.jpg", releaseDate: "2024.12.04", rating: "93%", director: "신연식", cast: ["송강호", "박정민", "장윤주"] },
        { title: "듄2", image: "../main/sorce/img/영화포스터/영화14.jpg", releaseDate: "2024.12.04", rating: "93%", director: "드니 빌뇌브", cast: ["티모시 샬라메", "젠데이아 콜먼", "레베카 퍼거슨", "오스카 아이삭"] },
        { title: "여름날의 레몬그라스", image: "../main/sorce/img/영화포스터/영화15.jpg", releaseDate: "2024.11.27", rating: "83%", director: "맹걸 라이", cast: ["이목", "조우녕"] },
        { title: "청설", image: "../main/sorce/img/영화포스터/영화16.jpg", releaseDate: "2024.11.06", rating: "96%", director: "조선호", cast: ["홍경", "노윤서", "김민주", "정용주"] }
        ];

     	// URL에서 영화 인덱스 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const movieIndex = parseInt(urlParams.get('index'));

        // 유효한 index 값 확인
        if (isNaN(movieIndex) || movieIndex < 0 || movieIndex >= movies.length) {
            console.error("유효하지 않은 영화 인덱스입니다.");
            return; // 인덱스가 유효하지 않으면 종료
        }
        
        // 해당 영화 데이터 가져옴
        const movie = movies[movieIndex];
        
        
        const movieDetail = document.querySelector("#movie-detail");

        // 영화 상세 정보를 표시할 HTML
        const movieDetailBox = document.createElement("div");
        movieDetailBox.className = "movieDetailBox";

        
     	// 포스터 영역
        const posterBox = document.createElement("div");
        posterBox.className = "posterBox";

        // 포스터
        const poster = document.createElement("img");
        poster.src = movie.image;
        poster.alt = `\${movie.title} 포스터`;
        poster.className = "moviePoster";
        posterBox.appendChild(poster);
        
     	// 정보 영역
        const infoBox = document.createElement("div");
        infoBox.className = "infoBox";

        // 영화 제목
        const title = document.createElement("h1");
        title.innerText = movie.title;

        // 개봉일
        const releaseDate = document.createElement("p");
        releaseDate.innerText = `개봉일: \${movie.releaseDate}`;

        // 평점
        const rating = document.createElement("p");
        rating.innerText = `평점: \${movie.rating}`;
        
        // 감독
        const director = document.createElement("p");
        director.innerText = `감독: \${movie.director}`;
        
        // 출연진
        const cast = document.createElement("p");
        cast.innerText = `출연진: \${movie.cast ? movie.cast.join(", ") : "정보 없음"}`; // 배열을 join으로 처리
        
     	// 영화 정보 영역에 예매 버튼 추가
        const reservationButton = document.createElement("button");
        reservationButton.innerText = "예매하기";
        reservationButton.className = "reservationButton";

        // 예매 버튼 클릭 이벤트
        reservationButton.addEventListener("click", () => {
            alert(`\${movie.title}의 예매 페이지로 이동합니다.`);
            // 예매 페이지로 이동하고 싶다면 아래와 같이 URL을 추가할 수 있습니다.
            // window.location.href = "예매페이지 URL";
        });


     	// 정보 영역에 추가
        infoBox.appendChild(title);
        infoBox.appendChild(releaseDate);
        infoBox.appendChild(rating);
        infoBox.appendChild(director);
        infoBox.appendChild(cast);
        infoBox.appendChild(reservationButton);

        // movieDetailBox에 포스터와 정보를 추가
        movieDetailBox.appendChild(posterBox);
        movieDetailBox.appendChild(infoBox);
        movieDetail.appendChild(movieDetailBox);

     	// 영화 정보 영역은 항상 보이도록 하되, 탭 전환만 적용
        const tabButtons = document.querySelectorAll("nav button");
        const tabContents = document.querySelectorAll(".tab-content");

        // 기본적으로 첫 번째 탭을 활성화
        tabContents.forEach(content => content.classList.remove("active"));
        tabContents[0].classList.add("active"); // 첫 번째 탭 내용 표시

        // 탭 클릭 시 해당 콘텐츠 표시
        tabButtons.forEach(tab => {
            tab.addEventListener("click", () => {
                // 모든 탭 내용 숨기기
                tabContents.forEach(content => content.classList.remove("active"));
                // 클릭한 탭의 내용 표시
                const targetContent = document.getElementById(tab.dataset.tab);
                targetContent.classList.add("active");
            });
        });
        
     	// 스틸 이미지 배열 (이미지 URL을 넣으세요)
        const stills = [
            '영화1', '영화2', '영화3', '영화4', '영화5',
            '영화6', '영화7', '영화8', '영화9', '영화10'
        ];
     	
     	// 각 영화 폴더에서 4개의 이미지를 가져오는 경로 생성
        const stillImages = stills.flatMap(movie =>
            Array.from({ length: 4 }, (_, index) =>
                `sorce/img/영화스틸컷/${movie}/\${index + 1}.jpg`
            )
        );

        // 현재 보여지는 이미지의 인덱스
        let currentIndex = 0;

        // 이미지 요소와 버튼 요소 가져오기
        const posterImage = document.getElementById('poster-image');
        const leftArrow = document.querySelector('.left-arrow');
        const rightArrow = document.querySelector('.right-arrow');

        // 초기 이미지 설정
        posterImage.src = stillImages[currentIndex];

        // 왼쪽 화살표 클릭 이벤트
        leftArrow.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + stillImages.length) % stillImages.length; // 이전 이미지로 이동
            posterImage.src = stillImages[currentIndex];
        });

        // 오른쪽 화살표 클릭 이벤트
        rightArrow.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % stillImages.length; // 다음 이미지로 이동
            posterImage.src = stillImages[currentIndex];
        });
        
    });
	
    
</script>
</html>
    
 
