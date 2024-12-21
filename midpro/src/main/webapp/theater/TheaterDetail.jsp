<%@page import="java.util.Collections"%>
<%@page import="Vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@page import="Vo.TheaterVO"%>
<%@page import="Vo.CustomerVO"%>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Insert title here</title>
    <style>
        /* 전체 화면 사이즈 */
        #main {
            position: relative;
            left: 2px;
        }

        body {
            margin: 0;
            width: 100%;
            overflow-x: hidden;
            background: gold;
        }

        div {
            border: 2px solid black; /* 모든 div 요소에 검은색 테두리 추가 */
        }

        .name {
            margin-left: 260px;
            color: white;
        }

        #detail {
            color: white;
            margin-left: 260px;
            width: 1360px;
            height: 600px;
            background-color: rgb(52, 52, 52);
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 가로 방향 가운데 정렬 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            position: relative;
        }

        .information {
            width: 1360px;
            height: 180px;
            background-color: black;
            position: absolute;
            bottom: 0;
            opacity: 70%;
            font-weight: bold;
        }

        .vertical-line {
            width: 2px; /* 세로줄의 두께 */
            height: 70%; /* 세로줄의 높이를 70%로 변경 */
            background-color: white; /* 세로줄의 색상 */
            position: absolute;
            left: 50%; /* 가운데 정렬 */
            top: 50%; /* 세로 방향 가운데 정렬 */
            transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
            opacity: 80%
        }

        #transportation {
            margin-left: 260px;
            width: 1360px;
            height: 250px;
            background-color: transparent; /* 'non'은 유효한 색상이 아닙니다. 'transparent'로 수정 */
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 세로 방향 가운데 정렬 */
            align-items: flex-start; /* 가로 방향 왼쪽 정렬 */
            position: relative;
            border-radius: 20px;
            border: 2px solid gray;
            flex-direction: column; /* 세로 방향으로 정렬 */
        }
        
        #schedule {
            margin-left: 260px;
            width: 1360px;
/*             height: 250px; */
            background-color: transparent; /* 'non'은 유효한 색상이 아닙니다. 'transparent'로 수정 */
            display: flex; /* Flexbox 사용 */
            justify-content: center; /* 세로 방향 가운데 정렬 */
            align-items: flex-start; /* 가로 방향 왼쪽 정렬 */
            position: relative;
            border-radius: 20px;
            border: 2px solid gray;
            flex-direction: column; /* 세로 방향으로 정렬 */
            padding: 20px;
        }

		.transport-item {
		    display: flex; /* Flexbox 사용 */
		    align-items: center; /* 세로 방향 가운데 정렬 */
		    margin-top: 20px;
		    margin-bottom: 20px;
		}
		
		.bus, .subway {
		    width: 80px; /* 너비 설정 */
		    height: 80px; /* 높이 설정 */
		    background-size: cover; /* 배경 이미지 크기 조정 */
		    background-position: center; /* 배경 이미지 중앙 정렬 */
		    margin-right: 40px; /* 아이콘과 텍스트 사이의 여백 */
		    margin-left: 20px;
		}
		
		.transport-text {
		    color: white; /* 텍스트 색상 */
		    font-size: 23px; /* 텍스트 크기 조정 */
		}
		#map{
		    margin-left: 260px;
		    margin-top: 50px;
		}
		#price{
			margin-left: 260px;
		}
    </style>
</head>
<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>

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

    
    <h3 class="name">DGV <%=tnm %></h3>
    <div id="detail" style="background-image: url('<%=request.getContextPath() %>/theaterImage.do?theaterName=<%=vo.getTheater_name() %>'); background-size: cover; background-position: center;">
        <div class="information">
            <div class="left-content" style="position: absolute; left: 0; width: 50%; height: 100%; padding: 20px; box-sizing: border-box;">
                <!-- 왼쪽에 입력할 내용 -->
                <p>DB주소 수정되면 코드 입력(신주소)<%-- <%=tadd %> --%><br></p>
                <p><%=ttel %><br>
                <%=tsc %></p>
            </div>
            <div class="vertical-line"></div> 
            <div class="right-content" style="position: absolute; right: 0; width: 50%; height: 100%; padding: 20px; box-sizing: border-box;">
                <!-- 오른쪽에 입력할 내용 -->
                <p>공지사항+</p>
                <p><%=tno %></p>
            </div>
        </div>
    </div>
    <br>
    <br>

	<h3 class="name">DGV <%=tnm %> 오시는 길</h3>
	<div id="transportation" style="display: flex; align-items: flex-start; flex-wrap: wrap;
	 padding: 0 10px; height: 500px;">
	    <div class="transport-item" style="margin-right: 20px;">
	        <div class="bus" style="background-image: url('${pageContext.request.contextPath}/theater/아이콘 이미지/bus.png');"></div>
	        <span class="transport-text">버스<br>
	        <ul>
	            <li> <%= tbus %> </li>
	        </ul>
	        </span>
	    </div>
	    <div class="transport-item" style="margin-right: 20px;">
	        <div class="subway" style="background-image: url('${pageContext.request.contextPath}/theater/아이콘 이미지/subway.png');"></div>
	        <span class="transport-text">지하철<br>
	        <ul>
	            <li> <%= tsub %> </li>
	        </ul>
	        </span>
	    </div>
	    <!-- 지도 api 영역 -->
	    <div id="map" style="width: 500px; height: 400px;"></div>
	</div>
    <br>
    
    
    
