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

      

        /* 장바구니 */
        /* 상단 단계 표시 */
        .step-header {
            display: flex;
            justify-content: center;
            margin: 30px 0;
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

        .update-btn {
            margin-top: 5px;
            padding: 5px 10px;
            background-color: #555;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .total-price {
            font-weight: bold;
            color: white;
        }

        .delete-btn {
            background-color: transparent;
            font-size: 18px;
            color: #888;
        }

        input[type="checkbox"] {
            width: 18px;
            height: 18px;
        }

        /* 결제 정보 */
        .payment-info {
            border-top: 2px solid #333;
            padding-top: 20px;
            margin-bottom: 20px;
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

        .payment-item.total {
            font-size: 18px;
            font-weight: bold;
        }

        .payment-item.total .total-amount {
            color: #e6007e;
        }

        /* 하단 버튼 */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .action-buttons button {
            padding: 15px 30px;
            border: none;
            font-size: 16px;
            cursor: pointer;
            color: #fff;
        }

        .purchase-btn-bottom {
            background-color: #e6007e;
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
        <span class="active">STEP 01<br>장바구니</span>
        <span>STEP 02<br>결제하기</span>
        <span>STEP 03<br>결제완료</span>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 장바구니 리스트 -->
        <table class="cart-table">
            <thead>
                <tr>
                    <th><input type="checkbox" checked></th>
                    <th>상품정보</th>
                    <th>판매가</th>
                    <th>수량</th>
                    <th>합계</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox" checked></td>
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
                        <select name="quantity" id="quantity">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                        <button class="update-btn">변경</button>
                    </td>
                    <td class="total-price">35,000원</td>
                    <td><button class="delete-btn">X</button></td>
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

        <!-- 하단 버튼 -->
        <div class="action-buttons">
            <button class="purchase-btn-bottom" id="buybutton">구매하기</button>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
$('#buybutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/paymentING.jsp';
});
</script>
</html>