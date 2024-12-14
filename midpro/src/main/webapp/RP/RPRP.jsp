<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Payment</title>
</head>
<body>

<h2>Reservation Payment Form</h2>

<!-- 예약 정보 입력 폼 -->
<form action="ReservationPaymentServlet" method="POST">
    <table>
        <tr>
            <td><label for="customer_id">Customer ID:</label></td>
            <td><input type="text" id="customer_id" name="customer_id" required /></td>
        </tr>
        <tr>
            <td><label for="ticket_id">Ticket ID:</label></td>
            <td><input type="number" id="ticket_id" name="ticket_id" required /></td>
        </tr>
        <tr>
            <td><label for="movie_name">Movie Name:</label></td>
            <td><input type="text" id="movie_name" name="movie_name" required /></td>
        </tr>
        <tr>
            <td><label for="schedule_id">Schedule ID:</label></td>
            <td><input type="number" id="schedule_id" name="schedule_id" required /></td>
        </tr>
        <tr>
            <td><label for="screen_id">Screen ID:</label></td>
            <td><input type="number" id="screen_id" name="screen_id" required /></td>
        </tr>
        <tr>
            <td><label for="cust_grade">Customer Grade:</label></td>
            <td><input type="text" id="cust_grade" name="cust_grade" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_date">Reservation Pay Date:</label></td>
            <td><input type="date" id="res_pay_date" name="res_pay_date" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_movie_name">Movie Name (Reservation):</label></td>
            <td><input type="text" id="res_pay_movie_name" name="res_pay_movie_name" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_showtimes">Showtimes:</label></td>
            <td><input type="text" id="res_pay_showtimes" name="res_pay_showtimes" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_theater_name">Theater Name:</label></td>
            <td><input type="text" id="res_pay_theater_name" name="res_pay_theater_name" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_seats">Seats:</label></td>
            <td><input type="text" id="res_pay_seats" name="res_pay_seats" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_pnumber">Number of Persons:</label></td>
            <td><input type="number" id="res_pay_pnumber" name="res_pay_pnumber" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_ticketprice">Ticket Price:</label></td>
            <td><input type="number" id="res_pay_ticketprice" name="res_pay_ticketprice" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_method">Payment Method:</label></td>
            <td><input type="text" id="res_pay_method" name="res_pay_method" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_telnum">Phone Number:</label></td>
            <td><input type="text" id="res_pay_telnum" name="res_pay_telnum" /></td>
        </tr>
        <tr>
            <td><label for="res_pay_write_date">Write Date:</label></td>
            <td><input type="date" id="res_pay_write_date" name="res_pay_write_date" /></td>
        </tr>
        <tr>
            <td><label for="movie_name2">Additional Movie Name:</label></td>
            <td><input type="text" id="movie_name2" name="movie_name2" required /></td>
        </tr>
    </table>
    <input type="submit" value="Submit Reservation Payment" />
</form>

</body>
</html>