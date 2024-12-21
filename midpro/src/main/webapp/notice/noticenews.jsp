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

        /* 고객센터 */
        .customer-service-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 20px;
            font-family: Arial, sans-serif;
            color: white;
        }

        .left-menu {
            flex: 1;
        }

        .menu-button {
            background-color: white;
            color: black;
            border: none;
            width: 104%;
            padding: 10px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
        }

        .left-menu ul {
            margin-top: 20px;
            list-style: none;
            padding: 0;
        }

        .left-menu li {
            padding: 10px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .left-menu li:hover {
            background-color: white;
            color: black;
        }

        .banner-image {
            width: 100%;
            margin-top: 20px;
            border-radius: 5px;
        }

        /* 메인 컨텐츠 */
        .container {
        	margin-top: -40px;
            flex: 3;
            background: transparent;
            border-color: transparent;
            padding: 20px;
            border-radius: 5px;
            color: black;
        }

        h1 {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: white;
        }

        .description {
            font-size: 1rem;
            margin-bottom: 20px;
            color: white;
        }

        .search-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            border: 1px solid black;
            border-radius: 4px;
        }

        .search-button {
            padding: 10px 20px;
            border: none;
            background-color: #d32f2f;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .category-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            cursor: pointer;
        }

        .tab.active {
            background-color: #d32f2f;
            color: #fff;
        }

		.table-container {
		    width: 100%; /* 부모 컨테이너 가로 크기 */
		    height: 1000px; /* 부모 컨테이너 높이 */
		    margin: 0 auto; /* 중앙 정렬 */
		    padding: 0; /* 내부 패딩 제거 */
		    overflow: hidden; /* 스크롤 제거 */
		    background: black; /* 배경 검정색 */
		}
		
		iframe {
		    width: 100%; /* iframe 가로 크기 */
		    height: 100%; /* iframe 높이 */
		    border: none; /* 테두리 제거 */
		    overflow: hidden; /* 내부 스크롤 제거 */
		}
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <div id="main"> <!-- 메인 컨테이너 -->
        <div class="customer-service-container">
            <!-- 왼쪽 메뉴 -->
            <div class="left-menu">
                <button class="menu-button active" id="menubutton">고객센터 메인</button>
                <ul>
                    <li>공지사항</li>
                    <li>자주찾는 질문</li>
                    <li>대관신청</li>
                    <li>1:1 문의</li>
                </ul>
            </div>
        
            <!-- 메인 컨텐츠 -->
            <div class="container">
<!--                 <h1>공지/뉴스</h1>
                <p class="description">DGV의 주요한 이슈 및 여러가지 소식을 확인하실 수 있습니다.</p>
                
                검색 바
                <div class="search-bar">
                    <label for="search" style="color: white;">제목</label>
                    <input type="text" id="search" placeholder="검색어를 입력해 주세요">
                    <button class="search-button">검색하기</button>
                </div>
                
                카테고리 탭
                <div class="category-tabs">
                    <button class="tab active">전체</button>
                    <button class="tab">시스템점검</button>
                    <button class="tab">극장</button>
                    <button class="tab">행사/이벤트</button>
                    <button class="tab">제휴/이벤트</button>
                    <button class="tab">기타</button>
                </div>
 -->                
                <!-- 검색 결과 -->
                <!-- <p class="result-summary">총 120건이 검색되었습니다.</p> -->
                
                <!-- 공지 테이블 -->
                <div class="table-container">
				    <iframe src="<%=request.getContextPath() %>/noticeList.do" 
				        width="100%" 
				        height="1000px" 
				        >
					</iframe>
				</div>
            </div>
        </div>
    </div>
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
    $('#menubutton').on('click',function(){
        window.location.href = '<%=request.getContextPath()%>/notice/customerservice.jsp';
    });
</script>
</html>
