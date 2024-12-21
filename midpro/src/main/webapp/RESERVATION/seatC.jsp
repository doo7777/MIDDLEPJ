<%@page import="Dao.ReservationDaoImpl"%>
<%@page import="Service.ReservationServiceImpl"%>
<%@page import="ServiceInterface.IReservationService"%>
<%@page import="Vo.ReservationVO"%>
<%@page import="Vo.SeatVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
    <script>
    let priceElement = "";
    window.onload = function(){
       
       priceElement = document.getElementById("data-price");
    }
    
    function updatePrice() {
        const seatList = document.getElementById("seatList");
        const selectedOption = seatList.options[seatList.selectedIndex];
        const price = selectedOption.getAttribute("data-price");
        
        console.log("Selected option:", selectedOption); // 선택된 옵션 요소 확인
        console.log("Price attribute:", price); // data-price 속성 값 확인

//         const priceElement = document.getElementById("data-price");
        console.log("Price element before update:", priceElement.innerText);

        if (price) {
            priceElement.innerText = `가격: ${price}원`;
        } else {
            priceElement.innerText = "가격 정보를 불러올 수 없습니다.";
        }

        console.log("Price element after update:", priceElement.innerText);
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
    <input type="" name="reservation_id" value="<%= reservation_id %>" />

    <label for="seatList">좌석 선택:</label>
    <select id="seatList" name="seat_id" onchange="updatePrice()" multiple required>
        <%
        if (seatList != null && !seatList.isEmpty()) {
            for (SeatVO seat : seatList) {
        %>
                <option value="<%= seat.getSeat_id() %>" data-price="<%= seat.getSeat_price() %>">
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
    <script>
    document.querySelector('#seatList').addEventListener('change',function(){
       const opts = document.querySelectorAll('#seatList option');
       let sum = 0;
       for(let i=0; i<opts.length; i++){
          if(opts[i].selected){
             //선택되어 들어오는 항목의 
             sum += parseInt(opts[i].dataset.price);
             priceElement.innerText = "";
             priceElement.innerText += `가격: \${sum}원`;
          }
       }
    })
    </script>
    <p id="data-price"> 가격:  좌석을 선택해주세요.</p>
    <br><br>
    <br>
    <input type="submit" value="결제 하기">
</form>

</body>
</html>
