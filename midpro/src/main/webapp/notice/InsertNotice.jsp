<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        select,
        textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
        textarea {
            resize: vertical;
            height: 100px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>공지사항 게시판</h1>
        <form action="noticeInsert.do" method="post">
            <!-- 번호는 자동 생성될 수 있으므로 입력하지 않음 -->
            
            <label for="notice_sort">구분:</label>
            <select id="notice_sort" name="notice_sort" required>
                <option value="">선택하세요</option>
                <option value="시스템점검">시스템점검</option>
                <option value="극장">극장</option>
                <option value="행사/이벤트">행사/이벤트</option>
                <option value="기타">기타</option>
            </select>

            <label for="title">제목:</label>
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
            <button type="submit">등록</button>
            <a href="<%=request.getContextPath() %>/index.jsp">첫화면으로 이동</a>
        </form>
    </div>
</body>
</html>