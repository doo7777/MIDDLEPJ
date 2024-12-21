<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>영준개인 테스트 공간</h2>
<a href="<%=request.getContextPath() %>/customerList.do">회원 목록 보기</a><br><br>
<a href="<%=request.getContextPath() %>/noticeList.do">공지글 리스트</a><br><br>
<a href="<%=request.getContextPath() %>/noticeInsert.do">공지글(Notice)등록하기</a><br><br>
<a href="<%=request.getContextPath() %>/movieList.do">영화리스트 조회</a>

<br><br>

<a href="<%=request.getContextPath() %>/oneBoardInsert.do">1:1문의 등록</a><br><br>
<a href="<%=request.getContextPath() %>/oneBoardList.do">1:1문의 리스트</a><br><br>

</body>
</html>