<%@page import="Vo.CustomerVO"%>
<%@page import="Vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
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
        .delete-btn, .update-btn {
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
    </script>
</head>
<%CustomerVO result = (CustomerVO)session.getAttribute("ok"); %> 
<body>
    <h1 style="text-align: center;">DGV 고객센터</h1>
    <!-- 검색 폼 -->  
    <div style="display: flex; align-items: center; margin-left: 200px;"><br><br>
    	<h2 style="margin: 0;">공지사항</h2> 
    	<% if (result != null && "관리자".equals(result.getCust_grade())) { %>
    <a href="<%= request.getContextPath() %>/noticeInsert.do">공지글(Notice) 등록하기</a>
		<% } %>
	</div>
<!-- 	<div style="display: flex; align-items: center; margin-right: 200px;"> -->
<!--     <form action="searchNotice.do" method="get" style="margin-left: 20px;"> -->
<!--         <input type="text" name="title" placeholder="제목 검색" style="padding: 5px; width: 200px;"> -->
<!--         <button type="submit" style="padding: 5px 10px;">검색</button> -->
<!--     </form> -->
<!--     </div> -->
    

    <table>
        <thead>
        <tr>
<!--             <th>번호</th> -->
            <th>유형</th>
            <th>제목</th>
            <th>등록일</th>
            <th>조회수</th>
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
<%--             <td><%=notice.getNotice_id() %></td> --%>
            <td><%=notice.getNotice_sort() %></td>
            <td>
                <!-- 제목 클릭 시 notice_id 전달 -->
                <a href="?notice_id=<%=notice.getNotice_id() %>"><%=notice.getTitle() %></a>
            </td>
            <td><%=notice.getPost_date() %></td>
            <td><%=notice.getNotice_view() %></td>
        </tr>
        <% 
                }
            }
        %>
        </tbody>
    </table>

    <% 
        // 상세보기 영역 출력
        if (selectedNotice != null) {
    %>
    <div class="detail-section">
        <h2>게시글 상세보기</h2>
<%--         <p><strong>번호:</strong> <%= selectedNotice.getNotice_id() %></p> --%>
        <p><strong>구분:</strong> <%= selectedNotice.getNotice_sort() %></p>
        <p><strong>제목:</strong> <%= selectedNotice.getTitle() %></p>
        <p><strong>내용:</strong> <%= selectedNotice.getContent() %></p>
        <p><strong>등록일:</strong> <%= selectedNotice.getPost_date() %></p>
        <p><strong>조회수:</strong> <%= selectedNotice.getNotice_view() %></p>

        <!-- 수정/삭제 버튼 -->
        <form action="deleteNotice.do" method="post" style="display: inline-block;">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <button type="submit" class="delete-btn">삭제</button>
        </form>
        <button onclick="showUpdateForm()" class="update-btn">수정</button>
        <a href="<%=request.getContextPath() %>/noticeList.do">게시글 목록으로 돌아가기</a>
    </div>

    <!-- 수정 폼 출력 -->
    <div class="detail-section" style="display: none;" id="updateForm">
        <h2>게시글 수정</h2>
        <form action="updateNotice.do" method="post">
            <input type="hidden" name="notice_id" value="<%= selectedNotice.getNotice_id() %>">
            <label>제목:</label>
            <input type="text" name="title" value="<%= selectedNotice.getTitle() %>" style="width: 100%;"><br><br>
            <label>내용:</label>
            <textarea name="content" rows="5" style="width: 100%;"><%= selectedNotice.getContent() %></textarea><br><br>
            
<!--             유형 수정 선택바 나오게 -->
            <label for="notice_sort">분류:</label>
<select id="notice_sort" name="notice_sort" required>
    <option value="">선택하세요</option>
    <option value="시스템점검" <%= selectedNotice.getNotice_sort().equals("시스템점검") ? "selected" : "" %>>시스템점검</option>
    <option value="극장" <%= selectedNotice.getNotice_sort().equals("극장") ? "selected" : "" %>>극장</option>
    <option value="행사/이벤트" <%= selectedNotice.getNotice_sort().equals("행사/이벤트") ? "selected" : "" %>>행사/이벤트</option>
    <option value="기타" <%= selectedNotice.getNotice_sort().equals("기타") ? "selected" : "" %>>기타</option>
</select>


            <button type="submit" class="update-btn">저장</button>
            <a href="<%=request.getContextPath() %>/notice/NoticeList.jsp"></a>
            <button type="button" onclick="hideUpdateForm()" class="cancel-btn">취소</button>
        </form>
    </div>
    <% 
        }
    %>
    <a href="<%=request.getContextPath() %>/index.jsp">첫 화면으로 돌아가기</a>
</body>
</html>
