<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 제출</title>
</head>
<body>
    <h2>영화 리뷰 작성</h2>
    <form action="/moviewReview.do" method="post">
        영화 ID: <input type="text" name="movieId" required><br>
        고객 ID: <input type="text" name="customerId" required><br>
        별점: <input type="number" name="revStar" min="1" max="5" required><br>
        내용: <textarea name="revContent" required></textarea><br>
        <input type="submit" value="제출">
    </form>
</body>
</html>