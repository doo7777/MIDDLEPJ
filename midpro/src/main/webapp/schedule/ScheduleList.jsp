<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
	  width: 50%;
	  margin: 20px auto;	  
	}
	th, td {
	  padding: 10px;
	  text-align: center;
	  border: 1px solid black;
	}
	th {
	  background-color: lightgrey;
	}
</style>
</head>

<body>
	<h2>상영스케줄</h2>
	<table>
	<thead>
	<tr>
		<th>영화제목</th>
		<th>지역</th>
		<th>지점</th>
		<th>상영관</th>
		<th>날짜</th>
		<th>시작시간</th>
	</tr>
	</thead>
	
	
	<tbody>
	 
	<%
		List<ScheduleVO> scd = (List<ScheduleVO>) request.getAttribute("scd");
		if (scd != null){
			for (ScheduleVO scdList : scd){
	%>
	<tr>
		<td><%= scdList.getMovie_name() %></td>			
		<td><%= scdList.getTheater_do() %></td>			
		<td><%= scdList.getTheater_name() %></td>			
		<td><%= scdList.getScreen_name() %></td>			
		<td><%= scdList.getSchedule_date() %></td>
		<td><%= scdList.getStart_time() %></td>			
	</tr>				
	<%			
			}
		}	
	%>	
	
	</tbody>	
	</table>
</body> 



</html>