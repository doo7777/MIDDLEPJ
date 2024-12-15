<%@page import="Vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
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
        .delete-btn {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
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
        .detail-section {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">공지사항</h1>

    <!-- 검색 폼 -->
    <form action="searchNotice.do" method="get" style="text-align: center; margin-bottom: 20px;">
        <input type="text" name="title" placeholder="제목 검색" style="padding: 5px; width: 200px;">
        <button type="submit" style="padding: 5px 10px;">검색</button>
    </form>

    <!-- 삭제 처리 폼 -->
    <form action="deleteNotice.do" method="post">
        <!-- 일괄 삭제 버튼 -->
        <button type="submit" name="action" value="bulk-delete" class="bulk-delete-btn">일괄 삭제</button>

        <table>
            <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
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

                // 선택된 notice_id로 NoticeVO 찾기
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
                <!-- 체크박스 추가 -->
                <td><input type="checkbox" name="notice_ids" value="<%=notice.getNotice_id() %>"></td>
                <td><%=notice.getNotice_id() %></td>
                <td><%=notice.getNotice_sort() %></td>
                <td>
                    <!-- 제목 클릭 시 notice_id 전달 -->
                    <a href="?notice_id=<%=notice.getNotice_id() %>"><%=notice.getTitle() %></a>
                </td>
                <td><%=notice.getPost_date() %></td>
                <td><%=notice.getNotice_view() %></td>
                <td>
                    <!-- 개별 삭제 버튼 -->
                    <form action="deleteNotice.do" method="post" style="margin: 0;">
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

    <% 
        // 상세보기 영역 출력
        if (selectedNotice != null) {
    %>
    <div class="detail-section">
        <h2>게시글 상세보기</h2>
        <p><strong>번호:</strong> <%= selectedNotice.getNotice_id() %></p>
        <p><strong>구분:</strong> <%= selectedNotice.getNotice_sort() %></p>
        <p><strong>제목:</strong> <%= selectedNotice.getTitle() %></p>
        <p><strong>내용:</strong> <%= selectedNotice.getContent() %></p>
        <p><strong>등록일:</strong> <%= selectedNotice.getPost_date() %></p>
        <p><strong>조회수:</strong> <%= selectedNotice.getNotice_view() %></p>
        <a href="<%=request.getContextPath() %>/noticeList.do">목록으로 돌아가기</a>
    </div>
    <% 
        }
    %>

    <script>
        // "전체 선택" 체크박스 기능 추가
        document.getElementById("selectAll").addEventListener("click", function() {
            const checkboxes = document.querySelectorAll('input[name="notice_ids"]');
            checkboxes.forEach(checkbox => checkbox.checked = this.checked);
        });
    </script>

    <a href="<%=request.getContextPath() %>/index.jsp">첫 화면으로 돌아가기</a>
</body>
</html>
