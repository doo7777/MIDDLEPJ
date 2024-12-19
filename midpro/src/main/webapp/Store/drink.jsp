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

     

        /* 음료 설명 */
        .drink-title {
            margin: 30px 0;
            text-align: left;
        }

        .drink-title h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .drink-title p {
            font-size: 1.2rem;
            color: white;
        }

        /* 음료 아이템 목록 */
        .drink-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개의 컬럼으로 나누기 */
            gap: 20px;
        }

        .drink-item {
            background: d;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .drink-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 올라가는 효과 */
        }

        .drink-item img {
            width: 100%;
            max-width: 180px; /* 이미지 크기 제한 */
            margin-bottom: 10px;
        }

        .drink-item h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .drink-item p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
        }

        .drink-item .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ef8400;
        }

        .drink-item del {
            font-size: 0.9rem;
            color: #999;
            margin-left: 5px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .drink-grid {
                grid-template-columns: repeat(2, 1fr); /* 화면이 작을 때 2개의 컬럼 */
            }
        }

        @media (max-width: 480px) {
            .drink-grid {
                grid-template-columns: 1fr; /* 화면이 더 작을 때 1개의 컬럼 */
            }
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
                  <%@ include file="/Store/StoreTop.jsp" %>
        
    </div>

        <!-- 음료 설명 -->
        <div class="drink-title">
            <h2>음료</h2>
            <p>탄산음료부터 에이드까지, 마시는 즐거움!</p>
        </div>

        <!-- 음료 아이템 목록 -->
        <div class="drink-grid">
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/핑크레몬에이드.jpg" alt="핑크레몬에이드" />
                <h3>핑크레몬에이드</h3>
                <span class="price">5,500</span>
            </div>
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/에이드.jpg" alt="에이드" />
                <h3>에이드</h3>
                <span class="price">5,500</span>
            </div>
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/디카페인 콜드브루.jpg" alt="디카페인 콜드브루" />
                <h3>디카페인 콜드브루</h3>
                <span class="price">5,000</span>
            </div>
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/아이스아메리카노.jpg" alt="아이스아메리카노" />
                <h3>아이스아메리카노</h3>
                <span class="price">4,500</span>
            </div>
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/아메리카노.jpg" alt="아메리카노" />
                <h3>아메리카노</h3>
                <span class="price">4,000</span>
            </div>
            <div class="drink-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/음료(완료)/탄산음료L.jpg" alt="탄산음료L" />
                <h3>탄산음료(L)</h3>
                <span class="price">3,500</span>
            </div>
        </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>