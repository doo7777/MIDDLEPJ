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
        .detail-section {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
    </style>
    <script>
        // 전체 선택 체크박스
        function toggleAll(source) {
            const checkboxes = document.querySelectorAll('input[name="oneonone_ids"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
        }
        // 삭제 확인
        function confirmDelete() {
            return confirm("선택한 게시물을 삭제하시겠습니까?");
        }

        // 상세보기 클릭 시 AJAX로 새로고침 없이 해당 문의글 가져오기
        function showDetail(oneonone_id) {
            location.href = "<%= request.getContextPath() %>/oneBoardList.do?oneonone_id=" + oneonone_id;
        }
    </script>
</head>
<body>
    <h1 style="text-align: center;">1:1 문의 게시판</h1>

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
                    <th>상태</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OneBoardVO> boardList = (List<OneBoardVO>) request.getAttribute("OneBoardList");
                    String selectedBoardId = request.getParameter("oneonone_id");
                    OneBoardVO selectedBoard = null;

                    if (selectedBoardId != null && boardList != null) {
                        for (OneBoardVO board : boardList) {
                            if (selectedBoardId.equals(String.valueOf(board.getOneonone_id()))) {
                                selectedBoard = board;
                                break;
                            }
                        }
                    }

                    if (boardList != null && !boardList.isEmpty()) {
                        for (OneBoardVO board : boardList) {
                %>
                <tr>
                    <td><input type="checkbox" name="oneonone_ids" value="<%= board.getOneonone_id() %>"></td>
                    <td>
                        <!-- 상세보기 링크 -->
                        <a href="javascript:void(0)" onclick="showDetail('<%= board.getOneonone_id() %>')">
                            <%= board.getOneonone_id() %>
                        </a>
                    </td>
                    <td><%= board.getCustomer_id() %></td>
                    <td><%= board.getPerson_name() %></td>
                    <td><%= board.getQuestion_type() %></td>
                    <td><%= board.getSubject() %></td>
                    <td><%= board.getWritedate() %></td>
                    <td><%= board.getResponse_board_content() %></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/deleteOneBoard.do" method="post" style="display: inline;">
                            <input type="hidden" name="oneonone_id" value="<%= board.getOneonone_id() %>">
                            <button type="submit">삭제</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="9">등록된 문의가 없습니다.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </form>

    <% if (selectedBoard != null) { %>
    <!-- 상세보기 영역 -->
    <div class="detail-section" id="detailSection">
        <h2>게시글 상세보기</h2>
        <p><strong>게시글 번호:</strong> <%= selectedBoard.getOneonone_id() %></p>
        <p><strong>회원 ID:</strong> <%= selectedBoard.getCustomer_id() %></p>
        <p><strong>이름:</strong> <%= selectedBoard.getPerson_name() %></p>
        <p><strong>문의 유형:</strong> <%= selectedBoard.getQuestion_type() %></p>
        <p><strong>제목:</strong> <%= selectedBoard.getSubject() %></p>
        <p><strong>작성 날짜:</strong> <%= selectedBoard.getWritedate() %></p>
        <p><strong>상태:</strong> <%= selectedBoard.getResponse_board_content() %></p>
        <p><strong>답변내용:</strong> <%= selectedBoard.getRes_board() %></p>

        <!-- 답글 작성 폼 -->
        <form action="<%= request.getContextPath() %>/replyOneboard.do" method="post">
            <input type="hidden" name="oneonone_id" value="<%= selectedBoard.getOneonone_id() %>">
            <label>답글 내용:</label><br>
            <textarea name="res_board" rows="5" style="width: 100%;" required></textarea><br><br>
            <button type="submit">답글 달기</button>
        </form>

        <a href="<%= request.getContextPath() %>/oneBoardList.do">목록으로 돌아가기</a>
    </div>
    <% } %>
</body>
</html>
ㅋ