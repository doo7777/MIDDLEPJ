<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
	body {
		background-color: black;
	}

    table {
        border-collapse: collapse;
        text-align: center;
        width: 60%;
        height: 800px;
        font-size: 12px;
        margin: auto;
        
    }
    #topOfTable {
        height: 30px;
        color: white;
        
    }
    td {
        position: relative; /* 버튼을 오른쪽 하단으로 배치하기 위한 설정 */
    }    
    #middleOfTable {
        height: 200px;
        color: white;
    }
    #count {
        width: 45%; 
    }
    #count .max6 {
        position: absolute;
        top: 10px;
        right: 10px;
        color: red;
    }

    #theater {
        width: 55%; 
        position: relative; /* 버튼을 오른쪽 하단으로 배치하기 위한 설정 */
        color: white;
    }
    .row {
        display: flex;
        align-items: center; /* 버튼과 텍스트를 수직으로 중앙 정렬 */
        justify-content: flex-start; /* 왼쪽 정렬 */
        margin-bottom: 10px; /* 각 줄 사이의 간격 */
    }
    .row span {
        width: 70px; /* 텍스트 칸의 고정된 너비 (좌측 정렬 유지) */
        text-align: right; /* 텍스트 오른쪽 정렬 */
        margin-right: 10px; /* 텍스트와 버튼 사이 간격 */
    }
    button {
        font-size: 12px;
        margin: 2px; /* 버튼 간에 여백 추가 */
    }
    #discountBtn, #changeTimeBtn {
        position: absolute;
        bottom: 10px;
        right: 10px;
    }
    #bottomOfTable {
        color: white;
    }
    
    
</style>
<body>
    <%@ include file="/main/Top.jsp" %>
    <div>
        <table border="1">
            <thead>
              <tr id="topOfTable">
                <th colspan="2">인원/좌석</th>
              </tr>
            </thead>
            <tbody>
              <tr id="middleOfTable">
                <td id="count">
                    <div class="max6">*최대 6명 선택 가능</div>
                    <div class="row">
                            <span>일반</span> 
                            <button>0</button> <button>1</button> <button>2</button>
                            <button>3</button> <button>4</button> <button>5</button> <button>6</button>
                    </div>
                    <div class="row">
                        <span>청소년</span> 
                        <button>0</button> <button>1</button> <button>2</button> 
                        <button>3</button> <button>4</button> <button>5</button> <button>6</button><br>
                    </div>
                    <div class="row">
                        <span>경로</span> 
                        <button>0</button> <button>1</button> <button>2</button> 
                        <button>3</button> <button>4</button> <button>5</button> <button>6</button><br>
                    </div>
                    <div class="row">
                    <span>우대</span> 
                    <button>0</button> <button>1</button> <button>2</button> 
                    <button>3</button> <button>4</button> <button>5</button> <button>6</button>
                    </div>
                    <button id="discountBtn">관람 할인 안내</button>
                </td>
                <td id="theater">
                	상영관 정보칸
                	<button id="changeTimeBtn">상영시간 변경</button>
                </td>
              </tr>
              <tr id="bottomOfTable">
                <td colspan="2">좌석자리표 칸</td>
              </tr>
            </tbody>
          </table>
    </div>
    <!-- 모달 팝업 -->
    <div id="discountModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>관람 할인 안내</h2>
        </div>
    </div>
    <%@ include file="/main/Bottom.jsp" %>
</body>
<script>
    // 버튼 배경색 바꾸는 이벤트
    document.querySelectorAll("button").forEach((button) => {
        // discountBtn, changeTimeBtn 버튼 제외
        if (button.id !== "discountBtn" && button.id !== "changeTimeBtn") {
            button.addEventListener("click", (event) => {
                // 버튼 초기화
                document.querySelectorAll("button").forEach((btn) => {
                    btn.style.backgroundColor = ""; 
                    btn.style.color = ""; 
                });

                // 클릭한 버튼 배경색 입히기
                event.target.style.backgroundColor = "black";
                event.target.style.color = "white";
            });
        }
    });
    
 	
</script>
</html>