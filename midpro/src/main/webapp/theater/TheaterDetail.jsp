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
                            <td>조조 및 심야</td>
                            <td>14,000원</td>
                        </tr>
                    </table>
                    <br>
                    <button id="closeBtn" onclick="window.close()">닫기</button>
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
		String tno = vo.getTheater_notice();
		String tsc = vo.getTheater_screen();
		String tbus = vo.getTheater_bus();
		String tsub = vo.getTheater_sub();
		String tspot1 = vo.getTheater_spot1();
		String tspot2 = vo.getTheater_spot2();
	%>
<!-- 영화관 정보 영역 -->
	<h3><%=tnm %></h3>
	*공지*<br>
	<%=tno %><br><br>
	
	이미지 자리 : <br>	
	<img src="<%=request.getContextPath() %>/theaterImage.do?theaterName=
				<%=vo.getTheater_name() %>" width="1000" height="500">
	<br><br>
	
	
	주소 : <%=tadd %><br><br>
	전화번호 : <%=ttel %><br><br>
	상영관 : <%=tsc %><br><br>
	교통 정보 <br>
	 버스 : <%=tbus %><br>
	 지하철 : <%=tsub %><br>	
	<hr><br>
	
	
	
<!-- 지도 api 영역 -->
	<div id="map" style="width:500px;height:400px;"></div>
	<!-- 실제 지도를 그리는 Javascript API -->
	<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b988732ec0d52355546afa135081f218"></script>
	<script>
		var container = document.getElementById('map');				// 지도를 표시할 영역(div)
		var options = {												// 지도 생성할 때 필요한 기본 옵션
				
// 			center: new kakao.maps.LatLng(36.321059, 127.408915),	// 지도의 중심좌표
			center: new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>),	// 지도의 중심좌표 
			
			level: 3												// 지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options);			// 지도 생성 및 객체 리턴
		
				
		// 마커 표시하기 --------------------------------------------------------------------------------------
		var markerPosition  = new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>); // 마커가 표시될 위치

		var marker = new kakao.maps.Marker({						// 마커 생성
		    position: markerPosition
		});

		marker.setMap(map); 										// 마커가 지도 위에 표시되도록 설정
		//marker.setMap(null);										// 마커 제거 코드
		
		// 컨트롤 올리기 ---------------------------------------------------------------------------------------
		var mapTypeControl = new kakao.maps.MapTypeControl(); 		// 지도 타입 전환할 수 있는 컨트롤 생성
		
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도에 타입컨트롤 추가, 표시 위치 설정
		
		var zoomControl = new kakao.maps.ZoomControl();				// 확대축소 제어할 줌 컨트롤 생성
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);		 // 지도에 줌컨트롤 추가, 표시 위치 설정
		
	</script>

	
	
	<hr><br>
	<input type="button" id="timeBtn" value="상영시간표">
	<button onclick="openRateTable()">요금표 보기</button>
	<br>
	


	
	
</body>
</html>