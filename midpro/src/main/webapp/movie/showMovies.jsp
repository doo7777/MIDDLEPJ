<%@page import="Vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 검색 결과</title>
</head>
<body>
    <%@ include file="/main/Top.jsp" %> <!-- 상단 메뉴 포함 (필요시) -->

    <h1>검색 결과</h1>
    
    <% 
  	    List<MovieVO> movieList2 = (List<MovieVO>) request.getAttribute("movieList");
        if (movieList2 == null || movieList2.isEmpty()) {
    %>
        <p>검색 결과가 없습니다.</p>
    <% 
        } else {
            // 검색된 영화 리스트가 존재할 경우 출력
            for (MovieVO movie : movieList2) {
            	String posterPath = request.getContextPath()+"/main/sorce/img/영화포스터/" + movie.getMovie_name() + ".jpg";  

    %>
            <div>
                <img src="<%= posterPath %>" alt="<%= movie.getMovie_name()%> 포스터" width="200">
                <h3><%= movie.getMovie_name() %></h3>
                <p>개봉 연도: <%= movie.getProduct_year() %></p>
                <p>줄거리: <%= movie.getPlot()%></p>
                
            </div>
    <% 
            }
        }
    %>

    <a href="main/main.jsp">돌아가기</a>
</body>
</html>
