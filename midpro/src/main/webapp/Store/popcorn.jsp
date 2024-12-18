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

       

        /* 팝콘 설명 */
        .popcorn-title {
            margin: 30px 0;
            text-align: left;
        }

        .popcorn-title h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .popcorn-title p {
            font-size: 1.2rem;
            color: white;
        }

        /* 팝콘 아이템 목록 */
        .popcorn-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개의 컬럼으로 나누기 */
            gap: 20px;
        }

        .popcorn-item {
            background: d;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .popcorn-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 올라가는 효과 */
        }

        .popcorn-item img {
            width: 100%;
            max-width: 180px; /* 이미지 크기 제한 */
            margin-bottom: 10px;
        }

        .popcorn-item h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .popcorn-item p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
        }

        .popcorn-item .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ef8400;
        }

        .popcorn-item del {
            font-size: 0.9rem;
            color: #999;
            margin-left: 5px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .popcorn-grid {
                grid-template-columns: repeat(2, 1fr); /* 화면이 작을 때 2개의 컬럼 */
            }
        }

        @media (max-width: 480px) {
            .popcorn-grid {
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

        <!-- 팝콘 설명 -->
        <div class="popcorn-title">
            <h2>팝콘</h2>
            <p>고소, 달콤부터 고메팝콘까지, 안먹으면 서운해요</p>
        </div>

        <!-- 팝콘 아이템 목록 -->
        <div class="popcorn-grid">
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/더블치즈팝콘L.jpg" alt="더블치즈팝콘L" />
                <h3>더블치즈팝콘(L)</h3>
                <span class="price">7,000</span>
            </div>
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/바질어니언팝콘L.jpg" alt="바질어니언팝콘L" />
                <h3>바질어니언팝콘(L)</h3>
                <span class="price">7,000</span>
            </div>
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/달콤팝콘L.jpg" alt="달콤팝콘L" />
                <h3>달콤팝콘(L)</h3>
                <span class="price">7,000</span>
            </div>
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/고소팝콘L.jpg" alt="고소팝콘L" />
                <h3>고소팝콘(L)</h3>
                <span class="price">7,000</span>
            </div>
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/더블치즈팝콘M.jpg" alt="더블치즈팝콘M" />
                <h3>더블치즈팝콘(M)</h3>
                <span class="price">7,000</span>
            </div>
            <div class="popcorn-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/팝콘(완료)/바질어니언팝콘M.jpg" alt="바질어니언팝콘M" />
                <h3>바질어니언팝콘(M)</h3>
                <span class="price">7,000</span>
            </div>
        </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>