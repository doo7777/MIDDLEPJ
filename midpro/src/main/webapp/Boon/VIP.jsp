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

        /* VIP 메인 영역 */
        .tit-head h2 {
            text-align: center; /* 텍스트 중앙 정렬 */
            color: white; /* 글자색 하얀색 */
            margin: 0; /* 기본 여백 제거 */
            font-size: 28px; /* 글자 크기 설정 */
            font-weight: bold; /* 굵은 글꼴 */
            margin-bottom: 20px; /* 하단 여백 추가 */
        }

        /* VIP */
        /* 전체 컨테이너 */
        .vip-lounge-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: black;
        }

        /* 타이틀 스타일 */
        .vip-lounge-title h2 {
            text-align: center;
            border-bottom: 2px solid;
            display: inline-block;
            padding-bottom: 10px;
            font-size: 28px;
            color: white;
            margin: 20px 0;
        }

        /* VIP 헤더 */
        .vip-header {
            background: black;
            color: white;
            text-align: center;
            
        }
        .vip-header h2 {
            font-size: 30px;
            font-weight: bold;
        }
        .vip-header p {
            margin-top: 10px;
            font-size: 16px;
        }

        /* VIP 배지와 프로그레스 스타일 */
        .vip-info-wrapper {
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            background: black;
            padding: 20px; /* 내부 여백 유지 */
            color: white;
            max-width: 1000px; /* 너비를 줄여서 안쪽으로 모으기 */
            margin: 0 auto; /* 중앙 배치 */
            border-radius: 10px; /* 둥근 테두리 추가 (선택사항) */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 가벼운 그림자 추가 (선택사항) */
        }

        .vip-badge {
            width: 120px;
            height: 120px;
            background: white;
            color: black; /* 원 안의 글자 */
            font-size: 20px;
            font-weight: bold;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .vip-progress {
            margin-left: 0px;
            flex: 2;
            margin-left: 30px;
        }
        .vip-progress p {
            font-size: 18px;
            font-weight: 500;
        }
        .vip-progress em {
            color: white;
            font-style: normal;
        }
        .progress-container {
            width: 100%; /* 컨테이너 너비 */
            background: none; /* 문제 해결: 배경색 제거 */
            height: 10px;
            border-radius: 5px;
            position: relative;
        }
        .progress-bar {
            width: 100%; /* 초기 값 */
            background: white; /* 진행 바 색상 */
            height: 10px;
            border-radius: 5px;
        }
        .progress-text {
            font-size: 14px;
            margin-top: 5px;
            color: white;
        }

        /* VIP 점수 기준 섹션 */
        .vip-points-container {
            margin-top: 20px;
        }
        .vip-points-section {
            border: 1px dashed white;
            padding: 20px;
            margin-bottom: 20px;
            background: black;
        }
        .vip-points-section h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: white;
        }
        .vip-points-section ul {
            list-style: none;
            padding-left: 0;
            line-height: 1.8;
            font-size: 14px;
            color: white;
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <!-- VIP LOUNGE 섹션 시작 -->
    <div class="vip-lounge-container">
        <div class="vip-lounge-content">
            <div class="vip-header">
                <h2>VIP LOUNGE</h2>
                <p>영화마니아라면 놓칠 수 없는 특별한 혜택</p>
            </div>

            <div class="vip-info-wrapper">
                <div class="vip-badge">
                    <em><%=result.getCust_grade() %></em>
                </div>
                <div class="vip-progress">
                 <% if(result==null){ %>
			       <h3>로그인 후 이용해주세요</h3>
				        <% } else { %>
                   <p><span><%=result.getCust_name() %></span> 님은 <em><%=result.getCust_grade() %></em>입니다.</p>
                    <div class="progress-container">
                        <div class="progress-bar"></div>
                    </div>
                    <p class="progress-text">
                        <span>0점</span> / <span>1,000점</span>
			        	 <% } %>
                    </p>
                </div>
            </div>
        </div>

        <!-- VIP 점수 기준 및 제외 기준 -->
        <div class="vip-points-container">
            <div class="vip-points-section">
                <h3>VIP점수 반영 기준</h3>
                <ul>
                    <li>· DGV에서 매표, 매점, 씨네드쉘프 F&B, 오프라인 내 써비스에서 구매하신 금액 기준 및 이벤트 보상이 합산되어 반영됩니다.</li>
                    <li>· 구매 시, CJ ONE 포인트 적립 등 고객정보가 반영된 내역으로 집계됩니다.</li>
                    <li>· 매표는 사전예매 5%, 당일예매 3%로, 상영일 기준 익월 누적 반영됩니다.</li>
                    <li>· 매점과 부대시설은 3%로, 결제일 기준 익월 반영됩니다.</li>
                    <li>· VIP점수 반영일이 2~3일 지연될 수 있습니다.</li>
                </ul>
            </div>
            <div class="vip-points-section">
                <h3>VIP점수 제외 기준</h3>
                <ul>
                    <li>· CJ ONE 포인트와 VIP점수는 무관합니다.</li>
                    <li>· CJ ONE 이벤트 보상, 실물경품 등 VIP 멤버십과 무관한 적립 내역은 제외됩니다.</li>
                    <li>· 구매 시 CJ ONE 포인트 사용을 비롯한 쿠폰 등 할인 적용된 금액은 제외됩니다.</li>
                </ul>
            </div>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>