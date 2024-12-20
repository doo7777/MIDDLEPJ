<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.DayOfWeek" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            background: black;
        }
        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
        }
        #하얼빈 {
            display: flex;
            flex-direction: row; /* 가로 방향으로 정렬 */
            justify-content: center; /* 중앙 정렬 */
            margin-left: 450px;
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
        .header, .item, .item2 {
            display: flex;
            align-items: center; 
            height: 30px; /* 항목 높이 */
            margin: 10px 0; /* 항목 간의 간격을 10px로 늘림 */
            width: 300px; /* 기본 너비 설정 */
        }
        .header {
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 (선택 사항) */
            height: 30px; /* 항목 높이 */
            background-color: gray;
        }
        .item {
            height: 500px; /* 고정 높이 설정 (길게 조정) */
            overflow-y: auto; /* 세로 스크롤 가능 */
            flex-direction: column; /* 세로 방향으로 정렬 */
            background-color: gray;
        }
        /* 날짜 열에 대한 스타일 */
        .date-header, .date-item {
            width: 100px; /* 날짜의 너비를 줄임 */
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
            cursor: pointer; /* 마우스 커서를 포인터로 변경 */
            margin: 10px 0;
        }
        /* 클릭 시 검정색으로 칠해지는 스타일 */
        .highlight {
            background-color: black; /* 배경색을 검정색으로 변경 */
            color: white; /* 글자색을 흰색으로 변경 */
            width: 100%;
            height: 50px;
            text-align: center; /* 가운데 정렬 */
            display: flex; /* 플렉스 박스 사용 */
            align-items: center; /* 수직 중앙 정렬 */
            justify-content: center; /* 수평 중앙 정렬 */
        }
        .highlight-theater-do {
            background-color: black; /* 선택된 극장 구역 강조 색상 */
            color: white; /* 텍스트 색상 */
        }
        .item2 {
            display: flex; /* Flexbox 사용 */
            align-items: center; 
            height: 500px; /* 고정 높이 설정 (길게 조정) */
            overflow-y: auto; /* 세로 스크롤 가능 */
            flex-direction: row; /* 수평 방향으로 정렬 */
            background-color: gray;
        }
        .left, .right {
            padding: 10px; /* 여백 추가 */
        }
        .left {
            background-color: blue; /* 왼쪽 열 배경색 */
            height: 100%;
            width: 30%;
        }
        .right {
            background-color: blue; /* 오른쪽 열 배경색 */
            height: 100%;
            width: 70%;
        }
        .year-month {
            text-align: center;
            width: 70px;
            height: 70px;
            margin-bottom: 10px;
        }
        .year {
            font-size: 10pt; /* 년도 글자 크기 */
        }
        .month {
            font-size: 20pt; /* 월 글자 크기 */
        }
        .day {
            margin-bottom: 10px;
        }
        .disabled {
            color: gray; /* 비활성화된 날짜 색상 */
            pointer-events: none; /* 클릭 이벤트 비활성화 */
            text-decoration: line-through; /* 취소선 추가 */
        }
    </style>
