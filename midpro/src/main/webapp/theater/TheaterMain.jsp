<%@page import="Vo.TheaterVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Comparator"%>
<%@page import="Vo.CustomerVO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
        /* 전체 화면 사이즈 */
        #main {
            position: relative;
            left: 2px;
        }

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

        #TheaterMain {
            color: white;
            margin-left: 260px;
            width: 1360px;
            height: 400px;
            background-color: rgb(52, 52, 52);
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 가로 방향 가운데 정렬 */
            align-items: center; /* 세로 방향 가운데 정렬 */
        }

        .spot {
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 가로 방향 가운데 정렬 */
            width: 1280px;
            height: 330px;
            border-radius: 20px;
            border: solid white;
            justify-content: center;
        }

        .region {
            margin: 20px;
            border: none;
            display: flex; /* Flexbox 사용 */
            flex-direction: column; /* 세로 방향으로 정렬 */
            align-items: center; /* 가로 방향 가운데 정렬 */
        }

        button {
            background: none; /* 배경 제거 */
            border: none; /* 테두리 제거 */
            color: inherit; /* 부모 요소의 글꼴 색상 상속 */
            padding: 0; /* 패딩 제거 */
            font: inherit; /* 부모 요소의 글꼴 스타일 상속 */
            cursor: pointer; /* 커서 모양 변경 */
            margin: 5px 0; /* 버튼 간의 간격 */
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <h2 class="movie">영화관 정보</h2>
    <br><br>
    <div id="TheaterMain">
        <div class="spot">
            <% 
                List<TheaterVO> thea = (List<TheaterVO>) request.getAttribute("thea");
                if (thea != null) {
                    // theater_id 기준으로 정렬
                    thea.sort(Comparator.comparing(TheaterVO::getTheater_id));

                    // 지역별 영화관을 저장할 맵 생성
                    Map<String, List<TheaterVO>> regionMap = new LinkedHashMap<>();
                    for (TheaterVO tList : thea) {
                        String region = tList.getTheater_do(); // 지역 정보
                        if (!regionMap.containsKey(region)) {
                            regionMap.put(region, new ArrayList<>()); // 지역이 없으면 새 리스트 생성
                        }
                        regionMap.get(region).add(tList); // 해당 지역 리스트에 추가
                    }

                    // 지역별로 버튼 생성
                    for (String region : regionMap.keySet()) {
            %>
            <div class="region">
                <h3><%= region %></h3> <!-- 지역 이름 표시 -->
                <% 
                    for (TheaterVO tList : regionMap.get(region)) {
                %>
                <button type="button" onclick="location.href='<%=request.getContextPath()%>/theaterDetail.do?theater_name=<%=tList.getTheater_name() %>';">
                    <%= tList.getTheater_name() %>
                </button>
                <% 
                    }
                %>
            </div>
            <% 
                    }
                } else {
            %>
            <div>등록된 영화관 정보가 없습니다.</div>
            <% 
                }
            %>  
        </div>
    </div>
    <%@ include file="/main/Bottom.jsp" %>
</body>

<script>
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
    });

    document.addEventListener('DOMContentLoaded', function() {
        const videoPlayerElement = document.querySelector('#movie_play video'); // <video> 요소 선택
        const sourcesElement = videoPlayerElement.getElementsByTagName('source'); // source 요소를 가져옴

        function movie_play() {
            const randomNum = Math.floor(Math.random() * sourcesElement.length); // 소스의 개수에 따라 난수 생성
            return randomNum; // 난수를 반환
        }

        function loadRandomVideo() {
            const randomNum = movie_play(); // 난수 생성

            // 모든 소스의 src를 초기화
            for (let i = 0; i < sourcesElement.length; i++) {
                sourcesElement[i].src = `sorce/영상 소스파일${i + 1}.mp4`; // 파일 경로 수정
            }

            // 선택된 소스의 src를 설정
            videoPlayerElement.src = sourcesElement[randomNum].src;

            // videoPlayer가 비디오 요소인지 확인
            if (videoPlayerElement instanceof HTMLVideoElement) {
                videoPlayerElement.load(); // 비디오 소스 변경 후 비디오 로드
                videoPlayerElement.play(); // 비디오 자동 재생
            } else {
                console.error('videoPlayer is not a valid video element');
            }
        }

        loadRandomVideo(); // 랜덤 비디오 로드 함수 호출
    });
</script>
</html>
