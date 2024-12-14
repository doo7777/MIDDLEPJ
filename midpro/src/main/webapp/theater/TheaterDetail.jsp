<%@page import="Vo.TheaterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
        function openRateTable() {
            // 새 창을 열고 요금표 HTML을 작성
            var newWindow = window.open("", "요금표", "width=400,height=300");
            newWindow.document.write(`
                <html>
                <head>
                    <title>요금표</title>
                    <style>
                        body { font-family: Arial, sans-serif; }
                        table { width: 100%; border-collapse: collapse; }
                        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                        th { background-color: #f2f2f2; }
                    </style>
                </head>
                <body>
                    <h2>요금표</h2>
                    <table>
                        <tr>
                            <th>좌석</th>
                            <th>요금</th>
                        </tr>
                        <tr>
                            <td>일반석</td>
                            <td>16,000원</td>
                        </tr>
                        <tr>
                            <td>프리미엄</td>
                            <td>18,000원</td>
                        </tr>
                        <tr>
                            <td>조조</td>
                            <td>14,000원</td>
                        </tr>
                    </table>
                    <br>
                    <button onclick="window.close()">닫기</button>
                </body>
                </html>
            `);
            newWindow.document.close(); // 문서 작성 완료
        }
    </script>
</head>
<body>
	<h2>영화관 상세정보</h2>
	<br><hr><br>
	
	<%
		TheaterVO vo = (TheaterVO)request.getAttribute("theaterVo");  
		String tnm = vo.getTheater_name();
		String timg = vo.getTheater_img();
		String tadd = vo.getTheater_address();
		String ttel = vo.getTheater_tel();
	%>
	
	<h3><%=tnm %></h3>
	<input type="button" id="timeBtn" value="상영시간표">
	<button onclick="openRateTable()">요금표 보기</button>
	<br><br><hr><br>
	
	이미지 자리 : <%=timg %><br><br>	
	
	주소 : <%=tadd %><br><br>
	전화번호 : <%=ttel %><br><br>
	
	
	


	
	
</body>
</html>