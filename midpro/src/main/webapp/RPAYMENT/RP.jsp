<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
HttpSession session = request.getSession();
String cutomerId =(String)session.getAttribute("customerId"); //세션에서 고객정보 가져옴
List<String>movieList = Util.getMovieList();
if (customerId == null) {
    response.sendRedirect("login.jsp"); // 고객 ID가 없으면 로그인 페이지로 리다이렉트
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>예매 결제</title>
</head>
<body>
    <h2>예매 결제</h2>
    <p>고객 ID: <%= customerId %></p> <!-- 고객 ID 표시 -->

    <form action="<%= request.getContextPath() %>/reservationPayment.do" method="post">
        영화 이름: 
        <select name="movieName" required>
            <option value="">영화 선택</option>
            <%
                for (String movie : movieList) {
            %>
                <option value="<%= movie %>"><%= movie %></option>
            <%
                }
            %>
        </select><br>
        스케줄 ID: <input type="number" name="scheduleId" required><br>
        상영관 ID: <input type="number" name="screenId" required><br>
        고객 등급: <input type="text" name="custGrade"><br>
        예매 날짜: <input type="date" name="reservPayDate"><br>
        예매 좌석: <input type="text" name="reservPaySeats"><br>
        예매 인원: <input type="number" name="reservPayPNumber"><br>
        티켓 가격: <input type="number" name="reservPayTicketPrice"><br>
        결제 방법: <input type="text" name="reservPayMethod"><br>
        전화번호: <input type="text" name="reservPayTelNum"><br>
        <input type="hidden" name="customerId" value="<%= customerId %>"> <!-- 고객 ID를 숨겨진 필드로 추가 -->
        <input type="submit" value="결제하기">
    </form>
</body>
</html>