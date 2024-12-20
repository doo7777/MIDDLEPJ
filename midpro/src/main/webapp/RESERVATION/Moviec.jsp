<%@page import="Vo.ScreenVO"%>
<%@page import="Dao.ScreenDaoImpl"%>
<%@page import="Dao.SeatDaoImpl"%>
<%@page import="Vo.SeatVO"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="Dao.ScheduleDaoImpl"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="Dao.TheaterDaoImpl"%>
<%@page import="Vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MovieDaoImpl"%>
<%@page import="Vo.CustomerVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화 예약 시스템</title>
</head>
<body>
			<%@ include file="/main/Top.jsp" %>

    <h1>영화 예약 시스템</h1>

   <form action="<%= request.getContextPath() %>/reservation.do" method="post">
        <!-- 고객 ID -->
        <label for="customer_id">고객 ID:</label>
        <input type="text" id="customer_id" name="customer_id" 
               value="<%= result.getCustomer_id() %>" readonly>
        <br><br>
        <hr><br>
        <label for="movie_name">영화 선택:</label>
        <select id="movie_name" name="movie_name" required>
        <%
            for(MovieVO movie : movieList){
        %>
         <option value="<%= movie.getMovie_name() %>"><%= movie.getMovie_name() %></option>
        <%
            }
        %>
        </select>
        <br><br>
         <!--///////////// 지점(지역)선택 /////////////////-->
         <label for="theater_id">지역 :</label>
        <select id="theater_id" name="theater_id"   required>
              <%
        if (theaterList != null) {
            for (TheaterVO theater : theaterList) {
    %>
                <option value="<%= theater.getTheater_id() %>">
                    <%= theater.getTheater_do() %>
                </option>
    <%
            }
        } else {
    %>
            <option value="">선택된 지역은 없습니다.</option>
    <%
        }
    %>
        </select>
        <br><br>   
        
         <!--///////////// 상영관선택 /////////////////-->
        <label for="theater_id">지점 선택:</label>
        <select id="theater_id" name="theater_id"   required>
              <%
        if (theaterList != null) {
            for (TheaterVO theater : theaterList) {
    %>
                <option value="<%= theater.getTheater_id() %>">
                    <%= theater.getTheater_name() %>
                </option>
    <%
            }
        } else {
    %>
            <option value="">등록된 극장이 없습니다</option>
    <%
        }
    %>
        </select>
      <br><br>
           <!--///////////// 날짜선택 /////////////////-->
  <label for="schedule_id">날짜 선택:</label>
<select id="schedule_id" name="schedule_id" required>
    <%
    if (schedulelList != null) {
        for (ScheduleVO schedule : schedulelList) {
    %>
        <option value="<%= schedule.getSchedule_id() %>">
           <%= schedule.getSchedule_date() %>
        </option>
    <%
        }
    } else {
    %>
        <option value="">등록된 일정이 없습니다</option>
    <%
    }
    %>
</select>
<br><br>
   <!--///////////// 상영관(시간) /////////////////-->
  <label for="schedule_id">상영시간:</label>
<select id="schedule_id" name="schedule_id" required>
    <%
    if (schedulelList != null) {
        for (ScheduleVO schedule : schedulelList) {
    %>
        <option value="<%= schedule.getSchedule_id() %>">
           <%= schedule.getStart_time() %> - <%= schedule.getEnd_time() %>
        </option>
    <%
        }
    } else {
    %>
        <option value="">등록된 일정이 없습니다</option>
    <%
    }
    %>
</select>
<br><br>

<label for ="screen_id">상영관</label>
<select id = "screen_id" name="screen_id" required>

 <%
    if (screenList != null) {
        for (ScreenVO screen : screenList) {
    %>
        <option value="<%= screen.getScreen_id() %>">
           <%= screen.getScreen_type() %> - <%= screen.getScreen_id() %> 관
        </option>
    <%
        }
    } else {
    %>
        <option value="">등록된 상영관이 없습니다</option>
    <%
    }
    %>
</select>
<br><br>
        <input type="submit" value="예매하기">
    </form>
    


</body>
</html>