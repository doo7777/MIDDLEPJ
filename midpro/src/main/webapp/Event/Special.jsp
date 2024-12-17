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
        .bottom_line {
            margin-top: 100px;
        }

        .parent {
            position: relative; /* 부모 요소에 상대 위치 설정 */
        }

        #company {
            height: 400px; /* 회사 정보 영역의 높이 설정 */
            color: white;
            width: 700px; /* 고정 너비 유지 */
            margin: 0; /* 기본 여백 제거 */
            margin-top: 100px; /* 위쪽 여백 */
            text-align: center;
            overflow: hidden; /* 내용이 잘리도록 설정 */
            position: absolute; /* 절대 위치 설정 */
            transform: translateX(100%);
        }

        /* 전체 이벤트 페이지 스타일 */
        .event-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: black;
        }

        /* 상단 타이틀과 메뉴 */
        .event-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .event-header h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
            color: white;
            margin-bottom: 30px;
        }

        .event-menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            font-size: 16px;
            color: white;
        }

        .event-menu span {
            cursor: pointer;
            padding: 5px 10px;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .event-menu .active {
            font-weight: bold;
            color: white;
            border-bottom-color: white;
        }

        .event-menu .end-event {
            background-color: #ef8400;
            color: #fff;
            border-radius: 5px;
            padding: 5px 10px;
        }

        /* 이벤트 카드 레이아웃 */
        .event-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4개의 열로 고정 */
            gap: 20px; /* 카드 간격 */
            max-height: 500px; /* 두 줄에 맞는 높이로 설정 */
            margin-top: 50px;
        }

        .event-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .event-card:hover {
            transform: translateY(-5px);
        }

        .event-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .event-card p {
            font-size: 14px;
            font-weight: bold;
            margin: 10px;
        }

        .event-card span {
            display: block;
            font-size: 12px;
            color: #666;
            margin: 10px;
        }

        .red-text {
            color: red;
            font-weight: bold;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .event-menu {
                font-size: 14px;
                gap: 10px;
            }

            .event-card img {
                height: 120px;
            }

            .event-card p {
                font-size: 12px;
            }

            .event-card span {
                font-size: 10px;
            }
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <div class="event-container">
        <!-- 상단 메뉴 -->
        <div class="event-header">
            <h2>EVENT</h2>
            <div class="event-menu">
                <span class="active">SPECIAL</span>
               <span id="movres2">영화/예매</span>
            </div>
        </div>
    
        <!-- 이벤트 카드 섹션 -->
        <div class="event-grid">
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/1.png" alt="이벤트1" />
                <p>홀리데이 한정 삼숙이 키링 출시!</p>
                <span>2024.11.29~2024.12.31</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/2.png" alt="이벤트2" />
                <p>[무파사: 라이온 킹] SX 포스터</p>
                <span>2024.12.11~2024.12.24</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/3.png" alt="이벤트3" />
                <p>짱구는 못말려 공룡일기 피규어 출시!</p>
                <span>2024.11.29~2024.12.17 <span class="red-text">D-1</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/4.png" alt="이벤트4" />
                <p>[미생:더할 나위 없었다]TTT</p>
                <span>2024.11.28~2024.12.31</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/5.png" alt="이벤트5" />
                <p>[무파사: 라이온 킹] 4DX 포스터</p>
                <span>2024.12.11~2024.12.24</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/6.png" alt="이벤트6" />
                <p>IMAX 마스터피스 기획전</p>
                <span>2024.12.05~2024.12.17 <span class="red-text" style="color: #ef8400;">D-1</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/7.png" alt="이벤트7" />
                <p>[무파사: 라이온 킹] IMAX 포스터</p>
                <span>2024.12.05~2024.12.17 <span class="red-text" style="color: #ef8400;">D-1</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/8.png" alt="이벤트8" />
                <p>[모아나] 바다를 고이 담은 모아나 매점 콜라보</p>
                <span>2024.12.05~2024.12.17 <span class="red-text">D-1</span></span>
            </div>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>

<script>
$('#movres2').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Event/MovRes.jsp';
});

</script>
</html>

