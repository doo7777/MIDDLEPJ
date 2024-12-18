<%@page import="Vo.OneBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 게시판</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("선택한 게시물을 삭제하시겠습니까?");
        }
    </script>
</head>
<body>
    <h1>1:1 문의 게시판</h1>

    <!-- 여러 게시물 삭제 폼 -->
    <form action="<%= request.getContextPath() %>/deleteOneBoard.do" method="post" onsubmit="return confirmDelete();">
        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                    <th>게시글 번호</th>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>문의 유형</th>
                    <th>제목</th>
                    <th>작성 날짜</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OneBoardVO> boardList = (List<OneBoardVO>) request.getAttribute("OneBoardList");
                    if (boardList != null && !boardList.isEmpty()) {
                        for (OneBoardVO board : boardList) {
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="oneonone_ids" value="<%= board.getOneonone_id() %>">
                    </td>
                    <td>
                        <a href="<%= request.getContextPath() %>/oneBoardDetail.do?oneonone_id=<%= board.getOneonone_id() %>">
                            <%= board.getOneonone_id() %>
                        </a>
                    </td>
                    <td><%= board.getCustomer_id() %></td>
                    <td><%= board.getPerson_name() %></td>
                    <td><%= board.getQuestion_type() %></td>
                    <td><%= board.getSubject() %></td>
                    <td><%= board.getWritedate() %></td>
                    <td>
                        <!-- 단일 삭제 버튼 -->
                        <form action="<%= request.getContextPath() %>/deleteOneBoard.do" method="post" style="display: inline;">
                            <input type="hidden" name="oneonone_id" value="<%= board.getOneonone_id() %>">
                            <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8">등록된 문의가 없습니다.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <!-- 여러 게시물 삭제 버튼 -->
        <div style="text-align: right; margin-top: 10px;">
            <button type="submit">선택 삭제</button>
        </div>
    </form>

    <!-- 체크박스 전체 선택 스크립트 -->
    <script>
        function toggleAll(source) {
            const checkboxes = document.querySelectorAll('input[name="oneonone_ids"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
        }
    </script>
</body>
</html>
