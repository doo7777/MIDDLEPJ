<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DGV</title>
    <style>
		.package-image.hoverable:hover img {
		    transform: scale(1.05);
		    filter: brightness(60%);
		} 
		
		.hover-overlay {
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    gap: 20px;
		    opacity: 0;
		    background: rgba(0, 0, 0, 0.2);
		    border-color: transparent;
		    margin-top: -100px;
		    margin-bottom: 20px;
		}
		
		.package-image.hoverable:hover .hover-overlay {
		    opacity: 1;
		}

        /* 아이콘 동그라미 */
        .icon-circle {
        	position: relative; /* 부모 요소를 기준으로 텍스트 위치 설정 가능 */ /*  */
            width: 70px;
            height: 70px;
            background-color: rgba(0, 0, 0, 0.6); /* 회색 배경 */
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.2s ease, transform 0.2s ease;
            transform: translateX(-2.5px); /* 동그라미 왼쪽으로 이동 */
        }

        /* 호버 시 동그라미 강조 효과 */
        .icon-circle:hover {
            background-color: rgba(0, 0, 0, 0.8);
            transform: scale(1.1) translateX(-2.5px); /* 강조와 함께 왼쪽 이동 */
        }

        /* 아이콘 이미지 */
        .icon-circle img {
            width: 60px;
            height: 60px;
            margin-top: 10px; /* 글자 위아래 */
        }

        /* 아이콘 텍스트 (기본 숨김) */
        .hover-label {
            display: none;
            position: absolute;
            font-size: 16px;
            color: #fff;
            text-align: center;
            pointer-events: none;
            margin-top: 10px; /* 글자 위아래 */
        }

        /* 호버 시 아이콘 이미지 숨김 + 텍스트 표시 */
        .icon-circle.hover-text:hover img {
            opacity: 0; /* 이미지 숨김 */
        }

        .icon-circle.hover-text:hover .hover-label {
            display: block; /* 텍스트 표시 */
        }
    </style>
</head>
<body>
    <div class="package-item">
        <div class="package-image hoverable">
		    <!-- 부모 JSP에서 전달된 이미지 경로 -->
		    <img src="<%= request.getAttribute("imageSrc") %>" alt="상품 이미지" />
		    <div class="hover-overlay">
		        <!-- 장바구니 아이콘 -->
		        <span class="icon">
		            <div class="icon-circle hover-text">
		                <img src="<%= request.getContextPath() %>/main/sorce/img/스토어/cart.png" alt="장바구니" id="cartbutton" />
		                <p class="hover-label">장바<br>구니</p>
		            </div>
		        </span>
		        <!-- 구매하기 아이콘 -->
		        <span class="icon">
		            <div class="icon-circle hover-text">
		                <img src="<%= request.getContextPath() %>/main/sorce/img/스토어/buy.png" alt="구매하기" id="buybutton" />
		                <p class="hover-label">구매<br>하기</p>
		            </div>
		        </span>
		    </div>
		</div>
    </div>
</body>
<script>
$('#cartbutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/shoppingcart.jsp';
});
$('#buybutton').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/paymentING.jsp';
});
</script>
</html>
