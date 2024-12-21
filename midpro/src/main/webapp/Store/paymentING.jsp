<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <title>DGV</title> <!-- 문서 제목 -->
    <style>
        /* 전체 화면 사이즈 */
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

        /* 회사소개 */
        #company {
			height: 150px; /* 회사 정보 영역의 높이 설정 */
			color: white;
	
			margin: 0; /* 기본 여백 제거 */
			margin-top: 50px; /* 위쪽 여백 */
			text-align: center;
			overflow: hidden; /* 내용이 잘리도록 설정 */
			position: absolute; /* 절대 위치 설정 */
			transform: translateX(100%);
		}

      

        /* 결제하기 */
        /* 상단 단계 표시 */
        .step-header {
            display: flex;
            justify-content: center;
            margin: 30px 0;
            margin-bottom: 20px;
        }

        .step-header span {
            margin: 0 70px;
            text-align: center;
            font-size: 14px;
            color: #aaa;
        }

        .step-header .active {
            color: #e6007e;
            font-weight: bold;
        }

        /* 메인 컨테이너 */
        .main-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto; /* 양쪽 여백 */
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
            padding: 15px;
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
            margin-right: 100px;
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

        /* 결제 정보 */
        .payment-info {
            border-top: 2px solid #333;
            padding-top: 20px;
            margin-bottom: 80px;
            color: white;
        }

        .payment-item {
            display: flex;
            justify-content: space-between;
            font-size: 16px;
            margin: 5px 0;
        }

        .payment-item .amount {
            font-weight: bold;
        }

        .payment-item.total .total-amount {
            color: #e6007e;
        }

        /* 섹션 공통 */
        section {
            margin-bottom: 30px;
        }

        h3 {
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }

        /* 주문자 정보 */
        .form-row {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        /* 이름 입력 필드 스타일 */
        .name-input {
            width: 35px; /* 이름 입력 필드의 가로 길이 */
            padding: 8px;
            color: white;
            border-radius: 5px;
        }

        /* 휴대전화 입력 필드 스타일 */
        .phone-input {
            width: 100px; /* 휴대전화 입력 필드의 가로 길이 */
            padding: 8px;
            color: white;
            border-radius: 5px;
        }

        .form-row input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            background-color: #f8f8f8;
            color: #777;
            border-radius: 5px;
        }

        .notice-text {
            font-size: 12px;
            color: #777;
            margin-bottom: 30px;
        }

        /* 결제 수단 */
        .payment-options {
            margin-top: 20px;
        }
        
        .payment-options label {
            font-size: 16px;
            font-weight: bold;
            color: white;
        }

        /* 버튼 영역 */
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            color: white;
        }

        .back-btn {
            background-color: #333;
            color: #ddd;
        }

        .pay-btn {
            background-color: #333;
        }

    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
                                  <%@ include file="/Store/StoreTop.jsp" %>
        
    </div>

    <!-- 상단 단계 표시 -->
    <div class="step-header">
        <span>STEP 01<br>장바구니</span>
        <span class="active">STEP 02<br>결제하기</span>
        <span>STEP 03<br>결제완료</span>
    </div>

    <!-- 메인 컨테이너 -->
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
                            <p class="product-name">나랑 너 패키지</p>
                            <p class="product-desc">일반 영화 관람권 2매 + DGV콤보 1개</p>
                        </div>
                    </td>
                    <td>
                        <p class="price">35,000원</p>
                        <p class="original-price">37,000원</p>
                    </td>
                    <td>
                        <p class="quantity">1개</p>
                    </td>
                    <td class="total-price">35,000원</td>
                </tr>
            </tbody>
        </table>

        <!-- 결제 정보 -->
        <div class="payment-info">
            <div class="payment-item">
                <span>총 상품 금액</span>
                <span class="amount">35,000원</span>
            </div>
            <div class="payment-item">
                <span>할인 금액</span>
                <span class="amount discount">2,000원</span>
            </div>
            <div class="payment-item total">
                <span>총 결제 예정금액</span>
                <span class="amount total-amount">33,000원</span>
            </div>
        </div>

         <!-- 주문자 정보 확인 -->
        <section class="order-info">
            <h3>주문자 정보 확인</h3>
            <div class="form-row">
                <label for="name" class="name-input">이름</label>
           		<input type="text" id="name" value="${result.cust_name}" readonly>
                <label for="phone" class="phone-input">휴대전화번호</label>
                <input type="text" id="phone" value="${result.getCust_tel}" readonly>
            </div>
            <p class="notice-text">
                * 구매하신 DGV 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.<br>
                입력된 휴대전화 번호가 맞는지 꼭 확인하세요.
            </p>
        </section>

        <!-- 결제 수단 -->
        <section class="payment-method">
            <h3>결제 수단</h3>
            <div class="payment-options">
                <label><input type="radio" name="payment" checked> QR 코드</label>
            </div>
        </section>

        <!-- 버튼 영역 -->
        <div class="button-container">
            <button class="back-btn" id="beforebutton">&lt; 이전화면</button>
            <button class="pay-btn" id="paybutton">결제하기</button>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
$('#beforebutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/shoppingcart.jsp';
});
$('#paybutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/paymentEND.jsp';
});
</script>
</html>