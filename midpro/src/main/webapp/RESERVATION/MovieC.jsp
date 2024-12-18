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
<%
  
    CustomerVO loginSession2 = (CustomerVO) session.getAttribute("ok");

   
%>
    
<%
       //영화 목록을 가져오기 위한 DAO객체 생성하셈
     MovieDaoImpl movieDao = MovieDaoImpl.getInstance(); //싱글톤 패턴사용
     
     List<MovieVO> movieList = movieDao.getAllMovie(); // 영화 전체 목록조회
     
     TheaterDaoImpl theaterDao = TheaterDaoImpl.getInstance();
     
     List<TheaterVO> theaterList = theaterDao.getAllTheater(); // 영화관 전체 목록조회
     
     ScheduleDaoImpl scheduleDao = ScheduleDaoImpl.getInstance();
     
     List<ScheduleVO> schedulelList = scheduleDao.getAllSchedule(); //일정 전체 조회
    
     
     
     
       
       
%>

    <h1>영화 예약 시스템</h1>

   <form action="<%= request.getContextPath() %>/reservation.do" method="post">
        <!-- 고객 ID -->
        <label for="customer_id">고객 ID:</label>
        <input type="text" id="customer_id" name="customer_id" 
               value="<%= loginSession2.getCustomer_id() %>" readonly>
        <br><br>
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

        <label for="theater_id">극장 선택:</label>
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
     
        <label for="hall">관 선택:</label>
        <select id="hall" name="hall" required>

            <!-- 추가 관 목록 -->
        </select>
        <br><br>

        
      <label for="schedule_id">일정 선택:</label>
<select id="schedule_id" name="schedule_id" required>
    <%
    if (schedulelList != null) {
        for (ScheduleVO schedule : schedulelList) {
    %>
        <option value="<%= schedule.getSchedule_id()%>">
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
  
        <label for="schedule_start">시간 선택:</label>
        <select id="time" name="time" required>
                    <%
        if (schedulelList != null) {
            for (ScheduleVO schedule : schedulelList) {
    %>
                <option value="<%= schedule.getSchedule_id() %>">
                    <%= schedule.getStart_time() %>
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

        <input type="submit" value="예매하기">
    </form>


</body>
</html>