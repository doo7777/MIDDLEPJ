<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>DGV</title>
    <style>
        body {
            margin: 0;
            width: 100%;
            overflow-x: hidden;
/*             overflow-y: auto; */
            background: black;
        }
        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
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
            background-color: white;
            color: black;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .reserveButton:hover {
            font-weight: bold;
            background-color: black;
            color: white;
            
        }

        /* 포스터에 마우스를 올렸을 때 확대 효과 */
        .moviePoster:hover {
            transform: scale(1.05); /* 확대 효과 */
            
        }
        
    </style>
</head>
<body>
	<div>
		<%@ include file="/main/Top.jsp" %>
	</div>

        <div id="movie_list">
 				<!-- 영화 목록 영역 -->
        </div>
        
       <%@ include file="/main/Bottom.jsp" %>
</body>
<script>


    const movies = [
	{ title: "밀레니엄 맘보", image: "../main/sorce/img/상영예정작/movie1.jpg", releaseDate: "2025.01.01", rating: "?", dierector: "허우 샤오시엔", cast: ["서기", "잭 카오", "투안 춘하오"] },
	{ title: "뽀로로 극장판 바닷속 대모험", image: "../main/sorce/img/상영예정작/movie2.jpg", releaseDate: "2025.01.01", rating: "99%", dierector: "윤제완" },
	{ title: "수퍼 소닉3", image: "../main/sorce/img/상영예정작/movie3.jpg", releaseDate: "2025.01.01", rating: "99%", dierector: "제프 파울러", cast: ["짐 캐리", "벤 슈와츠", "제임스 마스던", "키아누 리브스"] },
	{ title: "총을 든 스님", image: "../main/sorce/img/상영예정작/movie4.jpg", releaseDate: "2025.01.01", rating: "?", dierector: "파오 초이닝 도르지", cast: ["탄딘 왕추크", "데키 라모"] },
	{ title: "피스 바이 피스", image: "../main/sorce/img/상영예정작/movie5.jpg", releaseDate: "2025.01.08", rating: "?", dierector: "모건 네빌", cast: ["퍼렐 윌리엄스", "스눕 독", "그웬 스테파니", "켄드릭 라마"] },
	{ title: "데드데드 데몬즈 디디디디 디스트럭션: 파트1", image: "../main/sorce/img/상영예정작/movie6.jpg", releaseDate: "2025.01.08", rating: "?", dierector: "쿠로카와 토모유키", cast: ["이쿠타 리라", "아노", "타네자키 아츠미"] },
	{ title: "동화지만 청불입니다", image: "../main/sorce/img/상영예정작/movie7.jpg", releaseDate: "2025.01.08", rating: "?", dierector: "이종석", cast: ["박지현", "최시원", "성동일"] },
	{ title: "폭락", image: "../main/sorce/img/상영예정작/movie8.jpg", releaseDate: "2025.01.15", rating: "?", dierector: "현해리", cast: ["송재림", "안우연", "민성욱", "소희정", "차정원"] },
    ];

    const movieList = document.querySelector("#movie_list");

    // forEach를 통해 movies 배열에 있는 변수 하나씩 꺼내감
        movies.forEach(movie => {
        const movieItem = document.createElement("div");
        movieItem.className = "movieItem";

        // 포스터를 감싸는 movieListBox
        const movieListBox = document.createElement("div");
        movieListBox.className = "movieListBox";
        
     	// 포스터 영역
        const posterBox = document.createElement("div");
        posterBox.className = "posterBox";

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
        
     	// 포스터 클릭 시 새 페이지로 이동
        //poster.addEventListener("click", () => {
        //	const index = movies.indexOf(movie); // 현재 영화의 인덱스
        //    window.location.href = `movieDetailTest.jsp?index=\${index}`; // URL에 영화 인덱스를 파라미터로 전달
        //});

         

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


});
 

</script>
</html>