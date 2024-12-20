<%@page import="Vo.ScreenVO"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="Dao.ScreenDaoImpl"%>
<%@page import="Dao.ScheduleDaoImpl"%>
<%@page import="Dao.TheaterDaoImpl"%>
<%@page import="Dao.MovieDaoImpl"%>
<%@page import="Vo.MovieVO"%>
<%@page import="java.util.List"%>
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
            cursor:pointer;
        }

        .DGV {
            color: rgb(216, 216, 216);
            position: absolute;
            left: 390px;
            top: 90px;
            font-weight: bold;
            overflow: hidden;
            white-space: nowrap;
        }

        /* 우측 상단 메뉴 아이콘 */
        .fa-headset,
        .fa-regular,
        .fa-lock {
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

        #btnfont {
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

        .dropmenu li a:hover,
        .dropmenu ul li:hover > a {
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
            border: 2px solid white; /* 테두리 색상 */
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

        /* 슬라이드바 */
        .sidebar {
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 (필요한 경우) */
            width: 300px;
            height: 100%;
            background: #ffffff;
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
        


    /* 아이디, 패스워드 입력 칸 */
    .input-container {
        position: relative; /* 아이콘과 세로줄을 절대 위치로 설정하기 위해 상대 위치로 설정 */
        margin-bottom: 8px; /* 입력 요소 간의 간격을 조정 */
    }
    .ID_img {
        position: absolute;
        left: 10px; /* 아이콘의 위치 조정 */
        top: 50%; /* 아이콘을 수직 중앙에 배치 */
        transform: translateY(-50%); /* 아이콘을 수직 중앙으로 조정 */
        pointer-events: none; /* 아이콘 클릭 방지 */
        font-size: 25px; /* 아이콘 크기 설정 */
        color: #3498db;
        margin: 0; /* 기본 여백 제거 */
    	padding: 0; /* 기본 패딩 제거 */
    }
	.PWBtn_box, .IDBtn_box {
	    padding: 10px; /* 입력 필드의 내부 여백 */
	    padding-left: 60px; /* 아이콘과의 간격 조정 (세로줄 공간 포함) */
	    width: 100%; /* 입력 필드의 너비를 100%로 설정 */
	    box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 계산 */
	}
    .input-container::after {
        content: ""; /* 가상 요소의 내용 설정 */
        position: absolute;
        left: 50px; /* 아이콘 오른쪽에 위치 */
        top: 10%; /* 세로줄의 상단 위치 조정 */
        height: 80%; /* 세로줄의 높이 설정 */
        width: 1px; /* 세로줄의 너비 설정 */
        background-color: #ccc; /* 세로줄의 색상 설정 */
    }
    
	/* 로그인, 회원가입 버튼 */
	.loginbtn, .signupBtn {
	    padding: 15px; /* 버튼의 내부 여백 조정 */
	    min-height: 5px;
        min-width: 250px;
	    font-size: 14px; /* 글자 크기 조정 */
	    height: 40px; /* 높이 설정 */
	    width: auto; /* 너비를 자동으로 설정 */
	    border-radius: 5px; /* 모서리 둥글게 설정 */
	    cursor: pointer; /* 마우스 커서 변경 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	    display: flex; /* 플렉스 박스 사용 */
	    align-items: center; /* 수직 가운데 정렬 */
	    justify-content: center; /* 수평 가운데 정렬 */
	    background-color: black;   
	    color: white;
	    margin-bottom: 5px;
	}
	#kakao{
	border:none;
	cursor:pointer;
	}
    </style>
    
</head>
<% CustomerVO result = (CustomerVO)session.getAttribute("ok"); 

MovieDaoImpl movieDao = MovieDaoImpl.getInstance(); //싱글톤 패턴사용
List<MovieVO> movieList = movieDao.getAllMovie(); // 영화 전체 목록조회

TheaterDaoImpl theaterDao = TheaterDaoImpl.getInstance();
List<TheaterVO> theaterList = theaterDao.getAllTheater(); // 영화관 전체 목록조회

ScheduleDaoImpl scheduleDao = ScheduleDaoImpl.getInstance();
List<ScheduleVO> schedulelList = scheduleDao.getAllSchedule(); //일정 전체 조회

ScreenDaoImpl screenDao = ScreenDaoImpl.getInstance();
List<ScreenVO> screenList = screenDao.getAllScreen(); //상영관 전체 조회

%>

<body>
    <div id="main"> <!-- 메인 컨테이너 -->
        <div id="top"> <!-- 상단 영역 -->
        	<img src="<%= request.getContextPath() %>/main/sorce/img/DGV-로고.png" alt="로고" id="moviec">
            <img src="<%= request.getContextPath() %>/main/sorce/img/DGV-로고(최종).png" alt="로고" class="logo">
            <span class="DGV">D a e d u c k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G r a n d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V i s i o n</span>

            <div class="topIcon">
                <div class="icon-text">
                    <i class="fa-solid fa-lock" id="loginbutton"></i>
                    <% if(result==null){ %>
                    <h4 id="btnfont1" class="login">로그인</h4>
                    <% } else { %>
                    <h4 id="btnfont2" class="logout">로그아웃</h4>
                    <% } %>
                    <script>
                    window.onload = function() {
                        // 로그인 상태 확인
                        const isLoggedIn = localStorage.getItem('isLoggedIn');
						console.log("isLoggedIn", isLoggedIn);
						
                        // result가 null이 아니면 로그인 상태
                        <% if(result != null) { %>
                            if (!isLoggedIn) {
                                alert("로그인 되었습니다.!!!!");
                                localStorage.setItem('isLoggedIn', 'true'); // 로그인 상태 저장
                            }
                        <% } else { %>
                            // 로그인하지 않은 상태일 때
                            if (isLoggedIn) {
                                alert("로그아웃 상태입니다.");
                                localStorage.removeItem('isLoggedIn'); // 로그아웃 상태로 변경
                            }
                        <% } %>
                    };
                    </script>

                </div>
                <div class="icon-text">
                    <i class="fa-regular fa-user"></i>
                    <h4 id="btnfont3" class="mypage" id="mypage">마이페이지</h4>
                </div>
                <div class="icon-text">
                    <i class="fas fa-headset" id="btn4"></i>
                    <h4 id="btnfont4" class="service center">고객센터</h4>
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
                <li><a href="#" class="highlight" id="movie2">영화</a> <!-- 기모찡 -->
                    <ul>
                        <li><a href="#" id="moviechart">무비차트</a></li> <!-- 하위 메뉴: 무비차트 -->
                        <li><a href="#" id="comingOut">상영예정작</a></li> <!-- 하위 메뉴: 상영예정작 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight" id="current">극장</a></li> <!-- 극장 메뉴 항목 -->
                <li><a href="#" class="highlight" id="reservation">예매</a> <!-- 예매 메뉴 항목 -->
                    <ul>
                        <li><a href="#">빠른예매</a></li> <!-- 하위 메뉴: 빠른예매 -->
                        <li><a href="#">상영스케줄</a></li> <!-- 하위 메뉴: 상영스케줄 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight" id="store">스토어</a> <!-- 스토어 메뉴 항목 -->
                    <ul>
                        <li><a href="#" id="package">패키지</a></li> <!-- 하위 메뉴: 패키지 -->
                        <li><a href="#" id="movieticket">영화관람권</a></li> <!-- 하위 메뉴: 영화관람권 -->
                        <li><a href="#" id="giftcard">기프트카드</a></li> <!-- 하위 메뉴: 기프트카드 -->
                        <li><a href="#" id="combo">콤보</a></li> <!-- 하위 메뉴: 콤보 -->
                        <li><a href="#" id="popcorn">팝콘</a></li> <!-- 하위 메뉴: 팝콘 -->
                        <li><a href="#" id="drink">음료</a></li> <!-- 하위 메뉴: 음료 -->
                        <li><a href="#" id="snack">스낵</a></li> <!-- 하위 메뉴: 스낵 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight" id="event">이벤트</a> <!-- 이벤트 메뉴 항목 -->
                    <ul>
                        <li><a href="#" id="special">스페셜</a></li> <!-- 하위 메뉴: 스페셜 -->
                        <li><a href="#" id="movres">영화/예매</a></li> <!-- 하위 메뉴: 영화/예매 -->
                    </ul>
                </li>
                <li><a href="#" class="highlight" id="discount">혜택</a> <!-- 혜택 메뉴 항목 -->
                    <ul>
                        <li><a href="#" id="discount1">DGV 할인정보</a></li> <!-- 하위 메뉴: DGV 할인정보 -->
                        <li><a href="#" id="vip">VIP 라운지</a></li> <!-- 하위 메뉴: VIP 라운지 -->
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
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
 	 integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
<script>
	Kakao.init('9b568627f6669732e63f4f5ea7d92e80'); //발급받은 키 중 javascript키를 사용
	console.log(Kakao.isInitialized()); // sdk초기화여부판단 = true

    const login = document.querySelector('#loginbutton');
    const myPage = document.querySelector('.fa-user');
    const sidebar = document.querySelector('.sidebar');
    const closeButton = document.querySelector('.fa-xmark');
    const sidebarContent = document.querySelector('.sidebar-content');

    $('#discount,#discount1').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Boon/DGVdiscount.jsp';
    });
    
    $('#vip').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Boon/VIP.jsp';
    });
	
    $('#comingOut').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Movie/comingOut.jsp';
    });
    
    $('#movres').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Event/MovRes.jsp';
    });
    
    $('#event,#special').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Event/Special.jsp';
    });
    
    
    $('#package,#store').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/package.jsp';
    });
    
    $('#movieticket').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/movieticket.jsp';
    });
    
    $('#giftcard').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/giftcard.jsp';
    });
    
    $('#combo').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/combo.jsp';
    });
    
    $('#popcorn').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/popcorn.jsp';
    });
    
    $('#drink').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/drink.jsp';
    });
    
    $('#snack').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/Store/snack.jsp';
    });
    
    $('.logo').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/main/main.jsp';
    });
    
    $('#moviec').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/RESERVATION/MovieC.jsp';
    });
    
    $('#reservation').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/scheduleList.do'; //서블릿으로 먼저 연동한뒤에 서블릿에서 jsp로 연결 해줘야함
    });
    
    $('#current').on('click',function(){
    	window.location.href = '<%=request.getContextPath()%>/theaterList.do';
    });
    
    $('#moviechart,#movie2').on('click',function(){
      window.location.href = '<%=request.getContextPath()%>/Movie/movieChart1.jsp'; 
    });
    
    $('#btn4').on('click', function() {
        window.location.href = '<%=request.getContextPath()%>/notice/customerservice.jsp';
    });
    
 // 사이드바 내용 업데이트
    function updateSidebarContent() {
        sidebarContent.innerHTML = `
            <img src="<%= request.getContextPath() %>/main/sorce/img/DGV-로고3.png" alt="로고" id="DGV" width="100" height="100">
            <form action="<%=request.getContextPath()%>/cusLogin.do" method="POST" id="loginform">
            <% if(result==null){ %>

            <div class="input-container">
            <i class="fas fa-user ID_img"></i>
            <input type="text" title="아이디" id="username" name="cust_id" required class="IDBtn_box">
        </div>
        
	        <div class="input-container">
	        <i class="fas fa-lock ID_img"></i>
	        <input type="password" title="패스워드" id="password" name="cust_pw" required class="PWBtn_box">
	    </div>

        </div>
        <button type="submit" class="loginbtn" id="login">Login</button>
        
     
        <!-- 카카오 로그인 버튼 -->

        <button type="button" id="kakao" onclick="location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=66af43424a17bc735630e486e280ccae&redirect_uri=http://localhost/midpro/kakaoLogin.do&prompt=login'">
        <img src="<%= request.getContextPath() %>/main/sorce/img/카카오.png" alt="카카오 로그인" style="width: 242px; height: 35px;">
        
  	  	</button>	


  

    	<button type="button" id="join" class="signupBtn">회원가입</button>        


            <% } else { %>
            <%=result.getCust_name()%>님 반갑습니다!!<br>
            현재 DGV 등급 :<%=result.getCust_grade()%>등급
            <button type="button" id="logout">로그아웃</button>
            <% } %>
            </form>`;
    };
    // 사이드바 토글 함수
    function moveSidebar() {
        sidebar.classList.toggle('open');
        <% if(result==null){ %>
        const signup = document.querySelector('#join');
        if (signup) {
            signup.addEventListener('click', function() {
                window.location.href = '/midpro/customer/Signup.jsp';
            });
        }
        <% } else { %>
        const logout = document.querySelector("#logout");
        if (logout) {
            logout.addEventListener('click', function() {
                window.location.href = "<%=request.getContextPath()%>/cusLogout.do";
            });
        }
        <% } %>
    }
    // 로그인 버튼 클릭 시 사이드바 업데이트
    login.addEventListener('click', function() {
        updateSidebarContent();
        moveSidebar();
    });

    // 사이드바 닫기 버튼 클릭 시 사이드바 닫기
    closeButton.addEventListener('click', function() {
        moveSidebar();
    });

    // ESC 눌러서 사이드 바 닫기
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            moveSidebar();
        }
    });

    // 마이페이지 클릭 시 메시지 표시
    myPage.addEventListener('click', function() {
    	 <% if(result==null){ %>
        sidebarContent.innerHTML = `<h3>로그인 후 이용해주세요</h3>`;
        moveSidebar();
        <% } else { %>
        	window.location.href = '<%=request.getContextPath()%>/Mypage/mypage.jsp';
        	 <% } %>
    });
    

  

</script>
</html>