</head>
<body>
    <%@ include file="/main/Top.jsp" %>
    
    <div id="group">
        <div class="column">
            <div class="header">영화</div>
            <div class="item">
                <%
                    List<ScheduleVO> scd = (List<ScheduleVO>) request.getAttribute("scd");
                    if (scd != null) {
                        Set<String> movieNames = new HashSet<>();
                        for (ScheduleVO scdList : scd) {
                            String movieName = scdList.getMovie_name();
                            if (movieNames.add(movieName)) {
                %>
                                <div class="movie-title" onclick="highlightMovie(this, '<%= scdList.getStart_date() %>')">
                                    <%= movieName %>
                                </div>
                <%
                            }
                        }
                    }   
                %>
            </div>
        </div>

        <div class="column">
            <div class="header">극장</div>
            <div class="item2">
                <div class="left">
                    <%
                        if (scd != null) {
                            Set<String> theaterDoSet = new HashSet<>();
                            for (ScheduleVO scdList : scd) {
                                String theaterDo = scdList.getTheater_do();
                                if (theaterDoSet.add(theaterDo)) {
                    %>
                                    <div class="movie-title" onclick="filterTheaterNames('<%= theaterDo %>'); selectTheaterDo(this)">
                                        <%= theaterDo %>
                                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
                
                <div class="right">
                    <%
                        if (scd != null) {
                            Set<String> theaterNameSet = new HashSet<>();
                            for (ScheduleVO scdList : scd) {
                                String theaterName = scdList.getTheater_name();
                                if (theaterNameSet.add(theaterName)) {
                    %>
                                    <div class="movie-title theater-name" data-theater-do="<%= scdList.getTheater_do() %>" onclick="selectTheater(this)">
                                        <%= theaterName %>
                                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="header date-header">날짜</div>
            <div class="item date-item">
                <%
                    LocalDate today = LocalDate.now();
                    for (int i = 0; i <= 15; i++) {
                        LocalDate dateToDisplay = today.plusDays(i);
                        String dayOfWeek = dateToDisplay.format(DateTimeFormatter.ofPattern("E"));
                        String day = dateToDisplay.format(DateTimeFormatter.ofPattern("dd"));
                        
                        // 버튼 요소로 변경
                        out.println("<button class='date-button' data-date='" + dateToDisplay + "' onclick='selectDate(this)'>" + dayOfWeek + " " + "&nbsp;&nbsp;&nbsp;&nbsp;" + day + "</button>");
                    }
                %>
            </div>
        </div>

        <div class="column">
            <div class="header">시간</div>
            <div class="item" id="time-list">
                <!-- 선택된 영화, 극장, 날짜에 따라 시간 데이터가 여기에 들어갑니다. -->
            </div>
        </div>
    </div>

    <br>
    <br>
    <img alt="하얼빈" src="/midpro/main/sorce/img/영화포스터/바텀 하얼빈.jpg" id="하얼빈"> 
    <%@ include file="/main/Bottom.jsp" %>
</body> 

<script>
let selectedTheater = null; // 현재 선택된 극장 이름을 저장하는 변수
let selectedTheaterDo = null; // 현재 선택된 극장 구역을 저장하는 변수

let selectedStartDate = ""; // 선택된 영화의 시작일
let scheduleData = [];

<%
    // JSP에서 ScheduleVO 리스트를 JSON으로 변환하여 JavaScript에 전달
    if (scd != null) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm"); // 시간 형식 정의
        for (ScheduleVO schedule : scd) {
            String startTimeStr = schedule.getStart_time(); // VARCHAR2로 저장된 시간 정보
            LocalTime startTime = LocalTime.parse(startTimeStr, DateTimeFormatter.ofPattern("HH:mm")); // 문자열을 LocalTime으로 변환
            
            out.println("scheduleData.push({");
            out.println("movie_name: '" + schedule.getMovie_name() + "',");
            out.println("theater_do: '" + schedule.getTheater_do() + "',");
            out.println("theater_name: '" + schedule.getTheater_name() + "',");
            out.println("start_date: '" + schedule.getStart_date() + "',");
            out.println("start_time: '" + startTime.toString() + "'"); // LocalTime을 문자열로 변환
            out.println("});");
        }
    }
%>


function highlightMovie(element, startDate) {
    const movies = document.querySelectorAll('.movie-title');
    movies.forEach(movie => movie.classList.remove('highlight'));
    element.classList.add('highlight');

    // 시작일 설정
    selectedStartDate = startDate;
    enableDates();
    updateTimeList();
}

function filterTheaterNames(selectedTheaterDo) {
    // 모든 극장 이름을 가져옵니다.
    const theaterNames = document.querySelectorAll('.theater-name');
    
    theaterNames.forEach(theater => {
        // 극장 이름의 data-theater-do 속성과 선택된 극장 구역을 비교합니다.
        if (theater.getAttribute('data-theater-do') === selectedTheaterDo) {
            theater.style.opacity = '1'; // 일치하는 극장 이름은 보이게
            theater.style.pointerEvents = 'auto'; // 클릭 가능
        } else {
            theater.style.opacity = '0.5'; // 일치하지 않는 극장 이름은 흐리게
            theater.style.pointerEvents = 'none'; // 클릭 불가능
        }
    });

    // 선택된 극장 구역을 업데이트
    if (selectedTheaterDo !== null) {
        // 이전에 선택된 극장 구역이 있다면 강조 해제
        const previousTheaterDo = document.querySelector('.highlight-theater-do');
        if (previousTheaterDo) {
            previousTheaterDo.classList.remove('highlight-theater-do');
        }
        
        // 현재 선택된 극장 구역에 강조 추가
        const currentTheaterDo = document.querySelector(`.movie-title[onclick*="${selectedTheaterDo}"]`);
        if (currentTheaterDo) {
            currentTheaterDo.classList.add('highlight-theater-do');
        }
    }
    
    updateTimeList(); // 극장 필터링 후 시간 목록 업데이트
}

function selectTheater(theaterElement) {
    // 이미 선택된 극장이 있다면 선택 해제
    if (selectedTheater) {
        selectedTheater.classList.remove('highlight');
    }
    
    // 현재 선택된 극장 이름을 업데이트
    selectedTheater = theaterElement;
    
    // 선택된 극장 이름에 highlight 클래스를 추가합니다.
    theaterElement.classList.add('highlight');
    
    updateTimeList(); // 극장 선택 후 시간 목록 업데이트
}

// 극장 구역 클릭 시 호출되는 함수
function selectTheaterDo(theaterDoElement) {
    // 이미 선택된 극장 구역이 있다면 선택 해제
    if (selectedTheaterDo) {
        selectedTheaterDo.classList.remove('highlight-theater-do');
    }
    
    // 현재 선택된 극장 구역을 업데이트
    selectedTheaterDo = theaterDoElement;
    
    // 선택된 극장 구역에 highlight 클래스를 추가합니다.
    theaterDoElement.classList.add('highlight-theater-do');
}



function enableDates() {
    const buttons = document.querySelectorAll('.date-button');
    const startDate = new Date(selectedStartDate);
    buttons.forEach(button => {
        const buttonDate = new Date(button.getAttribute('data-date'));
        if (buttonDate < startDate) {
            button.disabled = true; // 이전 날짜 비활성화
        } else {
            button.disabled = false; // 선택 가능
        }
    });
}

function selectDate(button) {
    // 선택된 날짜 처리
    const selectedDate = button.getAttribute('data-date');
    console.log("선택된 날짜: " + selectedDate);
    
    updateTimeList(); // 날짜 선택 후 시간 목록 업데이트
}

function updateTimeList() {
    const timeList = document.getElementById('time-list');
    timeList.innerHTML = ''; // 기존 시간 목록 초기화

    // 선택된 영화, 극장, 날짜에 따라 시간 데이터를 가져옴
    const filteredTimes = scheduleData.filter(item => {
        return item.movie_name === selectedMovieName && 
               item.theater_do === selectedTheaterDo && 
               item.start_date === selectedStartDate;
    });

    filteredTimes.forEach(item => {
        const timeDiv = document.createElement('div');
        timeDiv.textContent = item.start_time; // 시간 추가
        timeList.appendChild(timeDiv);
    });
}
</script>
</html>