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
            background-color: white;
            color: black;
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
                <span id="special2">SPECIAL</span>
                <span class="active">영화/예매</span>
            </div>
        </div>
    
        <!-- 이벤트 카드 섹션 -->
        <div class="event-grid">
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/a.png" alt="이벤트1" />
                <p>[무파사-라이온킹] 이모티콘 이벤트</p>
                <span>2024.12.06~2024.12.24</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/b.png" alt="이벤트2" />
                <p>[모아나2] 스페셜 핀 배지 이벤트</p>
                <span>2024.12.10~2024.12.24</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/c.png" alt="이벤트3" />
                <p>[서브스턴스] 과몰입 이벤트</p>
                <span>2024.12.06~2024.12.24<span class="red-text">D-1</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/d.png" alt="이벤트4" />
                <p>[대가족] 효도 할인 쿠폰</p>
                <span>2024.11.28~2024.12.31</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/e.png" alt="이벤트5" />
                <p>[RM: RPWP] 3주차 현장 증정 이벤트</p>
                <span>2024.12.16~2024.12.24</span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/f.png" alt="이벤트6" />
                <p>[엔시티 드림 미스터리 랩] 싱어롱 상영회</p>
                <span>2024.12.16~2024.12.21<span class="red-text" style="color: red;">D-6</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/g.png" alt="이벤트7" />
                <p>[극장판 주술회전 0] 순애 상영회</p>
                <span>2024.12.16~2024.12.19<span class="red-text" style="color: red;">D-3</span></span>
            </div>
            <div class="event-card">
                <img src="<%= request.getContextPath() %>/main/sorce/img/이벤트/h.png" alt="이벤트8" />
                <p>[극장판 주술회전 0] 비주얼 보드 증정 이벤트</p>
                <span>2024.12.16~2024.12.24<span class="red-text">D-1</span></span>
            </div>
        </div>
    </div>
    <%@ include file="/main/Bottom.jsp" %>
</body>

<script>
$('#special2').on('click',function(){
	window.location.href = '<%=request.getContextPath()%>/Event/Special.jsp';
});
</script>
</html>