<%@page import="Vo.NoticeVO"%>
<%@page import="Vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
    <title>공지사항</title>
=======
    <title>공지사항 관리</title>
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
    <style>
	    body {
            background-color: black; /* 배경 검정색 */
            color: white; /* 글자 흰색 */
            font-family: Arial, sans-serif;
        }

		h1 {
	        text-align: left;
	        color: white; /* 글자 색깔 검정색 */
	    }
	    
        /* 테이블 컨테이너 */
        .table-container {
            margin: 30px auto; /* 중앙 정렬 */
            padding: 15px; /* 내부 패딩 */
            background-color: #222; /* 테이블 배경 검정색 */
            border-radius: 5px; /* 테두리 둥글게 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 96%;
            height: 530px; /* 고정 높이 */
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #555; /* 테두리 색상 */
            color: white; /* 글자 흰색 */
        }

        th {
            background-color: #333; /* 테이블 헤더 색상 */
        }
<<<<<<< HEAD

        .delete-btn, .update-btn {
            background-color: #ff4d4d; /* 삭제 버튼 색상 */
=======
        .delete-btn, .update-btn, .bulk-delete-btn {
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
<<<<<<< HEAD
        
=======
        .delete-btn {
            background-color: #ff4d4d;
        }
        .update-btn {
            background-color: #007bff;
        }
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
        .bulk-delete-btn {
            background-color: #28a745;
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
        }
<<<<<<< HEAD
        
        .update-btn {
            background-color: #007bff;
        }
        
        .detail-section {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        /* 페이지네이션 스타일 */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border: 1px solid #444;
            margin: 0 5px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #d32f2f; /* 활성 페이지 색상 */
            border: none;
        }

        .pagination a:hover {
            background-color: #555; /* 호버 색상 */
        }
        
        /* 버튼 스타일 */
		.home-button {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #007bff; /* 파란색 배경 */
		    color: white; /* 글자색 흰색 */
		    text-decoration: none; /* 밑줄 제거 */
		    border-radius: 5px; /* 모서리 둥글게 */
		    font-size: 14px; /* 글자 크기 */
		    font-weight: bold; /* 글자 굵기 */
		    box-shadow: 2px 4px 6px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
		    transition: all 0.3s ease; /* 부드러운 전환 효과 */
		}
		
		
		/* 버튼 컨테이너 스타일 */
		.button-container {
		    display: flex; /* Flexbox 사용 */
		    justify-content: flex-end; /* 오른쪽 정렬 */
		    padding: 10px 20px; /* 내부 여백 추가 */
		}
=======
        .detail-section {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
    </style>
    <script>
        function showUpdateForm() {
            document.getElementById("updateForm").style.display = "block";
        }

        function hideUpdateForm() {
            document.getElementById("updateForm").style.display = "none";
        }

        // "전체 선택" 체크박스 기능
        function toggleSelectAll(checkbox) {
            const checkboxes = document.querySelectorAll('input[name="notice_ids"]');
            checkboxes.forEach(cb => cb.checked = checkbox.checked);
        }
    </script>
</head>
<body>
<<<<<<< HEAD
	<% CustomerVO result = (CustomerVO) session.getAttribute("ok"); %>
    <h1>공지사항</h1>
    
    <!-- 검색 폼 -->
    <form action="searchNotice.do" method="get" style="text-align: center; margin-bottom: 20px;">
        <input type="text" name="title" placeholder="제목 검색" style="padding: 5px; width: 200px;">
        <button type="submit" class="update-btn">검색</button>
=======
    <% CustomerVO result = (CustomerVO) session.getAttribute("ok"); %>
    <h1 style="text-align: center;">공지사항 관리</h1>

    <!-- 검색 폼 -->
    <form action="searchNotice.do" method="get" style="text-align: center; margin-bottom: 20px;">
        <input type="text" name="title" placeholder="제목 검색" style="padding: 5px; width: 200px;">
        <button type="submit" class="update-btn">검색</button>
    </form>

    <!-- 공지사항 리스트 -->
    <form action="deleteNotice.do" method="post">
        <button type="submit" name="action" value="bulk-delete" class="bulk-delete-btn">일괄 삭제</button>
        <table>
            <thead>
            <tr>
                <th><input type="checkbox" onclick="toggleSelectAll(this)"></th>
                <th>번호</th>
                <th>유형</th>
                <th>제목</th>
                <th>등록일</th>
                <th>조회수</th>
                <th>삭제</th>
            </tr>
            </thead>
            <tbody>
            <% 
                List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
                String selectedNoticeId = request.getParameter("notice_id");
                NoticeVO selectedNotice = null;

                if (selectedNoticeId != null && noticeList != null) {
                    for (NoticeVO notice : noticeList) {
                        if (selectedNoticeId.equals(String.valueOf(notice.getNotice_id()))) {
                            selectedNotice = notice;
                            break;
                        }
                    }
                }

                if (noticeList != null) {
                    for (NoticeVO notice : noticeList) {
            %>
            <tr>
                <td><input type="checkbox" name="notice_ids" value="<%=notice.getNotice_id() %>"></td>
                <td><%=notice.getNotice_id() %></td>
                <td><%=notice.getNotice_sort() %></td>
                <td>
                    <a href="?notice_id=<%=notice.getNotice_id() %>"><%=notice.getTitle() %></a>
                </td>
                <td><%=notice.getPost_date() %></td>
                <td><%=notice.getNotice_view() %></td>
                <td>
                    <form action="deleteNotice.do" method="post" style="display: inline;">
                        <input type="hidden" name="notice_id" value="<%= notice.getNotice_id() %>">
                        <button type="submit" class="delete-btn">삭제</button>
                    </form>
                </td>
            </tr>
            <% 
                    }
                }
            %>
            </tbody>
        </table>
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
    </form>

<<<<<<< HEAD
    <button type="submit" class="bulk-delete-btn">일괄 삭제</button>
    <!-- 공지사항 테이블 -->
    <div class="table-container">
	    <form action="deleteNotice.do" method="post">
	        <table>
	            <thead>
	            <tr>
	                <th><input type="checkbox" id="selectAll"></th>
	                <th>번호</th>
	                <th>구분</th>
	                <th>제목 ID</th>
	                <th>등록일</th>
	                <th>조회수</th>
	                <th>삭제</th>
	            </tr>
	            </thead>
	            <tbody>
	            <%
	                // 페이징 처리용 변수
	                List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
	                int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	                int rowsPerPage = 10; // 페이지 당 10개 표시
	                int totalRows = noticeList != null ? noticeList.size() : 0;
	                int totalPages = (int) Math.ceil(totalRows / (double) rowsPerPage);
	
	                int start = (currentPage - 1) * rowsPerPage;
	                int end = Math.min(start + rowsPerPage, totalRows);
	
	                if (noticeList != null) {
	                    for (int i = start; i < end; i++) {
	                        NoticeVO notice = noticeList.get(i);
	            %>
	            <tr>
	                <td><input type="checkbox" name="notice_ids" value="<%=notice.getNotice_id() %>"></td>
	                <td><%=notice.getNotice_id() %></td>
	                <td><%=notice.getNotice_sort() %></td>
	                <td><%=notice.getTitle() %></td>
	                <td><%=notice.getPost_date() %></td>
	                <td><%=notice.getNotice_view() %></td>
	                <td>
	                    <!-- 게시글 삭제 버튼 -->
	                    <form action="deleteNotice.do" method="post" style="margin: 0;">
	                        <!-- notice_id를 hidden 필드로 전송 -->
	                        <input type="hidden" name="notice_id" value="<%= notice.getNotice_id() %>">
	                        <button type="submit" class="delete-btn">삭제</button>
	                    </form>
	                </td>
	            </tr>
	            <% 
	                    }
	                }
	            %>
	            </tbody>
	        </table>
	    </form>
	</div>
	
	<%-- <% if (selectedNotice != null) { %>
    <!-- 상세보기 영역 -->
    <div class="detail-section">
        <h2>게시글 상세보기</h2>
        <p><strong>번호:</strong> <%= selectedNotice.getNotice_id() %></p>
        <p><strong>구분:</strong> <%= selectedNotice.getNotice_sort() %></p>
        <p><strong>제목:</strong> <%= selectedNotice.getTitle() %></p>
        <p><strong>내용:</strong> <%= selectedNotice.getContent() %></p>
        <p><strong>등록일:</strong> <%= selectedNotice.getPost_date() %></p>
        <p><strong>조회수:</strong> <%= selectedNotice.getNotice_view() %></p>
=======
    <% if (selectedNotice != null) { %>
    <!-- 상세보기 영역 -->
    <div class="detail-section">
        <h2>게시글 상세보기</h2>
        <p><strong>번호:</strong> <%= selectedNotice.getNotice_id() %></p>
        <p><strong>구분:</strong> <%= selectedNotice.getNotice_sort() %></p>
        <p><strong>제목:</strong> <%= selectedNotice.getTitle() %></p>
        <p><strong>내용:</strong> <%= selectedNotice.getContent() %></p>
        <p><strong>등록일:</strong> <%= selectedNotice.getPost_date() %></p>
        <p><strong>조회수:</strong> <%= selectedNotice.getNotice_view() %></p>

        <% if (result != null && "관리자".equals(result.getCust_grade())) { %>
        <form action="deleteNotice.do" method="post" style="display: inline-block;">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <button type="submit" class="delete-btn">삭제</button>
        </form>
        <button type="button" onclick="showUpdateForm()" class="update-btn">수정</button>
        <% } %>
        <a href="<%=request.getContextPath() %>/noticeList.do">게시글 목록으로 돌아가기</a>
    </div>

    <!-- 수정 폼 -->
    <div class="detail-section" id="updateForm" style="display: none;">
        <h2>게시글 수정</h2>
        <form action="updateNotice.do" method="post">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <label>제목:</label>
            <input type="text" name="title" value="<%= selectedNotice.getTitle() %>" style="width: 100%;"><br><br>
            <label>내용:</label>
            <textarea name="content" rows="5" style="width: 100%;"><%= selectedNotice.getContent() %></textarea><br><br>
            <label>유형:</label>
            <select name="notice_sort" required>
                <option value="시스템점검" <%= "시스템점검".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>시스템점검</option>
                <option value="극장" <%= "극장".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>극장</option>
                <option value="행사/이벤트" <%= "행사/이벤트".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>행사/이벤트</option>
                <option value="기타" <%= "기타".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>기타</option>
            </select><br><br>
            <button type="submit" class="update-btn">저장</button>
            <button type="button" onclick="hideUpdateForm()" class="delete-btn">취소</button>
        </form>
    </div>
    <% } %>

    <!-- 공지사항 등록 버튼 (아래 배치) -->
    <% if (result != null && "관리자".equals(result.getCust_grade())) { %>
        <div style="text-align: center; margin-top: 20px;">
            <a href="<%= request.getContextPath() %>/noticeInsert.do" class="update-btn">공지사항 등록</a>
        </div>
    <% } %>
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git

        <% if (result != null && "관리자".equals(result.getCust_grade())) { %>
        <form action="deleteNotice.do" method="post" style="display: inline-block;">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <button type="submit" class="delete-btn">삭제</button>
        </form>
        <button type="button" onclick="showUpdateForm()" class="update-btn">수정</button>
        <% } %>
        <a href="<%=request.getContextPath() %>/noticeList.do">게시글 목록으로 돌아가기</a>
    </div>

    <!-- 수정 폼 -->
    <div class="detail-section" id="updateForm" style="display: none;">
        <h2>게시글 수정</h2>
        <form action="updateNotice.do" method="post">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <label>제목:</label>
            <input type="text" name="title" value="<%= selectedNotice.getTitle() %>" style="width: 100%;"><br><br>
            <label>내용:</label>
            <textarea name="content" rows="5" style="width: 100%;"><%= selectedNotice.getContent() %></textarea><br><br>
            <label>유형:</label>
            <select name="notice_sort" required>
                <option value="시스템점검" <%= "시스템점검".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>시스템점검</option>
                <option value="극장" <%= "극장".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>극장</option>
                <option value="행사/이벤트" <%= "행사/이벤트".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>행사/이벤트</option>
                <option value="기타" <%= "기타".equals(selectedNotice.getNotice_sort()) ? "selected" : "" %>>기타</option>
            </select><br><br>
            <button type="submit" class="update-btn">저장</button>
            <button type="button" onclick="hideUpdateForm()" class="delete-btn">취소</button>
        </form>
    </div>
    <% } %> --%>

    <!-- 공지사항 등록 버튼 (아래 배치) -->
    <% if (result != null && "관리자".equals(result.getCust_grade())) { %>
        <div style="text-align: center; margin-top: 20px;">
            <a href="<%= request.getContextPath() %>/noticeInsert.do" class="update-btn">공지사항 등록</a>
        </div>
    <% } %>
	
	
	<!-- 페이지네이션 -->
    <div class="pagination">
        <% for (int i = 1; i <= totalPages; i++) { %>
            <a href="<%= request.getContextPath() %>/noticeList.do?page=<%= i %>"
               class="<%= i == currentPage ? "active" : "" %>"><%= i %></a>
        <% } %>
    </div>

    <div class="button-container">
	    <a href="<%=request.getContextPath() %>/index.jsp" class="home-button">첫 화면으로 돌아가기</a>
	</div>
</body>
</html>
