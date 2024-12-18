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
            #main{
                position: relative;
                left: 2px;
            }
            
            body {
                margin: 0;
                width: 100%;
                overflow-x: hidden;
                background: black;
            }
            div {
                border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
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
            
            /* 이미지 갤러리 컨테이너 */
			.image-gallery {
			    position: relative; /* 버튼의 위치 기준을 설정 */
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    max-width: 500px; /* 갤러리 너비 제한 */
			    margin: 20px auto; /* 가운데 정렬 */
			}
            
            /* 화살표 버튼 스타일 */
			.arrow {
			    background-color: transparent;
			    color: white;
			    font-size: 60px;
			    font-weight: bold;
			    cursor: pointer;
			    padding: 10px;
			    transition: transform 0.3s ease; /* 클릭 시 애니메이션 효과 */
			    border: none;
			    border-radius: 50%;
			    position: absolute;
			    top: 50%; /* 부모 요소의 정중앙으로 설정 */
			    transform: translateY(-50%); /* 수직 중앙 정렬 */
			    z-index: 10; /* 다른 요소 위에 표시되도록 */
			}
			
			/* 왼쪽 화살표 */
			.arrow.left-arrow {
			    position: absolute;
				top: 50%; /* 수직 중앙 */
    			left: -50px;
			    transform: translateY(-50%);
			}
			
			/* 오른쪽 화살표 */
			.arrow.right-arrow {
			    position: absolute;
				top: 50%; /* 수직 중앙 */
    			right: -50px;
			    transform: translateY(-50%);
			}

        </style>
        
    </head>
    
    <body>
        <%@ include file="/main/Top.jsp" %>
            
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
                    <div class="image-gallery">
			        <button class="arrow left-arrow"><</button>
			        <img id="poster-image" src="" alt="스틸 이미지" />
			        <button class="arrow right-arrow">></button>
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

            
        <%@ include file="/main/Bottom.jsp" %>
    </body>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        // 영화 js
        const tabs = document.querySelectorAll("nav button");
        const contents = document.querySelectorAll(".tab-content");

        tabs.forEach(tab => {
            tab.addEventListener("click", () => {
                alert("눌렀닝?")
                // 모든 탭 내용 숨기기
                contents.forEach(content => content.classList.remove("active"));
                // 클릭한 탭 내용 표시
                document.getElementById(tab.dataset.tab).classList.add("active");
                /*
                console.log("체킁:",stillImages["영화1"][0]);
                console.log("#"+tab.dataset.tab+"-image");
                console.log("체로롱",tab);
                */
                document.querySelector("#"+tab.dataset.tab+"-image").src = stillImages["영화1"][0]
            });
        });

        const movies = [
        {id:1, title: "소방관", image: "../main/sorce/img/영화포스터/영화1.jpg", releaseDate: "2024.12.04", rating: "94%", director: "곽경택", cast: ["주원", "곽도원", "유재명", "이유영"], },
        {id:2, title: "대가족", image: "../main/sorce/img/영화포스터/영화2.jpg", releaseDate: "2024.12.11", rating: "96%", director: "양우석", cast: ["김윤석", "이승기", "김성령", "이순재"] },
        {id:3, title: "하얼빈", image: "../main/sorce/img/영화포스터/영화3.jpg", releaseDate: "2024.12.24", rating: "99%", director: "우민호", cast: ["현빈", "박정민", "조우진", "전여빈"] },
        {id:4, title: "모아나2", image: "../main/sorce/img/영화포스터/영화4.jpg", releaseDate: "2024.11.27", rating: "92%", director: "데이비드 데릭 주니어", cast: ["아우이 크라발호" , "드웨인 존슨"] },
        {id:5, title: "위키드", image: "../main/sorce/img/영화포스터/영화5.jpg", releaseDate: "2024.11.20", rating: "94%", director: "존 추", cast: ["아리아나 그란데", "신시아 에리보", "조나단 베일리"] },
        {id:6, title: "더 크로우", image: "../main/sorce/img/영화포스터/영화6.jpg", releaseDate: "2024.12.11", rating: "69%", director: "루퍼트 샌더스", cast: ["빌 스카스가드", "FKA 트위그스"] },
        {id:7, title: "크리스마스에 기적을 만날 확률", image: "../main/sorce/img/영화포스터/영화7.jpg", releaseDate: "2024.12.11", director: "곤 사토시", rating: "90%", cast: ["에모리 토오루", "오카모토 마야"] },
        {id:8, title: "이처럼 사소한 것들", image: "../main/sorce/img/영화포스터/영화8.jpg", releaseDate: "2024.12.11", rating: "95%", director: "팀 밀란츠", cast: ["킬리언 머피", "에밀리 왓슨"] },
        {id:9, title: "아키라", image: "../main/sorce/img/영화포스터/영화9.jpg", releaseDate: "2024.12.11", rating: "91%", director: "오토모 가츠히로", cast: ["이와타 미츠오", "사사키 노조무"] },
        {id:10, title: "극장판 짱구는 못말려", image: "../main/sorce/img/영화포스터/영화10.jpg", releaseDate: "2024.12.18", rating: "99%", director: "사사키 시노부", cast: ["박영남", "강희선", "김환진"] },
        {id:11, title: "퍼스트레이디", image: "../main/sorce/img/영화포스터/영화11.jpg", releaseDate: "2024.12.12", rating: "88%", director: "애몽", cast:["다큐멘터리"] },
        {id:12, title: "서브스턴스", image: "../main/sorce/img/영화포스터/영화12.jpg", releaseDate: "2024.12.11", rating: "92%", director: "코랄리 파르자", cast:["데미 무어", "마가렛 퀄리", "데니스 퀘이드"] },
        {id:13, title: "1승", image: "../main/sorce/img/영화포스터/영화13.jpg", releaseDate: "2024.12.04", rating: "93%", director: "신연식", cast: ["송강호", "박정민", "장윤주"] },
        {id:14, title: "듄2", image: "../main/sorce/img/영화포스터/영화14.jpg", releaseDate: "2024.12.04", rating: "93%", director: "드니 빌뇌브", cast: ["티모시 샬라메", "젠데이아 콜먼", "레베카 퍼거슨", "오스카 아이삭"] },
        {id:15, title: "여름날의 레몬그라스", image: "../main/sorce/img/영화포스터/영화15.jpg", releaseDate: "2024.11.27", rating: "83%", director: "맹걸 라이", cast: ["이목", "조우녕"] },
        {id:16, title: "청설", image: "../main/sorce/img/영화포스터/영화16.jpg", releaseDate: "2024.11.06", rating: "96%", director: "조선호", cast: ["홍경", "노윤서", "김민주", "정용주"] }
        ];

     	// URL에서 영화 인덱스 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const movieIndex = parseInt(urlParams.get('index'));

        // 유효한 index 값 확인
        if (isNaN(movieIndex) || movieIndex < 0 || movieIndex >= movies.length) {
            console.error("유효하지 않은 영화 인덱스입니다.");
            //return; // 인덱스가 유효하지 않으면 종료
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
            '영화6', '영화7', '영화8', '영화9', '영화10',
            '영화11', '영화12', '영화13', '영화14', '영화15', '영화16'
        ];
     	
     	// JSP에서 contextPath를 JavaScript로 전달 (서버 측에서 경로 설정)
        const contextPath = "${pageContext.request.contextPath}";
     	
     	// 각 영화 폴더에서 4개의 이미지를 가져오는 경로 생성
        //const stillImages = stills.flatMap(movie =>
        //    Array.from({ length: 4 }, (_, index) =>
        //        `../main/sorce/img/영화스틸컷/영화${index + 1}/\${index + 1}.jpg`
                
        //    )
        //);
     	
     	
          //  /main/sorce/img/영화스틸컷/영화2/\${index + 1}.jpg


        const stillImages = {}

        for(let i=0; i<stills.length; i++){
            stillImages[stills[i]]=[];
            for(let j=1; j<=4; j++){
                stillImages[stills[i]].push(`<%=request.getContextPath() %>/main/sorce/img/영화스틸컷/\${stills[i]}/\${j}.jpg` )
            }
        }


        console.log("체킁:",stillImages);
      


        /*
                const stillImages = stills.flatMap(mv =>
                Array.from({ length: 4 }, (_, index) => {
                    <%-- return `<%=request.getContextPath() %>/main/sorce/img/영화스틸컷/영화\${movie.id}/\${index + 1}.jpg`; --%>
                    return `<%=request.getContextPath() %>/main/sorce/img/영화스틸컷/영화\${movie.id}/\${index + 1}.jpg`;
                });
                
        */
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
            console.log(">>>>>>>>>",currentIndex);
            posterImage.src = stillImages[currentIndex];
        });

        // 오른쪽 화살표 클릭 이벤트
        rightArrow.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % stillImages.length; // 다음 이미지로 이동
            posterImage.src = stillImages[currentIndex];
        });
        
    </script>
</html>
    
 
