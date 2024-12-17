<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 좌석 예매</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f8f9fa;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .seat-selection {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .seat-grid {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-gap: 10px;
            margin: 20px 0;
        }

        .seat {
            width: 50px;
            height: 50px;
            background-color: #e9ecef;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            border-radius: 5px;
        }

        .seat.selected {
            background-color: #28a745;
            color: white;
        }

        .seat.disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }

        .info-box {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .info-box h3 {
            margin-top: 0;
        }

        select, button {
            padding: 8px;
            margin-top: 10px;
            width: 200px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>영화 좌석 예매</h1>

    <!-- 좌석 유형 선택 -->
    <div class="seat-selection">
        <label for="ticketType">티켓 종류:</label>
        <select id="ticketType" name="ticketType">
            <option value="일반">일반</option>
            <option value="청소년">청소년</option>
            <option value="우대">우대</option>
        </select>

        <label for="seatSelection">좌석 선택:</label>
        <div class="seat-grid">
            <%-- 좌석을 A1부터 E20까지 생성 --%>
            <%
                String[] rows = {"A", "B", "C", "D", "E"};
                for (String row : rows) {
                    for (int i = 1; i <= 20; i++) {
            %>
                        <div class="seat" id="<%= row + i %>" onclick="selectSeat('<%= row + i %>')">
                            <%= row + i %>
                        </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <!-- 선택된 정보 표시 -->
    <div class="info-box">
        <h3>선택한 예매 정보</h3>
        <p><strong>티켓 종류:</strong> <span id="ticketTypeDisplay">-</span></p>
        <p><strong>선택 좌석:</strong> <span id="selectedSeatsDisplay">-</span></p>
        <button onclick="confirmBooking()">예매하기</button>
    </div>

</div>

<script>
    // 좌석 선택
    let selectedSeats = [];
    let ticketType = document.getElementById('ticketType');
    
    // 좌석 클릭 이벤트 처리
    function selectSeat(seatId) {
        const seat = document.getElementById(seatId);

        // 이미 선택된 좌석을 클릭하면 선택 해제
        if (seat.classList.contains('selected')) {
            seat.classList.remove('selected');
            selectedSeats = selectedSeats.filter(item => item !== seatId);
        } else {
            // 좌석이 선택된 경우
            seat.classList.add('selected');
            selectedSeats.push(seatId);
        }
        updateSelectedInfo();
    }

    // 선택된 티켓 종류와 좌석 정보를 업데이트
    function updateSelectedInfo() {
        document.getElementById('ticketTypeDisplay').textContent = ticketType.value;
        document.getElementById('selectedSeatsDisplay').textContent = selectedSeats.join(", ") || "-";
    }

    // 예매하기 버튼 클릭 시
    function confirmBooking() {
        if (selectedSeats.length === 0) {
            alert("좌석을 선택해주세요.");
        } else {
            alert("예매가 완료되었습니다.\n선택한 좌석: " + selectedSeats.join(", ") + "\n티켓 종류: " + ticketType.value);
        }
    }
</script>

</body>
</html>
