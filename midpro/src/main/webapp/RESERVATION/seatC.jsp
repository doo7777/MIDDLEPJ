<%@page import="Vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
</head>
<body>
<h1>좌석 선택</h1>

<%
    // SeatList 서블릿에서 전달된 좌석 목록
    List<SeatVO> seatList = (List<SeatVO>) request.getAttribute("seatList");
    int reservation_id = Integer.parseInt(request.getAttribute("reservation_id").toString());
%>

<form action="reservation.do" method="post">

	<input type="text" name="reservation_id" value="<%=reservation_id%>" />
	

    <label for="seatList">좌석 선택:</label>
<%--     <%=seatList %>~~~~ --%>
    <select id="seatList" name="seatList" required>
    
        <%
        if (seatList != null && !seatList.isEmpty()) {
            for (SeatVO seat : seatList) {
        %>

        			   <option value="<%= seat.getScreen_id() %>">

                    <%= seat.getSeat_no() %>열 - <%= seat.getSeat_line_no() %>석
                </option>
        <%
            }
        } else {
        %>
            <option value="">등록된 좌석이 없습니다!!</option>
        <%
        }
        %>
    </select>
    <br><br>
    <input type="submit" value="결제 하기">
</form>

</body>
</html>
