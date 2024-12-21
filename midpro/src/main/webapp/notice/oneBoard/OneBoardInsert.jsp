<%@ page import="Vo.CustomerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의 등록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .form-container {
            width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-group textarea {
            resize: vertical;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
   HttpSession sessoin = request.getSession();
    CustomerVO loginSession = (CustomerVO) session.getAttribute("ok");

    if (loginSession == null) {
%>
    <h3 style="text-align: center;">로그인 정보가 없습니다. 로그인 후 다시 시도해주세요.</h3>
<%
    } else {
%>
    <div class="form-container">
        <h2>1:1 문의 등록</h2>
        <form action="<%= request.getContextPath() %>/oneBoardInsert.do" method="post">
            <div class="form-group">
                <label for="customer_id">고객 ID</label>
                <input type="text" id="customer_id" name="customer_id" 
                       value="<%= loginSession.getCustomer_id() %>" readonly>
            </div>

            <div class="form-group">
                <label for="person_name">이름</label>
                <input type="text" id="person_name" name="person_name" 
                       value="<%= loginSession.getCust_name() %>" readonly>
            </div>

            <div class="form-group">
                <label for="person_tel">전화번호</label>
                <input type="tel" id="person_tel" name="person_tel" 
                       placeholder="전화번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="person_email">이메일</label>
                <input type="email" id="person_email" name="person_email" 
                       value="<%= loginSession.getCust_email() %>" readonly>
            </div>

            <div class="form-group">
                <label for="question_type">문의 유형</label>
                <select id="question_type" name="question_type" required>
                    <option value="">-- 유형을 선택하세요 --</option>
                    <option value="일반 문의">일반 문의</option>
                    <option value="시설 문의">기술 지원</option>
                    <option value="결제 문의">결제 문의</option>
                    <option value="불만 접수">불만 접수</option>
                </select>
            </div>

            <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" id="subject" name="subject" 
                       placeholder="제목을 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="5" 
                          placeholder="문의 내용을 입력하세요" required></textarea>
            </div>

            <div class="form-group">
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
<%
    }
%>
</body>
</html>
