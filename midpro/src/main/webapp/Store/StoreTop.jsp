<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 /* 스토어 */
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        h1 {
            margin: 0;
            color: white;
            margin-top: 20px;
        }
        
        h2, h3 {
            margin: 0;
            color: white;
        }

        /* 메인 컨테이너 */
        .store-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: black;
        }

        /* 상단 타이틀 */
        .store-header h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .store-menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            font-size: 16px;
            color: white;
            gap: 50px;
        }

        .store-menu span {
            cursor: pointer;
            padding: 5px 10px;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .store-menu .active {
        font-weight: bold;
        color: white;
        border-bottom: 2px solid white;
        }
        </style>
<body>
 <div class="store-container">
        <!-- 상단 타이틀 -->
        <div class="store-header">
            <h1>스토어</h1>
            <div class="store-menu">
                <span class="<%= (request.getRequestURI().contains("package.jsp")) ? "active" : "" %>" id="1">패키지</span>
                <span class="<%= (request.getRequestURI().contains("movieticket.jsp")) ? "active" : "" %>" id="2">영화관람권</span>
                <span class="<%= (request.getRequestURI().contains("giftcard.jsp")) ? "active" : "" %>" id="3">기프트카드</span>
                <span class="<%= (request.getRequestURI().contains("combo.jsp")) ? "active" : "" %>" id="4">콤보</span>
                <span class="<%= (request.getRequestURI().contains("popcorn.jsp")) ? "active" : "" %>" id="5">팝콘</span>
                <span class="<%= (request.getRequestURI().contains("drink.jsp")) ? "active" : "" %>" id="6">음료</span>
                <span class="<%= (request.getRequestURI().contains("snack.jsp")) ? "active" : "" %>" id="7">스낵</span>
                <span class="<%= (request.getRequestURI().contains("shoppingcart.jsp")) ? "active" : "" %>" id="8">장바구니</span>
            </div>
        </div>
  </div>
</body>
<script>

$('#1').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/package.jsp';
});
$('#2').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/movieticket.jsp';
});
$('#3').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/giftcard.jsp';
});
$('#4').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/combo.jsp';
});
$('#5').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/popcorn.jsp';
});
$('#6').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/drink.jsp';
});
$('#7').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/snack.jsp';
});
$('#8').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Store/shoppingcart.jsp';
});


</script>
</html>