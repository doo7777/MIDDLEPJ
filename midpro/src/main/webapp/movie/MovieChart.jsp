<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Document</title>
    <style>
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

        /* 우측 상단 메뉴 아이콘 */
        .fa-headset, .fa-regular, .fa-lock {
            font-size: 24px;
            color: #ffffff;
            cursor: pointer;
            padding: 10px;
        }
        .topIcon {                
            position: relative;
            right: 250px;
            top: 50px;
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
        
        #movie_list {
            display: flex;
            flex-wrap: wrap; /* 공간이 부족하면 다음 줄로 이동 */
            gap: 40px;
            justify-content: center;
            padding: 20px;
            max-width: 1000px;
            margin: auto;
            box-sizing: border-box;
        }

        .movieItem {
            display: flex;
            flex-direction: column; /* 포스터와 영화 정보를 세로로 배치 */
            align-items: center; /* 중앙 정렬 */
            width: 200px; /* 각 포스터 및 버튼의 영역 */
            position: relative; /* 제목과 개봉일을 상대적으로 배치할 수 있게 */
        }

        .moviePoster {
            width: 100%; /* 포스터가 200px 너비를 채우도록 */
            height: 300px; /* 고정된 높이로 포스터 크기 설정 */
            object-fit: cover; /* 포스터 이미지를 박스 크기에 맞춰 자르기 */
            border-radius: 10px; /* 포스터에 둥근 모서리 적용 */
        }

        .movieListBox {
            width: 100%; /* 포스터를 꽉 채우도록 */
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* 마우스 이벤트 애니메이션 */
        }

        .movieInfoBox {
            display: flex;
            flex-direction: column;
            align-items: center; /* 중앙 정렬 */
            text-align: center;
            gap: 2px;
            padding: 10px;
        }

        .movieTitle {
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 5px; /*타이틀이랑 영화정보 사이 간격*/
        }


        .releaseDate, .movieRating {
            font-size: 14px;
            color: #ffffff;
            margin: 5px 0;
        }

        .reserveButton {
            background-color: rgb(239, 132, 0);
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .reserveButton:hover {
            font-weight: bold;
        }

        /* 포스터에 마우스를 올렸을 때 확대 효과 */
        .moviePoster:hover {
            transform: scale(1.05); /* 확대 효과 */
            
        }

        #movie_chart{
            height: 400px;
        }
        #bottom{
            height: 250px;
        }
        #company{
            height: 400px;
        }
    </style>
