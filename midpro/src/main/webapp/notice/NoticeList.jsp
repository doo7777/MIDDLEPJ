<%@page import="Vo.NoticeVO"%>
<%@page import="Vo.CustomerVO"%>
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
    </style>
</head>
<body>
    <h1 style="text-align: center;">공지사항</h1>
    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>구분</th>
            <th>제목 ID</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <% 
            List<NoticeVO> noticeList = (List<NoticeVO>) request.getAttribute("noticeList");
            if (noticeList != null) {
                for (NoticeVO notice : noticeList) {
        %>
        <tr>
        	<td><%=notice.getNotice_id() %></td>
        	<td><%=notice.getNotice_sort() %></td>
        	<td><%=notice.getTitle() %></td>
        	<td><%=notice.getPost_date() %></td>
        	<td><%=notice.getNotice_view() %></td>
        </tr>
        <% 
                }
            }
        %>
    </tbody>
    </table>
</body>
</html>