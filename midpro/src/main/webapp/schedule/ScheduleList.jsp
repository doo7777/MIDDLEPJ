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
            background-color: #ef8400;
        }
        .item {
            height: 500px; /* 고정 높이 설정 (길게 조정) */
            overflow-y: auto; /* 세로 스크롤 가능 */
            flex-direction: column; /* 세로 방향으로 정렬 */
            background-color: white;
            color: black;
        }
        /* 날짜 열에 대한 스타일 */
        .date-header, .date-item {
            width: 100px; /* 날짜의 너비를 줄임 */
        }
		/* 날짜 영역 스타일 추가 */
		.item.date-item {
		    height: 504px; /* 다른 요소와 동일한 높이 유지 */
		    overflow-y: auto; /* 세로 스크롤 가능 */
		    padding-bottom: 40px; /* 스크롤 시 추가 공백 */
		    box-sizing: border-box; /* 패딩 포함하여 전체 높이 계산 */
		    margin-bottom: 0; /* 아래쪽 여백 제거 */
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
        .highlight2 {
            background-color: black; /* 배경색을 검정색으로 변경 */
            color: white; /* 글자색을 흰색으로 변경 */
            width: 100%; 
            height: 50px; 
            text-align: center; /* 가운데 정렬 */
            display: flex; /* 플렉스 박스 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
        }
        .highlight2-theater-do {
            background-color: black; /* 선택된 극장 구역 강조 색상 */
            color: white; /* 텍스트 색상 */
        }
        .item2 {
            display: flex; /* Flexbox 사용 */
            align-items: center; 
            height: 500px; /* 고정 높이 설정 (길게 조정) */
            overflow-y: auto; /* 세로 스크롤 가능 */
            flex-direction: row; /* 수평 방향으로 정렬 */
            background-color: white;
        }
        .left, .right {
            padding: 10px; /* 여백 추가 */
        }
        .left {
            background-color: white; /* 왼쪽 열 배경색 */
            height: 100%;
            width: 30%;
            color: black;
            border: none;
        }
        .right {
            background-color: white; /* 오른쪽 열 배경색 */
            height: 100%;
            width: 70%;
            color: black;
            border: none;
        }
        .year-month {
            text-align: center;
            width: 70px;
            height: 70px;
            margin-bottom: 10px;
            border: none;
            margin-top: 10px;
        }
        .year {
            font-size: 10pt; /* 년도 글자 크기 */
            color: #ef8400;
        }
        .month {
            font-size: 20pt; /* 월 글자 크기 */
            color: red;
        }
        .day {
            margin-bottom: 10px;
        }
        .date-button {
            background: none; /* 배경 제거 */
            border: none; /* 테두리 제거 */
            color: black; /* 글자색 설정 */
            text-align: left; /* 왼쪽 정렬 */
            cursor: pointer; /* 커서를 포인터로 변경 */
            padding: 0; /* 패딩 제거 */
            margin: 0; /* 마진 제거 */
            font: inherit; /* 기본 폰트 설정 상속 */
            outline: none; /* 포커스 시 테두리 제거 */
        }
        .highlight-date {
            background-color: black; /* 배경색을 검정색으로 변경 */
            color: white; /* 글자색을 흰색으로 변경 */
        }
        #scheduleContainer{
        	display: flex;
        	flex-direction: row;
        	align-items: flex-start;        
        }
        #timeinfo{
        	margin-right: 20px;
        	margin-top: 20px;
        	margin-left: 10px;
        	border: none;
        }
        #screeninfo{
        	margin-top: 20px;
        	margin-left: 10px;
        	border: none;
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
                    List<ScheduleVO> scd1 = (List<ScheduleVO>) request.getAttribute("scd");
                    if (scd1 != null) {
                        Set<String> movieNames = new HashSet<>();
                        for (ScheduleVO scdList : scd1) {
                            String movieName = scdList.getMovie_name();
                            if (movieNames.add(movieName)) {
                %>
                                <div class="movie-title" onclick="highlight2Movie(this, '<%= scdList.getStart_date() %>')">
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
                        List<ScheduleVO> scd = (List<ScheduleVO>) request.getAttribute("scd");
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
                        List<ScheduleVO> scd2 = (List<ScheduleVO>) request.getAttribute("scd");
                        if (scd2 != null) {
                            Set<String> theaterNameSet = new HashSet<>();
                            for (ScheduleVO scdList : scd2) {
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
                    DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yyyy");
                    DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MM");
                    String selectedStartDate = ""; // 선택된 영화의 시작일
                    String currentYear = "";
                    String currentMonth = "";

                    for (int i = 0; i <= 15; i++) {
                        LocalDate dateToDisplay = today.plusDays(i);
                        String year = dateToDisplay.format(yearFormatter);
                        String month = dateToDisplay.format(monthFormatter);
                        String day = dateToDisplay.format(DateTimeFormatter.ofPattern("dd"));
                        String dayOfWeek = dateToDisplay.format(DateTimeFormatter.ofPattern("E"));
                        
                        // 년도와 월이 변경될 때만 출력
                        if (!currentYear.equals(year) || !currentMonth.equals(month)) {
                            // 년도와 월을 함께 포함하는 div 생성
                            out.println("<div class='year-month'>");
                            out.println("<span class='year'>" + year + "</span><br>");
                            out.println("<span class='month'>" + month + "</span>");
                            out.println("</div>");
                            currentYear = year;
                            currentMonth = month;
                        }

                        // 버튼 요소로 변경
                        out.println("<button class='date-button' data-date='" + dateToDisplay + "' onclick='selectDate(this)'>" + dayOfWeek + " " +"&nbsp;&nbsp;&nbsp;&nbsp;" + day + "</button>");
                    }
                %>
            </div>
        </div>

<div class="column">
    <div class="header">시간</div>
    <div class="item" id="scheduleContainer">
    
       <div id="timeinfo">
       
        <!-- DB에서 가져온 시간 데이터가 여기에 들어갑니다. -->
        <%
            List<ScheduleVO> scd4 = (List<ScheduleVO>) request.getAttribute("scdList2"); // 수정: scdList2 사용
            if (scd4 != null && !scd4.isEmpty()) {
                for (ScheduleVO scdList : scd4) {
        %>
                    <div>
                        <strong>시간:</strong> <%= scdList.getStart_time() %><br>
                        <hr> <!-- 구분선 추가 -->
                    </div>
        <%
                }
            } else {
        %>
            <p>상영 시간이 없습니다.</p> <!-- 데이터가 없을 경우 메시지 표시 -->
        <%
            }
        %>              
       </div>
       
       
       <div id="screeninfo">
       </div>
    </div>
</div>
    </div>


    <br>
    <br>
    <img alt="하얼빈" src="/midpro/main/sorce/img/영화포스터/바텀 하얼빈.jpg" id="하얼빈"> 
    <!-- 이미지 눌렀을떄 영화 상세정보 jsp/survlet으로 이동하는 스크립트 작성해야함 -->
    <%@ include file="/main/Bottom.jsp" %>
</body> 

<script>
let selectedTheater = null; // 현재 선택된 극장 이름을 저장하는 변수
let selectedTheaterDo = null; // 현재 선택된 극장 구역을 저장하는 변수
let selectedStartDate = ""; // 선택된 영화의 시작일
let selectedMovie = ""; // 선택된 영화

function highlight2Movie(element, startDate) {
    // 모든 영화 제목에서 highlight 클래스를 제거
    const titles = document.querySelectorAll('.movie-title');
    titles.forEach(title => {
        title.classList.remove('highlight2');
    });
    
    // 클릭한 영화 제목에 highlight 클래스를 추가
    element.classList.add('highlight2');

    // 시작일 및 선택된 영화 이름 저장
    selectedStartDate = startDate;
    selectedMovie = element.innerText; // 선택된 영화 이름 저장
    enableDates();
}

function filterTheaterNames(selectedTheaterDo) {
    const theaterNames = document.querySelectorAll('.theater-name');
    
    theaterNames.forEach(theater => {
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
        const previousTheaterDo = document.querySelector('.highlight2-theater-do');
        if (previousTheaterDo) {
            previousTheaterDo.classList.remove('highlight2-theater-do');
        }
        
        const currentTheaterDo = document.querySelector(`.movie-title[onclick*="${selectedTheaterDo}"]`);
        if (currentTheaterDo) {
            currentTheaterDo.classList.add('highlight2-theater-do');
        }
    }
}

function selectTheater(theaterElement) {
    if (selectedTheater) {
        selectedTheater.classList.remove('highlight2');
    }
    
    selectedTheater = theaterElement;
    theaterElement.classList.add('highlight2');
}

function selectTheaterDo(theaterDoElement) {
    if (selectedTheaterDo) {
        selectedTheaterDo.classList.remove('highlight2-theater-do');
    }
    
    selectedTheaterDo = theaterDoElement;
    theaterDoElement.classList.add('highlight2-theater-do');
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
    const selectedDate = button.getAttribute('data-date');
    console.log("선택된 영화: " + selectedMovie);
    console.log("선택된 극장: " + (selectedTheater ? selectedTheater.innerText : "없음"));
    console.log("선택된 극장 구역: " + (selectedTheaterDo ? selectedTheaterDo.innerText : "없음"));
    console.log("선택된 날짜: " + selectedDate);
    
    // 모든 날짜 버튼에서 highlight 클래스를 제거
    const buttons = document.querySelectorAll('.date-button');
    buttons.forEach(btn => {
        btn.classList.remove('highlight-date');
    });
    
    // 클릭한 버튼에 highlight 클래스를 추가
    button.classList.add('highlight-date');
    
    console.log("선택된 영화: " + selectedMovie);
    console.log("선택된 극장: " + (selectedTheater ? selectedTheater.innerText : "없음"));
    console.log("선택된 극장 구역: " + (selectedTheaterDo ? selectedTheaterDo.innerText : "없음"));
    console.log("선택된 날짜: " + selectedDate);
    
    // 상영 시간 가져오기
    fetchSchedule(selectedMovie, selectedTheater.innerText, selectedTheaterDo.innerText, selectedDate);
}

function fetchSchedule(movie, theater, theaterDo, date) {
	const params = "selectedMovie=" + movie
	+ "&selectedTheater=" + theater
	+ "&selectedTheaterDo=" + theaterDo
	+ "&selectedDate=" + date;
	const req = new XMLHttpRequest();
	req.open('post','<%=request.getContextPath()%>/scheduleList.do');
	req.onreadystatechange = function(){
	    if(req.readyState == 4 && req.status == 200){
	        const schedules = JSON.parse(req.responseText);
	        
	        const screen_name = schedules.map(schedule => schedule.screen_name).join('<br><br>'); // screen_name만 추출
	        const startTimes = schedules.map(schedule => schedule.start_time).join('<br><br>'); // start_time만 추출
	        
	        
	        document.getElementById('timeinfo').innerHTML = startTimes; // div 요소에 start_time 출력
	        document.getElementById('screeninfo').innerHTML = screen_name; // div 요소에 screen_name 출력
	    }
	}
	req.setRequestHeader('content-type','application/x-www-form-urlencoded;char-set=utf-8;')
	req.send(params);
}
</script>
</html>