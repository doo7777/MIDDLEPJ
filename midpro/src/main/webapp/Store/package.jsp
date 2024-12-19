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

        
        /* 패키지 설명 */
        .package-title {
            margin: 30px 0;
            text-align: left;
        }

        .package-title h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .package-title p {
            font-size: 1.2rem;
            color: white;
        }

        /* 패키지 아이템 목록 */
        .package-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개의 컬럼으로 나누기 */
            gap: 20px;
        }

        .package-item {
            background: d;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .package-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 올라가는 효과 */
        }

        .package-item img {
            width: 100%;
            max-width: 180px; /* 이미지 크기 제한 */
            margin-bottom: 10px;
        }

        .package-item h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .package-item p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
        }

        .package-item .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ef8400;
        }

        .package-item del {
            font-size: 0.9rem;
            color: #999;
            margin-left: 5px;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .package-grid {
                grid-template-columns: repeat(2, 1fr); /* 화면이 작을 때 2개의 컬럼 */
            }
        }

        @media (max-width: 480px) {
            .package-grid {
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

        <!-- 패키지 설명 -->
        <div class="package-title">
            <h2>패키지</h2>
            <p>마음을 담아 선물하세요</p>
        </div>

        <!-- 패키지 아이템 목록 -->
        <div class="package-grid">
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/우리-패키지.jpg" alt="우리패키지" />
                <h3>우리 패키지</h3>
                <p>일반 영화 관람권 4매+더블콤보 1개</p>
                <span class="price">62,000원 <del>66,000원</del></span>
            </div>
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/나랑-너-패키지.jpg" alt="나랑 너 패키지" />
                <h3>나랑 너 패키지</h3>
                <p>일반 영화 관람권 2매+DGV콤보 1개</p>
                <span class="price">35,000원 <del>37,000원</del></span>
            </div>
            <div class="package-item">
                <img src="<%= request.getContextPath() %>/main/sorce/img/패키지(완료)/좋은-날-패키지.jpg" alt="좋은 날 패키지" />
                <h3>좋은 날 패키지</h3>
                <p>일반 영화 관람권 1매+스몰세트 1개</p>
                <span class="price">18,000원 <del>20,000원</del></span>
            </div>
        </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>