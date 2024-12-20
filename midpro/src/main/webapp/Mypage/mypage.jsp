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
            border: 2px solid transparent; /* 모든 div 요소에 검은색 테두리 추가 */
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

        /* MYDGV */
        .main-container {
            max-width: 1200px;
            margin: 20px auto; /* 양쪽 여백 */
        }

        /* 프로필 섹션 */
        .profile-section {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border: transparent;
            border-bottom: 1px solid white;
            padding-bottom: 20px;
        }

        .profile-icon {
            width: 100px;
            height: 100px;
            background-color: white;
            border-radius: 50%;
            margin-right: 20px;
        }

        .profile-info h1 {
            margin: 0;
            font-size: 24px;
            color: white;
        }

        .profile-info p {
            font-size: 16px;
            color: white;
        }

        .highlight {
            color: #e6007e; /* 강조 색상 */
        }

        /* 쿠폰 & 포인트 섹션 */
        .coupon-point-section {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .coupon-box, .point-box {
            width: 47%;
            text-align: center;
            background-color: white;
            padding: 15px;
            border-radius: 5px;
        }

        .small-btn {
            padding: 3px 6px;
            border: 1px solid #fff;
            background-color: transparent;
            color: black;
            font-size: 12px;
            cursor: pointer;
        }

        .count, .highlight {
            font-weight: bold;
            font-size: 16px;
        }

        /* 빠른 설정 섹션 */
        .quick-settings {
            display: flex;
            justify-content: space-between;
        }

        .setting-box {
            width: 17.8%;
            text-align: center;
            padding: 10px;
            border: 1px solid white;
            background-color: #222;
            color: #fff;
        }

        .setting-box span {
            display: block;
            font-weight: bold;
            font-size: 14px;
        }

        .setting-box.active {
            background-color: #444;
            font-weight: bold;
            color: #fff;
        }

        .border-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 20px;
            font-family: Arial, sans-serif;
            color: white;
            height: 300px;
        }
        /* 사이드바 스타일 */
        .leftbar {
            width: 250px; /* 고정 너비 */
            background-color: #222;
            padding: 20px;
            color: #fff;
            border-right: 2px solid #444; /* 사이드바 오른쪽 경계선 */
            height: 242px;
        }

        .leftbar-header {
            font-weight: bold;
            background-color: white;
            color: black;
            padding: 10px;
            text-align: center;
            margin-bottom: 10px;
        }

        .leftbar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .leftbar-menu li {
            margin: 10px 0;
            font-size: 14px;
            cursor: pointer;
        }

        /* 콘텐츠 영역 스타일 */
        .content-area {
            flex: 1; /* 남은 공간 차지 */
            padding: 0px;
            
        }

        .card-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .card {
            width: 45%;
            background-color: #333;
            padding: 15px;
            text-align: center;
            border: 1px solid #444;
            border-radius: 5px;
        }

        .card h3 {
            margin: 0 0 10px;
            font-size: 16px;
            color: white;
        }

        .card p {
            margin: 0;
            font-size: 12px;
            color: #ccc;
        }

        .info-box {
            background-color: #222;
            border: 1px solid #444;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .info-box h4 {
            margin: 0 0 10px;
            font-size: 16px;
            color: white;
        }

        .info-box p {
            margin: 0;
            font-size: 14px;
            color: #ccc;
        }
    </style>
</head>
<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>

    <div class="main-container">
        <!-- 프로필 섹션 -->
        <div class="profile-section">
            <div class="profile-icon"></div>
            <div class="profile-info">
                <h1><%=result.getCust_name() %></h1>
                <p>고객님은 <span class="highlight"><%=result.getCust_grade()%></span> 입니다.</p>
            </div>
        </div>

        <!-- 쿠폰 & 포인트 섹션 -->
        <div class="coupon-point-section">
            <div class="point-box">
                <h2>DD POINT</h2>
                <p>DD 사용가능 포인트 <span class="highlight">347점</span></p>
                <p class="vip-score">VIP 누적 점수 <span>0/1,000점</span></p>
            </div>
            <div class="coupon-box">
                <h2>MY COUPON</h2>
                <p>DGV VIP에 도전하세요! <button class="small-btn">DGV VIP 혜택보기</button></p>
                <p>DGV 할인쿠폰 <span class="count">0개</span></p>
                <p>영화관람권 <span class="count">0개</span></p>
            </div>
        </div>

        <!-- 빠른 설정 섹션 -->
        <div class="quick-settings">
            <div class="setting-box">DGV대전 <span>1</span></div>
            <div class="setting-box"><span>2</span></div>
            <div class="setting-box"><span>3</span></div>
            <div class="setting-box"><span>4</span></div>
            <div class="setting-box active">자주가는 DGV 설정하기</div>
        </div>


        <!-- 같은 테두리 안에 사이드바와 콘텐츠 영역 -->
        <div class="border-container">
            <!-- 사이드바 -->
            <div class="leftbar">
                <div class="leftbar-header">MY DGV HOME</div>
                <ul class="leftbar-menu">
                    <li>나의 예매내역</li>
                    <li>DGV기프트카드</li>
                    <li>DD 포인트</li>
                    <li>회원정보</li>
                    <ul class="submenu">
                        <li>개인정보 설정</li>
                        <li>간편로그인 설정</li>
                    </ul>
                    <li>나의 문의내역</li>
                </ul>
            </div>

            <!-- 콘텐츠 영역 -->
            <div class="content-area">
                <div class="card-section">
                    <div class="card">
                        <h3>내가 본 영화</h3>
                        <p>관람한 영화들을 한 번에 모아 보고 싶다면?</p>
                    </div>
                    <div class="card">
                        <h3>내가 쓴 평점</h3>
                        <p>관람 후 내 감상평을 적어 추억하고 싶다면?</p>
                    </div>
                </div>

                <div class="info-box">
                    <h4>MY 예매내역 <span>0건</span></h4>
                    <p>고객님의 최근 예매내역이 존재하지 않습니다.</p>
                </div>

                <div class="info-box">
                    <h4>MY Q&A <span>0건</span></h4>
                    <p>고객님의 1:1 문의내역이 존재하지 않습니다.</p>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="/main/Bottom.jsp" %>
</body>
</html>

