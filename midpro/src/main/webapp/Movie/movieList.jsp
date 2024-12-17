<%@page import="Vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 리스트</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>영화 리스트</h1>
    <table>
        <thead>
            <tr>
                <th>영화 번호</th>
                <th>제목</th>
                <th>감독</th>
                <th>장르</th>
                <th>개봉일</th>
            </tr>
        </thead>
        <tbody>
            <%-- 서버에서 전달된 영화 리스트를 출력 --%>
            <%
                List<MovieVO> movieList = (List<MovieVO>) request.getAttribute("movieList");
                if (movieList != null && !movieList.isEmpty()) {
                    for (MovieVO movie : movieList) {
            %>
            <tr>
                <td><a href="<%= request.getContextPath() %>/movieDetail.do?movie_id=<%= movie.getMovie_id() %>"><%= movie.getMovie_id() %></a></td>
                <td><%= movie.getMovie_name() %></td>
                <td><%= movie.getPlot() %></td>
                <td><%= movie.getProduct_year() %></td>
                <td><%= movie.getShow_time() %></td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="5">등록된 영화가 없습니다.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>