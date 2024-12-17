<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
        background: gray;
    }

    div {
        border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
    }
    
    #group {
        display: flex;
        flex-direction: row; /* 가로 방향으로 정렬 */
        justify-content: center; /* 중앙 정렬 */
        margin-left: 260px;
        color: white;
        width: 1360px;
    }
    .column {
        display: flex; /* 세로 방향으로 정렬 */
        flex-direction: column; /* 세로 방향으로 정렬 */
        align-items: center; /* 중앙 정렬 */
        margin: 0 2px; /* 열 간의 간격 추가 */
    }
    
    .header, .item {
        display: flex;
        justify-content: center; 
        align-items: center; 
        height: 30px; /* 항목 높이 */
        margin: 10px 0; /* 항목 간의 간격을 10px로 늘림 */
        width: 300px; /* 기본 너비 설정 */
    }

    .header {
        background-color: gray;
    }
    .item {
        height: 500px; /* 고정 높이 설정 (길게 조정) */
        overflow-y: auto; /* 세로 스크롤 가능 */
        flex-direction: column; /* 세로 방향으로 정렬 */
    }

    /* 날짜 열에 대한 스타일 */
    .date-header, .date-item {
        width: 200px; /* 날짜의 너비를 줄임 */
    }

    /* 연령 이미지 표시를 위한 스타일 */
    .age-rating {
        width: 30px; /* 정사각형 크기 */
        height: 30px; /* 정사각형 크기 */
        background-color: white; /* 배경색 (나중에 이미지로 대체 가능) */
        display: inline-block; /* 인라인 블록으로 설정 */
        margin-right: 5px; /* 제목과의 간격 */
        vertical-align: middle; /* 수직 정렬 */
    }

    /* 영화 제목을 감싸는 div의 테두리 제거 */
    .movie-title {
        border: none; /* 테두리 제거 */
        display: flex; /* 플렉스 박스 사용 */
        align-items: center; /* 수직 중앙 정렬 */
    }
</style>
</head>
<body>
    <%@ include file="/main/Top.jsp" %>
    
    <div id="group">
        <div class="column">
            <div class="header">영화</div>
            <div class="item">
                <div class="movie-title">
                    <div class="age-rating"></div> 영화1
                </div>
                <div class="movie-title">
                    <div class="age-rating"></div> 영화2
                </div>
                <!-- 더 많은 데이터가 있을 경우 스크롤이 생깁니다. -->
            </div>
        </div>
        
        <div class="column">
            <div class="header">극장</div>
            <div class="item">
                <!-- DB에서 가져온 극장 데이터가 여기에 들어갑니다. -->
                극장1<br>
                극장2<br>                
            </div>
        </div>


        <div class="column">
            <div class="header date-header">날짜</div>
            <div class="item date-item">
            <!-- DB에서 가져온 극장 데이터가 여기에 들어갑니다. -->
            2024-12-17<br>
            2024-12-18<br>
            </div>
        </div>

        <div class="column">
            <div class="header">시간</div>
            <div class="item">
                <!-- DB에서 가져온 시간 데이터가 여기에 들어갑니다. -->
                14:00<br>
                15:00<br>                
            </div>
        </div>
    </div>

    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>
