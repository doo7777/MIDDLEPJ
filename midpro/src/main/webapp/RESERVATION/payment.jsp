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
   
   .main-container {
    max-width: 1000px; /* 전체 콘텐츠 너비 제한 */
    height: auto; 
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px; /* 여백 추가 */
    box-sizing: border-box; /* 패딩이 크기에 영향을 미치지 않도록 설정 */
    display: flex;
    flex-direction: column; /* 세로 정렬 설정 */
    align-items: center; /* 중앙 정렬 */
    
   }
   
   
   /* 장바구니 테이블 */
   .cart-table {
       width: 100%;
       border-collapse: collapse;
       margin-bottom: 20px;
   }

   .cart-table th, .cart-table td {
       border-bottom: 1px solid #ddd;
       text-align: center;
       padding: 10px;
       font-size: 14px;
   }

   .cart-table th {
       background-color: #f9f9f9;
   }
   

   .product-info {
       display: flex;
       align-items: center;
       color: white;
   }
   
   .product-info img {
       width: 80px;
       /*margin-right: 100px;*/
   }

   .product-details .product-name {
       font-weight: bold;
       font-size: 16px;
   }

   .product-details .product-desc {
       font-size: 12px;
       color: #777;
   }

   .price {
       font-weight: bold;
       color: white;
   }

   .original-price {
       text-decoration: line-through;
       color: #bbb;
       font-size: 12px;
   }

   .quantity {
       color: white;
   }

   .total-price {
       font-weight: bold;
       color: white;
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
       width: 20%;
       height: auto;
       justify-content: center;
       align-items: center;
       z-index: 9999; /* 다른 요소 위에 표시 */
        background-color: white;
        border: .20em dashed black;
        
   }
   
   .modal-content {
       width: 100%;
       height: 100%;
       text-align: center;
       position: relative;
        border-style: hidden;
   }
   
   .close-button {
       position: absolute;
       top: 10px;
       right: 10px;
       font-size: 20px;
       font-weight: bold;
       color: white;
       cursor: pointer;
   }

    .applyCode1 {
        background-color: black;
        color:white;
        height: 30px;
        text-align: center;
        font-weight: bold;
    }

    .applyCode2, .applyCode3 {
        border-style: hidden;
        margin-top: 20px;
    }

    .applyBtn2, .applyCloseBtn {
        background-color: black;
        color: white;
    }

</style>
</head>
<body>
   <%@ include file="/main/Top.jsp" %>
   <div class="main-container">
        <!-- 장바구니 리스트 -->
        <table class="cart-table">
            <thead>
                <h3>구매상품 정보</h3><br>
                <tr>
                    <th>상품정보</th>
                    <th>판매가</th>
                    <th>수량</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="product-info">
                        <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/나랑-너-패키지.jpg" alt="나랑 너 패키지" />
                        <div class="product-details">
                            <p class="product-name">상품명</p>
                            <p class="product-desc">상품정보</p>
                        </div>
                    </td>
                    <td>
                        <p class="price">할인된금액</p>
                        <p class="original-price">기존금액</p>
                    </td>
                    <td>
                        <p class="quantity">수량</p>
                    </td>
                    <td class="total-price">합계</td>
                </tr>
            </tbody>
        </table>
    </div>    
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
                            <p id="ticket-info">선택한 관람권/기프트콘 정보를 확인하려면 왼쪽에서 선택하세요.</p>
                            
                            <!-- 모달창 -->
                      <div id="modal" class="modal">
                          <div class="modal-content">
                              <span class="close-button">&times;</span>
                                        <div class="applyCode1">
                                            DGV 기프트콘 등록하기
                                        </div>
                                        <div class="applyCode2">
                                            <p>소지하고 계신 DGV 기프트콘 번호를 입력해 주세요.</p>
                                            기프트콘 번호: <input type="text" id="searchCode">
                                        </div>
                                        <div class="applyCode3">
                                            <button class="applyBtn2">등록하기</button>
                                            <button class="applyCloseBtn">닫기</button>
                                        </div>
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
    const applyCloseBtn = document.querySelector('.applyCloseBtn');

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
    
    // 닫기 버튼 클릭 시 모달 닫기
    applyCloseBtn.addEventListener('click', () => {
        modal.style.display = 'none';
    });
</script>
</html>