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
    <h1>영화 예매 시스템</h1>

    <form action="selectSeats.jsp" method="post">
        <label for="movie">영화 선택:</label>
        <select id="movie" name="movie">
            <%
                SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
                try (SqlSession session = sqlSessionFactory.openSession()) {
                    MovieMapper mapper = session.getMapper(MovieMapper.class);
                    List<Movie> movies = mapper.getAllMovies();
                    for (Movie movie : movies) {
            %>
                <option value="<%= movie.getTitle() %>"><%= movie.getTitle() %></option>
            <%
                    }
                }
            %>
        </select>
        <br><br>

        <label for="theater">극장 선택:</label>
        <select id="theater" name="theater" onchange="updateHalls()">
            <%
                try (SqlSession session = sqlSessionFactory.openSession()) {
                    List<Theater> theaters = mapper.getAllTheaters();
                    for (Theater theater : theaters) {
            %>
                <option value="<%= theater.getId() %>"><%= theater.getName() %></option>
            <%
                    }
                }
            %>
        </select>
        <br><br>

        <label for="hall">관 선택:</label>
        <select id="hall" name="hall">
            <option value="1관">1관</option>
            <option value="2관">2관</option>
            <option value="3관">3관</option>
        </select>
        <br><br>

        <label for="date">날짜 선택:</label>
        <input type="date" id="date" name="date">
        <br><br>

        <label for="time">시간 선택:</label>
        <select id="time" name="time">
            <option value="10:00">10:00</option>
            <option value="12:00">12:00</option>
            <option value="14:00">14:00</option>
            <option value="16:00">16:00</option>
            <option value="18:00">18:00</option>
        </select>
        <br><br>

        <input type="submit" value="좌석 선택">
    </form>

    <script>
        function updateHalls() {
            // 선택된 극장에 따라 관 목록을 동적으로 업데이트하는 로직을 추가할 수 있습니다.
            // AJAX를 통해 관 목록을 받아오는 기능을 구현합니다.
        }
    </script>
</body>
</html>