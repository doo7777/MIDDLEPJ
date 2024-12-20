<%@page import="Vo.NoticeVO"%>
<%@page import="java.util.List"%>
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
    </style>
</head>
<body>
    <h1 style="text-align: center;">공지사항</h1>

    <form action="deleteNotice.do" method="post">
        <button type="submit" class="bulk-delete-btn">일괄 삭제</button>
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
                List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
                if (noticeList != null) {
                    for (NoticeVO notice : noticeList) {
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
