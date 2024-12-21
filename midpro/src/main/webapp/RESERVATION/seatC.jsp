<%@page import="Vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
    <%@ include file="/main/Top.jsp" %>
    
    <script type="text/javascript">
    
        // 페이지가 로드되면 실행되는 함수
        function updatePrice() {
            var seatSelect = document.getElementById("seatList");
            var priceDisplay = document.getElementById("priceDisplay");

            // 선택된 좌석의 value 값
            var selectedSeatId = seatSelect.value;

            // 좌석의 가격을 찾고 표시
            if (selectedSeatId !== "") {
                var price = seatPrices[selectedSeatId];
                priceDisplay.innerHTML = "선택한 좌석의 가격: " + price + "원";
            } else {
                priceDisplay.innerHTML = "좌석을 선택하세요.";
            }
        }

    </script>
</head>
<body>
<h1>좌석 선택</h1>

<%
    // SeatList 서블릿에서 전달된 좌석 목록
    List<SeatVO> seatList = (List<SeatVO>) request.getAttribute("seatList");
    int reservation_id = Integer.parseInt(request.getAttribute("reservation_id").toString());
%>

<form action="reservation.do" method="post">

    <input type="text" name="reservation_id" value="<%=reservation_id%>" hidden />

    <label for="seatList">좌석 선택:</label>
    <select id="seatList" name="seatList" required onchange="updatePrice()">
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

    <div id="priceDisplay">좌석을 선택하세요.</div>

    <br><br>
    <input type="submit" value="결제 하기">
</form>

</body>
</html>