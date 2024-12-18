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
     
     
    	
    	
%>

    <h1>영화 예약 시스템</h1>

    <form action="reservation.do" method="post">
        <label for="customer_id">고객 ID:</label>
        <input type="text" id="customer_id" name="customer_id"
             >
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
        <select id="theater_id" name="theater_id" required>
        </select>
        <br><br>

        <label for="hall">관 선택:</label>
        <select id="hall" name="hall" required>
            <option value="1관">1관</option>
            <option value="2관">2관</option>
            <option value="3관">3관</option>
            <option value="4관">4관</option>
            <option value="5관">5관</option>
            <!-- 추가 관 목록 -->
        </select>
        <br><br>

        <label for="date">날짜 선택:</label>
        <input type="date" id="date" name="date" required>
        <br><br>

        <label for="time">시간 선택:</label>
        <select id="time" name="time" required>
            <option value="10:00">10:00</option>
            <option value="12:00">12:00</option>
            <option value="14:00">14:00</option>
            <option value="16:00">16:00</option>
            <option value="18:00">18:00</option>
            <!-- 추가 시간 목록 -->
        </select>
        <br><br>

        <input type="submit" value="예매하기">
    </form>


</body>
</html>