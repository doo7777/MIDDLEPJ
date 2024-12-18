<%@page import="Dao.ScreenDaoImpl"%>
<%@page import="Service.ScreenServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="Vo.MovieVO"%>
<%@page import="Dao.MovieDaoImpl"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="Dao.TheaterDaoImpl"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="Dao.ScheduleDaoImpl"%>
<%@page import="Vo.CustomerVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화 예약 시스템</title>
</head>
<body>
<%
    // 세션에서 로그인한 고객 정보 가져오기
    HttpSession session2 = request.getSession();
    CustomerVO loginSession = (CustomerVO) session.getAttribute("ok");

    if (loginSession == null) {
%>
    <h3 style="text-align: center;">로그인 정보가 없습니다. 로그인 후 다시 시도해주세요.</h3>
<%
    } else { 
        // 영화 목록 가져오기
        MovieDaoImpl movieDao = MovieDaoImpl.getInstance();
        List<MovieVO> movieList = movieDao.getAllMovie();

        // 극장 목록 가져오기
        TheaterDaoImpl theaterDao = TheaterDaoImpl.getInstance();
        List<TheaterVO> theaterList = theaterDao.getAllTheater();

        // 스케줄 목록 가져오기
        ScheduleDaoImpl scheduleDao = ScheduleDaoImpl.getInstance();
        List<ScheduleVO> scheduleList = scheduleDao.getAllSchedule();
        
%>

    <h1>영화 예약 시스템</h1>

    <form action="<%= request.getContextPath() %>/reservation.do" method="post">
        <!-- 고객 ID -->
        <label for="customer_id">고객 ID:</label>
        <input type="text" id="customer_id" name="customer_id" 
               value="<%= loginSession.getCustomer_id() %>" readonly>
        <br><br>
        
        <!-- 스케줄 선택 -->
        <label for="schedule_id">스케줄 선택:</label>
        <select id="schedule_id" name="schedule_id" required>
           <option value="1">1</option>
            <option value="2">2</option>
        </select>
        <br><br>
        

        <!-- 영화 선택 -->
        <label for="movie_name">영화 선택:</label>
        <select id="movie_name" name="movie_name" required>
        <%
            for (MovieVO movie : movieList) {
        %>
            <option value="<%= movie.getMovie_name() %>">
                <%= movie.getMovie_name() %>
            </option>
        <%
            }
        %>
        </select>
        <br><br>
        
        <!-- 상영관 선택 -->
        <label for="screen_id">상영관 선택:</label>
        <select id="screen_id" name="screen_id" required>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <br><br>
        
          <!-- 상영관 선택 -->
        <label for="theater_id">영화관 선택:</label>
        <select id="theater_id" name="theater_id" required>
        <%
        	for(TheaterVO theater : theaterList ) {
        %>
			
			<option value="<%=theater.getTheater_id() %>">
				<%=theater.getTheater_name() %>
			</option>
		<%
        	}
		%>
        </select>
        <br><br>

        <input type="submit" value="예매하기">
    </form>

    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>

<%
    }
%>
</body>
</html>
