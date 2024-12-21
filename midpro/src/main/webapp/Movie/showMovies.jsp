<%@page import="Vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 검색 결과</title>
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
    
    h1, h3, p {
    	color: white;
    	text-align: center;
    }
    
    .moiveResult {
		display: flex; /* Flexbox 활성화 */
        flex-direction: column; /* 세로로 정렬 */
        justify-content: center; /* 가로 방향 가운데 정렬 */
        align-items: center; /* 세로 방향 가운데 정렬 */
        margin: 20px 0; /* 요소 간 여백 */
        color: white;
    }
    
    .moiveResult h3 {
        margin: 10px 0; /* 제목 위아래 여백 설정 */
    }

    .moiveResult p {
        margin: 5px 0; /* 개별 문단 위아래 여백 축소 */
    }
    
    .button-container {
        display: flex; /* Flexbox 활성화 */
        justify-content: center; /* 가로 방향으로 가운데 정렬 */
        margin: 20px 0; /* 버튼 위아래 여백 */
        gap: 20px;
    }
    
    .goBack, .goReserve {
    	background-color: white;
        color: black;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    .goBack:hover, .goReserve:hover {
    	font-weight: bold;
        background-color: black;
        color: white;
	}
	
</style>    
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
            <div class="moiveResult">
                <img src="<%= posterPath %>" alt="<%= movie.getMovie_name()%> 포스터" width="200">
                <h3><%= movie.getMovie_name() %></h3>
                <p>개봉 연도: <%= movie.getProduct_year() %></p>
                <p>줄거리: <%= movie.getPlot()%></p>
                
            </div>
    <% 
            }
        }
    %>
	<div class="button-container">
    <a href="main/main.jsp">
    <button class="goBack">돌아가기</button>
	</a>
	
	<a href="RESERVATION/Reservation.jsp">
	</a>
	<button class="goReserve">예매하기</button>
	</div>
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>
