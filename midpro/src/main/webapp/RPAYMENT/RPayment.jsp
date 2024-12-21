<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="Vo.ReservationVO"%>
<%@page import="Dao.ReservationDaoImpl"%>
<%@page import="Service.PaymentServiceImpl"%>
<%@page import="ServiceInterface.IPaymentService"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>결제 창</title>
</head>
<body>
    <h1>결제 정보 입력</h1>
    
    <%
        // 예약 정보 가져오기 (세션 또는 요청 파라미터에서)
        
        ReservationVO reservation = (ReservationVO) request.getAttribute("reservationVO");
     System.out.println(reservation);
    
        if (reservation == null) {
            out.println("<script>alert('예약 정보가 없습니다.'); history.back();</script>");
            return;
        }
        int reservationId = reservation.getReservation_id(); // 예약 ID
    %>

    <form action="<%= request.getContextPath() %>/payment.do" method="post">
        <input type="hidden" name="reservation_id" value="<%= reservationId %>">
        
        <label for="payment_method">결제 방법:</label>
        <select id="payment_method" name="payment_method" required>
            <option value="신용카드">신용카드</option>
            <option value="계좌이체">계좌이체</option>
            <option value="휴대폰결제">휴대폰결제</option>
        </select>
        <br><br>

        <label for="payment_price">결제 금액:</label>
        <input type="number" id="payment_price" name="payment_price" required>
        <br><br>

        <label for="payment_status">결제 상태:</label>
        <select id="payment_status" name="payment_status" required>
            <option value="완료">완료</option>
            <option value="대기">대기</option>
            <option value="실패">실패</option>
        </select>
        <br><br>

        <input type="submit" value="결제하기">
    </form>
</body>