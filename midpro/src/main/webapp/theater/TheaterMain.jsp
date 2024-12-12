<%@page import="Vo.TheaterVO"%>
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
	  border: 3px solid;
	  width: 50%;
	  margin: auto;
	}
</style>
</head>
<body>
	<h2>영화관 정보</h2>
	<table>
		<thead>
		<tr>
			<th>지점ID</th>
			<th>사진</th>
			<th>영화관명</th>
			<th>주소</th>
		</tr>
		</thead>
		<tbody>
		<% 
            List<TheaterVO> thea = (List<TheaterVO>) request.getAttribute("thea");
            if (thea != null) {
                for (TheaterVO tList : thea) {
        %>
        <tr>
        	<td><%=tList.getTheater_id() %></td>
        	<td><img src="<%=tList.getTheater_img() %>" alt="영화관이미지"></td>
        	<td><%=tList.getTheater_name() %></td>
        	<td><%=tList.getTheater_address() %></td>
        </tr>
         <% 
                }
            } else {
        %>
        <tr>
            <td colspan="4">등록된 영화관 정보가 없습니다.</td>
        </tr>
        <% 
            }
        %>  
		</tbody>
	</table>
</body>
</html>