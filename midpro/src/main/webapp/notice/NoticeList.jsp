<%@page import="Vo.NoticeVO"%>
<%@page import="Vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <style>
	    body {
            background-color: black; /* 배경 검정색 */
            color: white; /* 글자 흰색 */
            font-family: Arial, sans-serif;
        }

		h1 {
	        text-align: center;
	        color: white; /* 글자 색깔 검정색 */
	    }
	    
	    .bulk-delete-btn {
            display: block;
            width: 150px;
            margin: 20px auto;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
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
            text-decoration: none; /* 밑줄 제거 */
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
		.delete-btn, .update-btn, .bulk-delete-btn {
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            text-decoration: none; /* 밑줄 제거 */
        }
        .delete-btn {
            background-color: #ff4d4d;
        }
        .update-btn {
            background-color: #007bff;
        }
        .bulk-delete-btn {
            background-color: white;
            color: black;
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
        }
        
        /* 링크 기본 스타일 */
	a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: white; /* 글자색 흰색 */
	}
	
	/* 링크 호버 시 스타일 */
	a:hover {
	    text-decoration: none; /* 호버 시에도 밑줄 제거 */
	    color: #d32f2f; /* 호버 시 색상 변경 (선택 사항) */
	}
    </style>
</head>
<body>
	<% CustomerVO result = (CustomerVO) session.getAttribute("ok"); %>
    <h1>공지사항</h1>
    
    <!-- 검색 폼 -->
    <form action="searchNotice.do" method="get" style="text-align: center; margin-bottom: 20px;">
        <input type="text" name="title" placeholder="제목 검색" style="padding: 5px; width: 200px;">
        <button type="submit" class="update-btn">검색</button>
    </form>
	
	<% if (result != null && "관리자".equals(result.getCust_grade())) { %>
    <button type="submit" class="bulk-delete-btn">일괄 삭제</button>
    <% } %>
    <!-- 공지사항 테이블 -->
    <div class="table-container">
	    <form action="deleteNotice.do" method="post" class="">
	        <table>
	            <thead>
	            <tr>
	                <th><input type="checkbox" id="selectAll"></th>
	                <th>번호</th>
	                <th>구분</th>
	                <th>제목 ID</th>
	                <th>등록일</th>
	                <th>조회수</th>
	              	<% if (result != null && "관리자".equals(result.getCust_grade())) { %>
	                <th>삭제</th>
	                <% } %>
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
	                    for (int i = start; i < end; i++) {
	                        NoticeVO notice = noticeList.get(i);
	                
	            %>
	            <tr>
	                <td><input type="checkbox" name="notice_ids" value="<%=notice.getNotice_id() %>"></td>
	                <td><%=notice.getNotice_id() %></td>
	                <td><%=notice.getNotice_sort() %></td>
	                <td><a href=""><%=notice.getTitle() %></td>
	                <td><%=notice.getPost_date() %></td>
	                <td><%=notice.getNotice_view() %></td>
	                    <% if (result != null && "관리자".equals(result.getCust_grade())) { %> 
	                <td>
	                    <!-- 게시글 삭제 버튼 -->
	                    <form action="deleteNotice.do" method="post" style="margin: 0;">
	                        <!-- notice_id를 hidden 필드로 전송 -->
	                        <input type="hidden" name="notice_id" value="<%= notice.getNotice_id() %>">
	                        <button type="submit" class="delete-btn">삭제</button>
	                    </form>
	                </td>
	                    <% } %>
	            </tr>
	            <% 
	                    }
	                }
	            %>
	            </tbody>
	        </table>
	    </form>
	</div>
	
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
	
	<!-- 페이지네이션 -->
    <div class="pagination">
        <% for (int i = 1; i <= totalPages; i++) { %>
            <a href="<%= request.getContextPath() %>/noticeList.do?page=<%= i %>"
               class="<%= i == currentPage ? "active" : "" %>"><%= i %></a>
        <% } %>
    </div>
    <script>
	    function showUpdateForm() {
	        document.getElementById("updateForm").style.display = "block";
	    }
	
	    function hideUpdateForm() {
	        document.getElementById("updateForm").style.display = "none";
	    }
        // "전체 선택" 체크박스 기능 추가
        document.getElementById("selectAll").addEventListener("click", function() {
            const checkboxes = document.querySelectorAll('input[name="notice_ids"]');
            checkboxes.forEach(checkbox => checkbox.checked = this.checked);
        });
    </script>
</body>
</html>
