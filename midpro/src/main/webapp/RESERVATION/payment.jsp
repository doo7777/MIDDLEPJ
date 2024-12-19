<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
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

   div {
       border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
   }
   
   .paymentStep {
    max-width: 1000px; /* 전체 콘텐츠 너비 제한 */
    height: 600px; /* 높이를 고정하여 처음에 크게 보이도록 설정 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px; /* 여백 추가 */
    box-sizing: border-box; /* 패딩이 크기에 영향을 미치지 않도록 설정 */
    display: flex;
	}

    .left {
    flex: 5;
    }
	
    /* STEP1 관람권/기프티콘 */
    input[id*="upperMenu"] {
        display: none;
    }
    input[id*="upperMenu"] + label {
        display: block;
        padding: 10px;
        border: 1px solid;
        border-bottom: 0;
        color: white;
        font-weight: bold;
        background: black;
        cursor: pointer;
    }
    input[id*="upperMenu"] + label + div {
        max-height: 0;
        transition: max-height 0.35s ease-in-out;
        overflow: hidden;
    }
    input[id*="upperMenu"]:checked + label + div {
        max-height: 500px;
    }

    /* Flexbox 스타일 */
    .ticket-container {
        display: flex;
        justify-content: space-between;
        align-items: stretch;
        gap: 20px;
        padding: 10px; 
    }

    /* 관람권,기프티콘 선택 부분*/
    .ticket-selection {
        flex: 1;
        max-width: 40%;
        border: 1px solid #ddd;
        padding: 10px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    ul {
        padding: 0;
        margin: 0;
    }

    li {
        list-style-type: none;
        margin: 5px 0;
    }

    input[type="radio"][name="ticket"] {
        display: none;
    }

    input[type="radio"][name="payment"] {
        display: inline-block;
    }


    label {
        display: block;
        padding: 10px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        justify-content: space-between; /* 좌측 텍스트와 우측 화살표 구분 */
    }
    
    label i {
    font-size: 1.2em; /* 화살표 크기 */
    margin-left: auto;
	}

    input[type="radio"][name="ticket"] + label:hover {
        background-color: black;
        color: white;
    }

    input[type="radio"][name="ticket"]:checked + label {
        background-color: black;
        font-weight: bold;
        color: white;
    }

    /* 관람권,기프티콘 결과창*/
    .ticket-display {
        position: relative;
        flex: 2;
        border: 1px solid #ddd;
        padding: 10px;
        background-color: #fff;
        border-radius: 5px;
    }

    .applyBtn {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: black;
        color: white;
        cursor: pointer;
    }
    table {
        width: 100%; /* ticket-display의 폭에 맞춤 */
        border-collapse: collapse; /*셀 간격 제거*/
        table-layout: fixed; /* 고정된 테이블 레이아웃 */
    }

    th, td {
        text-align: left;
        padding: 15px; /* 각 셀 간격 추가 */
    }

    h3 {
        text-align: center;
    }
    
    .payment-container {
    	background-color: white;
    	flex: 1;
        max-width: 100%;
        border: 1px solid #ddd;
        gap: 20px;
        padding: 10px;
        border-radius: 5px;
        height: 30%;
    }

    input[type="radio"][name="payment"], label[for="qrcode"] {
        display: inline-block; /* 라디오 버튼과 라벨을 한 줄에 표시 */
        vertical-align: middle; /* 세로 정렬을 맞춤 */
    }

    .price-container {
        background-color: black;
        width: 30%;
        flex: 1;
        padding: 5px;
    }

    .price-container .priceTable {
    	margin-bottom: 20px; /* 테이블 사이에 간격 추가 */
    }

    .priceTable {
    	border: 1px solid white;
    }
    
    .priceTable th {
        background-color: black;
        border: 1px solid white;
        color: white;
    }

    .priceTable td {
        color: white;
        border: 1px solid white; 
    }

    .payBtn {
        background-color: white;
        color: black;
        padding: 15px 30px;
        width: 100%;  /* 너비를 100%로 설정하여 가로 폭 전체를 사용 */
	    border: none;  /* 테두리 제거 */
	    cursor: pointer;
	    font-weight: bold;
    }
    
    .modal {
	    display: none; /* 초기에는 숨김 */
	    position: fixed;
	    top: 50%; /* 화면 세로 중앙 */
   		left: 50%; /* 화면 가로 중앙 */
	    transform: translate(-50%, -50%); /* 화면 중심으로 이동 */
	    width: 50%;
	    height: 50%;
	    justify-content: center;
	    align-items: center;
	    z-index: 9999; /* 다른 요소 위에 표시 */
	}
	
	.modal-content {
	    background-color: white;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	    position: relative;
	}
	
	.close-button {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    font-size: 20px;
	    font-weight: bold;
	    color: black;
	    cursor: pointer;
	}

</style>
</head>
<body>
	<%@ include file="/main/Top.jsp" %>
    <div class="paymentStep">
        <div class="left">
            <div class="left-container">
                <input type="checkbox" id="upperMenu1">
                <label for="upperMenu1">관람권/기프트콘 <i class="fa-solid fa-angle-down"></i></label>
                <div>
                    <div class="ticket-container">
                        <!-- 왼쪽: 관람권 선택 -->
                        <div class="ticket-selection">
                            <h3>보유한 관람권</h3>
                            <ul>
                                <li>
                                    <input type="radio" id="ticket1" name="ticket" value="ticket1">
                                    <label for="ticket1">DGV 영화관람권</label>
                                </li>
                                <li>
                                    <input type="radio" id="ticket2" name="ticket" value="ticket2">
                                    <label for="ticket2">DGV 기프트카드</label>
                                </li>
                            </ul>
                        </div>

                        <!-- 오른쪽: 조회창 -->
                        <div class="ticket-display">
                            <h3>관람권 조회 결과</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>사용가능 관람권</th>
                                        <th>관람권 번호</th>
                                        <th>유효기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                </tbody>
                            </table>
                            <button class="applyBtn">등록하기</button>
                            <p id="ticket-info">선택한 관람권/기프티콘 정보를 확인하려면 왼쪽에서 선택하세요.</p>
                            
                            <!-- 모달창 -->
						    <div id="modal" class="modal">
						        <div class="modal-content">
						            <span class="close-button">&times;</span>
						            <p>내용내용내용</p>
						        </div>
						    </div>
                        </div>
                    </div>
                </div>
                <!-- 결제수단 메뉴 -->
                <input type="checkbox" id="upperMenu2">
                <label for="upperMenu2">결제수단 <i class="fa-solid fa-angle-down"></i></label>
                <div>
                    <div class="payment-container">
                    <input type="radio" id="qrcode" name="payment" value="qrcode">
                    <label for="qrcode">QR코드</label>
                    </div>
                </div>
            </div>    
        </div>

        <div class="price-container">
            <div class="priceTable ticketPrice">
                <table>
                    <thead>
                        <tr>
                            <th>결제할 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>원</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="priceTable discountPrice">
                <table>
                    <thead>
                        <tr>
                            <th>할인금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>원</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="priceTable totaltPrice">
                <table>
                    <thead>
                        <tr>
                            <th>총 결제금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>원</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button class="payBtn">결제하기</button>
        </div>

    </div>
	<%@ include file="/main/Bottom.jsp" %>
</body>
<script>
    const tickets = document.querySelectorAll('input[name="ticket"]');
    const ticketInfo = document.getElementById('ticket-info');

    //관람권, 기프티콘 선택
    tickets.forEach(ticket => {
        ticket.addEventListener('change', () => {
            //선택한 항목에 따라 조회 결과
            switch (ticket.value) {
                case 'ticket1' :
                    ticketInfo.textContent = "DGV 영화관람권"; break;
                case 'ticket2' :
                    ticketInfo.textContent = "DGV 기프트카드"; break;
                default:
                    ticketInfo.textContent = "선택한 관람권/기프티콘 정보를 확인하려면 왼쪽에서 선택하세요."    
            }
        });
    });
    
    
 	// 모달 요소와 버튼 가져오기
    const modal = document.getElementById('modal');
    const registerButton = document.querySelector('.applyBtn');
    const closeBtn = document.querySelector('.close-button');

    // 등록하기 버튼 클릭 시 모달 열기
    registerButton.addEventListener('click', () => {
        modal.style.display = 'flex'; // Flexbox로 표시
    });

    // 닫기 버튼 클릭 시 모달 닫기
    closeBtn.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>
</html>
