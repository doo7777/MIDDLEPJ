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

        /* 결제완료 */
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

        h3 {
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }

        .payment-completed {
            color: #ffffff;      /* 글자 색상을 하얀색으로 설정 */
            font-size: 24px;     /* 글씨 크기를 크게 설정 */
            text-align: center;  /* 텍스트를 중앙 정렬 */
            margin-top: 70px;    /* 위쪽 여백 추가 (선택 사항) */
            margin-bottom: 120px;
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
        <span>STEP 01<br>장바구니</span>
        <span>STEP 02<br>결제하기</span>
        <span class="active">STEP 03<br>결제완료</span>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 결제완료 -->
        <table class="cart-table">
            <thead>
                <h3>결제완료 정보</h3><br>
            </thead>
            <p class="payment-completed">결제가 완료되었습니다. 감사합니다.</p>
        </table>
    </div>

    <!-- 하단 버튼 -->
    <div class="action-buttons">
        <button class="purchase-btn-bottom" id="mainbutton">메인으로 돌아가기</button>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
$('#mainbutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/main/main.jsp';
});
</script>
</html>