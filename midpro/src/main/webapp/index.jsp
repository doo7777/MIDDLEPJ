<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath() %>/customerList.do">회원 목록 보기</a><br><br>
<a href="<%=request.getContextPath() %>/noticeList.do">공지글 리스트</a><br><br>
<a href="<%=request.getContextPath() %>/noticeInsert.do">공지글(Notice)등록하기</a><br><br>
<a href="<%=request.getContextPath() %>/movieList.do">영화리스트 조회</a>
<a href="<%=request.getContextPath() %>/movieList.do">스케줄조회</a>

<br><br>

<a href="<%=request.getContextPath() %>/schedule.do">1:1문의 리스트</a>

</body>
</html>