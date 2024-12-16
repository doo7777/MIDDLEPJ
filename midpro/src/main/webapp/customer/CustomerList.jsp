<%@page import="Vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원 리스트</title>
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
    <h1 style="text-align: center;">회원 리스트</h1>
    <table>
        <thead>
        <tr>
            <th>회원ID</th>
            <th>비밀번호 ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>우편번호</th>
            <th>주소</th>
            <th>상세주소</th>
            <th>등급</th>
            <th>활동여부</th>
        </tr>
        </thead>
        <tbody>
        <% 
            List<CustomerVO> custs = (List<CustomerVO>) request.getAttribute("custs");
            if (custs != null) {
                for (CustomerVO cust : custs) {
        %>
        <tr>
            <td><%= cust.getCustomer_id()%></td>
            <td><%= cust.getCust_pw()%></td>
            <td><%= cust.getCust_name()%></td>
            <td><%= cust.getCust_email()%></td>
            <td><%= cust.getCust_tel()%></td>
            <td><%= cust.getCust_postcode()%></td>
            <td><%= cust.getCust_add()%></td>
            <td><%= cust.getCust_detailadd() %></td>
            <td><%= cust.getCust_grade()%></td>
            <td><%= cust.getCust_delete() %></td>
        </tr>
        <% 
                }
            }
        %>
    </tbody>
    </table>
    <a href="<%=request.getContextPath() %>/index.jsp">첫 화면으로 돌아가기</a>
</body>
</html>