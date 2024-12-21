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
      #timeinfo, #screeninfo {
          border: none;
          outline: none; /* outline 제거 */
          box-shadow: none; /* box-shadow 제거 */
          background: transparent; /* 배경색 제거 */
          
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
                    //request.getAttribute("scd") 이용해 scd라고 저장된 ScheduleVO 객체의 List 가져오기
                	List<ScheduleVO> scd1 = (List<ScheduleVO>) request.getAttribute("scd");
                	
                    if (scd1 != null) {								// 데이터가 존재할 때만 제목 표시
                        Set<String> movieNames = new HashSet<>();	// HashSet으로 중복된 이름 저장x
                        for (ScheduleVO scdList : scd1) {			// scd1 리스트를 반복하면서 각 ScheduleVO 객체에서 영화 이름 가져오기
                            String movieName = scdList.getMovie_name();
                            if (movieNames.add(movieName)) {		// 영화 이름이 이미 Set에 존재하지 않을 경우에만 true를 반환,  
                            										// 중복된 데이터는 한번만 출력
                %>
                
                	<!-- 중복되지 않은 영화 이름에 대해 <div class="movie-title">를 생성. 
                		  이 div는 클릭 시 highlight2Movie라는 JavaScript 함수를 호출,
                		  현재 div와 함께 영화의 시작 날짜를 인자로 전달 -->
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
                    	// scd라고 저장된 ScheduleVO 객체의 List 가져오기
                        List<ScheduleVO> scd = (List<ScheduleVO>) request.getAttribute("scd");
                        if (scd != null) {									// 데이터가 존재할 때만 지역 표시
                            Set<String> theaterDoSet = new HashSet<>();		// HashSet으로 중복된 지역 저장x 
                            for (ScheduleVO scdList : scd) {				// scd 리스트를 반복하면서 각 ScheduleVO 객체에서 극장 지역 가져오기
                                String theaterDo = scdList.getTheater_do();
                                if (theaterDoSet.add(theaterDo)) {			// 극장 지역이 이미 Set에 존재하지 않을 경우에만 true를 반환,  
																			// 중복된 데이터는 한번만 출력
                    %>
                    
                    	<!-- 중복되지 않은 극장 지역에 대해 <div class="movie-title">를 생성.
                    		  이 div는 클릭 시 filterTheaterNames라는 JavaScript 함수를 호출,
                    		  현재 극장 지역을 인자로 전달.
                    		  selectTheaterDo(this) 함수를 호출하여 현재 div 요소를 인자로 전달
                    	 -->
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
                 		// scd라고 저장된 ScheduleVO 객체의 List 가져오기
                        List<ScheduleVO> scd2 = (List<ScheduleVO>) request.getAttribute("scd");
                        if (scd2 != null) {									// 데이터가 존재할 때만 극장명 표시
                            Set<String> theaterNameSet = new HashSet<>();	// HashSet으로 중복된 지역 저장x 
                            for (ScheduleVO scdList : scd2) {				// scd2 리스트를 반복하면서 각 ScheduleVO 객체에서 극장명 가져오기
                                String theaterName = scdList.getTheater_name();
                                if (theaterNameSet.add(theaterName)) {		// 극장명이 이미 Set에 존재하지 않을 경우에만 true를 반환,  
																			// 중복된 데이터는 한번만 출력
                    %>
                    
                    	<!-- 중복되지 않은 극장 이름에 대해 <div class="movie-title theater-name">를 생성.
                    		  이 div는 클릭 시 selectTheater라는 JavaScript 함수를 호출, 현재 div 요소를 인자로 전달.
                    		  data-theater-do 속성에는 해당 극장 이름에 대한 극장 지역(theaterDo)이 저장
                    	 -->
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
             		// 현재 날짜 가져오기
                	LocalDate today = LocalDate.now();		
                	// 연도와 월을 포맷하는 방법을 정의
                    DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yyyy");
                    DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MM");
                    
                    // 선택된 영화의 시작일을 저장할 변수를 초기화, 현재 연도와 월을 저장할 변수를 초기화
                    String selectedStartDate = ""; 		// 선택된 영화의 시작일
                    String currentYear = "";
                    String currentMonth = "";

                    // 현재 날짜부터 15일 후까지의 날짜를 반복하여 생성
                    for (int i = 0; i <= 15; i++) {
                        LocalDate dateToDisplay = today.plusDays(i);
                        
                        // 각 날짜에 대해 연도, 월, 일, 요일을 포맷하여 문자열로 저장
                        String year = dateToDisplay.format(yearFormatter);
                        String month = dateToDisplay.format(monthFormatter);
                        String day = dateToDisplay.format(DateTimeFormatter.ofPattern("dd"));
                        String dayOfWeek = dateToDisplay.format(DateTimeFormatter.ofPattern("E"));
                        
                        // 년도와 월이 변경될 때만 출력
                        if (!currentYear.equals(year) || !currentMonth.equals(month)) {
                            // 새로운 년도와 월을 함께 포함하는 div 생성
                            out.println("<div class='year-month'>");
                            out.println("<span class='year'>" + year + "</span><br>");
                            out.println("<span class='month'>" + month + "</span>");
                            out.println("</div>");
                            currentYear = year;
                            currentMonth = month;
                        }

                        // 각 날짜에 대해 버튼 요소로 변경
                        //  data-date 속성에 해당 날짜를 저장, 버튼의 텍스트는 요일과 날짜
                        out.println("<button class='date-button' data-date='" + dateToDisplay + "' onclick='selectDate(this)'>" + dayOfWeek + " " +"&nbsp;&nbsp;&nbsp;&nbsp;" + day + "</button>");
                    }
                %>
            </div>
        </div>

<div class="column">
    <div class="header">시간</div> 
    <div class="item" id="scheduleContainer">
        <div id="screeninfo">
        <!-- 시간과 상영관 정보는 하단 스크립트 부분에서 구현... -->
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
let selectedTheater = null; 		// 현재 선택된 극장 이름을 저장하는 변수
let selectedTheaterDo = null;		// 현재 선택된 극장 구역을 저장하는 변수
let selectedStartDate = ""; 		// 선택된 영화의 시작일
let selectedMovie = ""; 			// 선택된 영화

function highlight2Movie(element, startDate) {
/* 영화제목을 클릭했을 때 호출됨.
	모든 영화제목에서 highlight2 클래스를 제거, 클릭한 영화제목에 highlight2 클래스를 추가하여 강조.
	선택된 영화의 시작일과 이름을 저장.
	enableDates 함수를 호출하여 날짜 버튼의 활성화 상태를 업데이트	*/
	
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
/* 선택된 극장 지역에 따라 극장 이름의 가시성을 조정.
 	일치하는 극장이름은 보이게, 클릭 가능하게 설정. 일치하지 않으면 흐리게, 클릭 불가능하게 설정.
 	선택된 극장 구역을 업테이트하여 강조 표시   */
	
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
/* 극장을 선택할 때 호출.
	이전에 선택된 극장의 highlight 클래스 제거, 새로 선택된 극장에 highlight2 클래스를 추가 */
	
    if (selectedTheater) {
        selectedTheater.classList.remove('highlight2');
    }
    
    selectedTheater = theaterElement;
    theaterElement.classList.add('highlight2');
}

function selectTheaterDo(theaterDoElement) {
/* 극장 지역을 선택할 때 호출.
	이전에 선택된 극장 지역에서 highlight2-theater-do 클래스를 제거, 새로 선택한 지역에 추가 */

	
    if (selectedTheaterDo) {
        selectedTheaterDo.classList.remove('highlight2-theater-do');
    }
    
    selectedTheaterDo = theaterDoElement;
    theaterDoElement.classList.add('highlight2-theater-do');
}

function enableDates() {
/* 선택된 시작일에 따라 날짜 버튼의 활성화 상태를 조정.
	선택된 시작일 이전의 날짜 버튼은 비활성화, 그 이후의 날짜 버튼은 활성화  */
	
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
/* 날짜 버튼을 클릭했을 때 호출.
	모든 날짜 버튼에서 highlight-date 클래스를 제거, 클릭한 버튼에 highlight-date 클래스를 추가.
	fetchSchedule 함수를 호출해 선택된 영화, 극장, 극장 지역, 날짜에 대한 상영 일정 가져옴.  */
	
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
/* 선택된 영화, 극장, 극장지역, 날짜에 대한 상영 일정을 서버에서 가져옴.
	AJAX 요청을 통해 서버에 데이터를 전송하고, 응답으로 받은 상영 일정 정보를 처리.
	상영 일정이 있을 경우 각 일정에 대한 버튼응ㄹ 생성, 클릭 시 선택된 정보를 alert로 확인.  */	
    const params = "selectedMovie=" + movie
        + "&selectedTheater=" + theater
        + "&selectedTheaterDo=" + theaterDo
        + "&selectedDate=" + date;

    const req = new XMLHttpRequest();
    req.open('post', '<%=request.getContextPath()%>/scheduleList.do');
    req.onreadystatechange = function() {
        if (req.readyState == 4 && req.status == 200) {
            const schedules = JSON.parse(req.responseText);
            const screenInfoDiv = document.getElementById('screeninfo');

            // 기존 내용을 초기화
            screenInfoDiv.innerHTML = "";

            if (schedules.length > 0) {
                // 각 일정에 대해 개별적으로 출력
                schedules.forEach((schedule) => {
                    const scheduleDiv = document.createElement('div');

                 // 버튼 생성
                    const button = document.createElement('button');
                    button.title = "종료 " + schedule.end_time;
                    button.innerHTML = schedule.start_time + "분&nbsp;&nbsp;&nbsp;&nbsp;" + schedule.screen_name + "&nbsp;&nbsp;" + schedule.screen_type;
                    
                    // 버튼 클릭 시 alert 표시
                    button.onclick = function() {
                        alert("선택한 영화: " + selectedMovie + "\n" +
                              "선택한 지역: " + theaterDo + "\n" +
                              "선택한 극장: " + theater + "\n" +
                              "선택한 날짜: " + date + "\n" +
                              "선택한 시간: " + schedule.start_time);
                    };

                    // 스타일 설정
                    scheduleDiv.style.border = 'none'; // border 제거
                    scheduleDiv.appendChild(button);
                    screenInfoDiv.appendChild(scheduleDiv);
                });
            } else {
                // 일정이 없을 경우 처리
                screenInfoDiv.innerHTML = "상영 일정이 없습니다.";
            }
        }
    }
    req.setRequestHeader('content-type', 'application/x-www-form-urlencoded;char-set=utf-8;');
    req.send(params);
}

</script>