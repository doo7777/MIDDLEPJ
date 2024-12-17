
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    #bottom {
        height: 250px; /* 하단 영역의 높이 설정 */
    }
    .bottom_line {
        margin-top: 100px;
    }
    #company {
		height: 150px; /* 회사 정보 영역의 높이 설정 */
		color: white;

		margin: 0; /* 기본 여백 제거 */
		margin-top: 50px; /* 위쪽 여백 */
		text-align: center;
		overflow: hidden; /* 내용이 잘리도록 설정 */
		position: absolute; /* 절대 위치 설정 */
		transform: translateX(100%);
	}
    
</style>
<body>
    <hr class="bottom_line">
    <div id="company" class="sect-ad">
        <div class="company_text">
            <address>(34908)대전광역시 중구 계룡로 846, 3-4층</address>
            <dt>이사장 : 김형응&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호 : 306-82-05291&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대표전화 : 042-222-8202</dt>
            &copy; DGV. All Rights Reserved
        </div>
    </div>
</body>
</html>
