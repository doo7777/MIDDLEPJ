<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
</head>
<body>
    <h1>회원 관리 시스템</h1>
    <a href="<%=request.getContextPath() %>/cusInsert.do">회원가입하기</a>
    
    <h1>가입회원 조회</h1>
    <a href="<%=request.getContextPath() %>/customerList.do">회원 목록 보기</a>
</body>
</html>