<!-- 상영시간표영역 -->
<h3 class="name">DGV <%=tnm %> 오늘의 영화</h3>
<div id="schedule">
    <%
        List<ScheduleVO> scd = (List<ScheduleVO>)request.getAttribute("scd");
        if (scd != null && !scd.isEmpty()) {
            // 오늘 날짜 구하기 (yyyy.mm.dd 형식으로)
            Calendar today = Calendar.getInstance();
            String todayDate = String.format("%04d.%02d.%02d", 
                today.get(Calendar.YEAR), 
                today.get(Calendar.MONTH) + 1, 
                today.get(Calendar.DAY_OF_MONTH));

            // 오늘 날짜로 필터링
            List<ScheduleVO> filteredScd = new ArrayList<>();
            for (ScheduleVO schedule : scd) {
                String scheduleDate = schedule.getSchedule_date();
                
                // 디버깅: 날짜 출력
                System.out.println("오늘 날짜: " + todayDate + ", 스케줄 날짜: " + scheduleDate);
                
                if (scheduleDate.equals(todayDate)) {
                    filteredScd.add(schedule);
                }
            }

            // 상영 시간으로 정렬
            Collections.sort(filteredScd, new Comparator<ScheduleVO>() {
                @Override
                public int compare(ScheduleVO s1, ScheduleVO s2) {
                    return s1.getStart_time().compareTo(s2.getStart_time());
                }
            });

            if (!filteredScd.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>영화 제목</th>
                <th>상영 시간</th>
                <th>상영관 이름</th>
                <th>상영 타입</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (ScheduleVO schedule : filteredScd) {
            %>
                <tr>
                    <td><%= schedule.getMovie_name() %></td>
                    <td><%= schedule.getStart_time() %></td>
                    <td><%= schedule.getScreen_name() %></td>
                    <td><%= schedule.getScreen_type() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            } else {
    %>
        <p>오늘 상영 시간이 없습니다.</p>
    <%
            }
        } else {
    %>
        <p>상영 시간이 없습니다.</p>
    <%
        }
    %>
</div>
    <br>
    
        
    <!-- 요금표 버튼 -->
    <button id="price" onclick="openRateTable()">요금표 보기</button>    
    <br>
    
	<%@ include file="/main/Bottom.jsp" %>
	
	
	
	
    <!-- 실제 지도를 그리는 Javascript API -->
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b988732ec0d52355546afa135081f218"></script>
    <script>
        var container = document.getElementById('map'); // 지도를 표시할 영역(div)
        var options = { // 지도 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>), // 지도의 중심좌표 
            level: 3 // 지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

        // 마커 표시하기 --------------------------------------------------------------------------------------
        var markerPosition = new kakao.maps.LatLng(<%=tspot1 %>, <%=tspot2 %>); // 마커가 표시될 위치
        var marker = new kakao.maps.Marker({ // 마커 생성
            position: markerPosition
        });

        marker.setMap(map); // 마커가 지도 위에 표시되도록 설정

        // 컨트롤 올리기 ---------------------------------------------------------------------------------------
        var mapTypeControl = new kakao.maps.MapTypeControl(); // 지도 타입 전환할 수 있는 컨트롤 생성
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도에 타입컨트롤 추가, 표시 위치 설정
        var zoomControl = new kakao.maps.ZoomControl(); // 확대축소 제어할 줌 컨트롤 생성
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 지도에 줌컨트롤 추가, 표시 위치 설정

        
        
        
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

</body>
</html>
