<%@page import="Vo.NoticeVO"%>
<%@page import="Vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 관리</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f4f4f4;
        }
        .delete-btn, .update-btn, .bulk-delete-btn {
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .delete-btn {
            background-color: #ff4d4d;
        }
        .update-btn {
            background-color: #007bff;
        }
        .bulk-delete-btn {
            background-color: #28a745;
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
        }
        .detail-section {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
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
    </form>

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

    <a href="<%=request.getContextPath() %>/index.jsp">첫 화면으로 돌아가기</a>
</body>
</html>