</head>
<body>
    <div id="main"> <!-- 메인 컨테이너 -->
        <div id="top"> <!-- 상단 영역 -->
            <img src="./image/logo.png" alt="로고" class="logo">
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

        <div id="movie_list"><!-- 영화 목록 영역 -->
 
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
    
    // 사이드바 열기닫기
    function moveSidebar(){
        sidebar.classList.toggle('open');
    }
    
    //로그인버튼누르면 사이드 바 뜸
    login.addEventListener('click', function() { 
        // if(sidebar.style.right === '0px') {
        //     sidebar.style.right = '-300px'; //닫기
        // } else {
        //     sidebar.style.right = '0px'; //열기
        // }
        sidebarContent.innerHTML = ` 
                        <br><br><h3>아이디와 비밀번호를 입력하세요.</h3>  
                        <form action="/login" method="POST">
                        <label for="username">아이디:</label>
                        <input type="text" id="username" name="username" placeholder="아이디를 입력하세요" required><br>
                            
                        <label for="password">비밀번호:</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required><br><br>
                            
                        <button type="submit" class="loginBtn">로그인</button>
        
                        <h6>아직 회원이 아니세요?</h6>
                        <button type="button" class="signupBtn">회원가입^__^</button>
        
                        <h6><a href=#>비밀번호를 잊어버렸다면?</a></h6>
                        </form>  `;
        moveSidebar();                
    });
    
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
        sidebarContent.innerHTML = `<h3>마이페이지 내용 뭐 넣지?</h3>`
        moveSidebar(); 
    });
    
    menu.addEventListener('click', function(){
        moveSidebar();
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
    });


    	const movies = [
    { title: "소방관", image: "../main/sorce/img/영화포스터/영화1.jpg", releaseDate: "2024.12.04", rating: "94%" },
    { title: "대가족", image: "../main/sorce/img/영화포스터/영화2.jpg", releaseDate: "2024.12.11", rating: "96%" },
    { title: "하얼빈", image: "../main/sorce/img/영화포스터/영화3.jpg", releaseDate: "2024.12.24", rating: "99%" },
    { title: "모아나2", image: "../main/sorce/img/영화포스터/영화4.jpg", releaseDate: "2024.11.27", rating: "92%" },
    { title: "위키드", image: "../main/sorce/img/영화포스터/영화5.jpg", releaseDate: "2024.11.20", rating: "94%" },
    { title: "더 크로우", image: "../main/sorce/img/영화포스터/영화6.jpg", releaseDate: "2024.12.11", rating: "69%" },
    { title: "크리스마스에 기적을 만날 확률", image: "../main/sorce/img/영화포스터/영화7.jpg", releaseDate: "2024.12.11", rating: "90%" },
    { title: "이처럼 사소한 것들", image: "../main/sorce/img/영화포스터/영화8.jpg", releaseDate: "2024.12.11", rating: "95%" },
    { title: "아키라", image: "../main/sorce/img/영화포스터/영화9.jpg", releaseDate: "2024.12.11", rating: "91%" },
    { title: "짱구", image: "../main/sorce/img/영화포스터/영화10.jpg", releaseDate: "2024.12.18", rating: "99%" },
    { title: "퍼스트레이디", image: "../main/sorce/img/영화포스터/영화11.jpg", releaseDate: "2024.12.12", rating: "88%" },
    { title: "서브스턴스", image: "../main/sorce/img/영화포스터/영화12.jpg", releaseDate: "2024.12.11", rating: "92%" },
    { title: "1승", image: "../main/sorce/img/영화포스터/영화13.jpg", releaseDate: "2024.12.04", rating: "93%" },
    { title: "듄2", image: "../main/sorce/img/영화포스터/영화14.jpg", releaseDate: "2024.12.04", rating: "93%" },
    { title: "여름날의 레몬그라스", image: "../main/sorce/img/영화포스터/영화15.jpg", releaseDate: "2024.11.27", rating: "83%" },
    { title: "청설", image: "../main/sorce/img/영화포스터/영화16.jpg", releaseDate: "2024.11.06", rating: "96%" }
    ];

    const movieList = document.querySelector("#movie_list");

    // forEach를 통해 movies 배열에 있는 변수 하나씩 꺼내감
    movies.forEach(movie => {
        const movieItem = document.createElement("div");
        movieItem.classList.add('movieItem');

        // 포스터를 감싸는 movieListBox
        const movieListBox = document.createElement("div");
        movieListBox.className = "movieListBox";

        // 포스터
        const poster = document.createElement("img");
        poster.src = movie.image;
        poster.alt = `${movie.title} 포스터`;
        poster.className = "moviePoster";

        movieListBox.appendChild(poster);

        // 영화 정보 박스
        const movieInfoBox = document.createElement("div");
        movieInfoBox.className = "movieInfoBox";

        // 타이틀
        const title = document.createElement("h3");
        title.className = "movieTitle";
        title.innerText = movie.title;

        movieInfoBox.appendChild(title);

        // 개봉일
        const releaseDate = document.createElement("p");
        releaseDate.className = "releaseDate";
        releaseDate.innerText = `개봉일: \${movie.releaseDate}`;

        movieInfoBox.appendChild(releaseDate);

        // 평점
        const rating = document.createElement("p");
        rating.className = "movieRating";
        rating.innerText = `평점: \${movie.rating}`;
        movieInfoBox.appendChild(rating);

        // 예매하기 버튼
        const button = document.createElement("button");
        button.className = "reserveButton";
        button.innerText = "예매하기";

        movieInfoBox.appendChild(button);

        // movieItem에 포스터와 영화 정보 추가
        movieItem.appendChild(poster);
        movieItem.appendChild(movieInfoBox);

        // movieList에 movieItem 추가
        movieList.appendChild(movieItem);

         

        // 마우스 올렸을 때 이벤트
        movieListBox.addEventListener("mouseenter", () => {
            movieListBox.style.transform = "scale(1.1)"; // 확대
            movieListBox.style.zIndex = "2"; // 다른 요소 위로 올리기
        });

        // 마우스 뗐을 때 이벤트
        movieListBox.addEventListener("mouseleave", () => {
            movieListBox.style.transform = "scale(1)"; // 원래 크기로 복원
            movieListBox.style.zIndex = "1"; // z-index 원복
        });

		console.log(movie.releaseDate);
		console.log(movie.rating);
});
 

</script>
</html>