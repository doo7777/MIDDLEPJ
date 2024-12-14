<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: black;
            }
            .container {
                display: flex; /* flexbox 사용 */
                flex-direction: column; /* 수직 정렬 */
                align-items: center; /* 가운데 정렬 */
                width: 100%; /* 부모 요소의 너비에 맞게 조정 */
                max-width: 900px; /* 최대 너비 설정 */
                margin: 50px auto;
                background: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin: 10px 0 5px;
                font-weight: bold;
            }
            input[type="text"],
            input[type="password"],
            input[type="email"],
            input[type="date"],
            input[type="tel"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
                width: 85%; /* 부모 요소의 너비에 맞게 조정 */
                max-width: 528px; /* 최대 너비 설정 */
                box-sizing: border-box; /* 패딩과 테두리를 포함하여 너비 계산 */
            }

            button {
                padding: 10px;
                border: none;
                border-radius: 5px;
                background: #ef8400;
                color: #fff;
                font-size: 1rem;
                cursor: pointer;

            }
            button:hover {
                background: #ef8400;
            }
            #cust_post{
                width: 100px;
            }
            #cust_add{
                width: 403px;
            }
            #id{
                display :inline-block;
            }
            #join {
                width: 100%; /* 부모 요소의 너비에 맞게 조정 */
                position: relative;
                left: 650px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <img src="../DGV/Sorce/img/DGV-로고.png" alt="로고" class="logo" width ="100px">
            <h1>회원가입</h1>
            
    <!-- <%--         <form action="<%=request.getContextPath() %>/cussignup.do" method="post"> --%> -->
            <form onsubmit="goMain(event)">
            <label for="cust_id">아이디<span class="rq"> * <span id="disp"></span></span></label>
            <div id="id">
                <input type="text" id="cust_id" name="cust_id" required placeholder="ID를 입력하세요." pattern="[a-zA-Z][a-zA-Z0-9]{2,7}">
                            
                 <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
                </div>
                <label for="cust_pw">비밀번호<span class="rq"> *</span></label>
                <input type="password" id="cust_pw1" name="cust_pw" required placeholder="비밀번호를 입력하세요." 
                 pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&amp;\*\(\)_\+\|]).{8,}">
                 
                 <label for="cust_pw">비밀번호 확인<span class="rq"> *</span></label>
                <input type="password" id="cust_pw2" name="cust_pw" required placeholder="비밀번호를 입력하세요." 
                 pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%\^&amp;\*\(\)_\+\|]).{8,}"> 
                 
                <label for="cust_name">이름<span class="rq"> *</span></label>
                <input type="text" id="cust_name" name="cust_name" required placeholder="이름을 입력하세요."   pattern="^[가-힣]+$">
    
                <label for="cust_bir">생년월일<span class="rq"> *</span></label>
                <input type="date" class="form-control" id="bir" name="cust_bir" required>
                
                <label for="cust_email">이메일<span class="rq"> *</span></label>
                <input type="email" id="cust_email" name="cust_email" required placeholder="이메일을 입력하세요." pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z]+){1,2}">
                
                <label for="cust_tel">전화번호<span class="rq"> *</span></label>  
                <div>
                <input type="tel" id="cust_tel" name="cust_tel" required placeholder="010-0000-0000" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{4}">
                <button type="button" id="sucbutton">본인인증</button>   <span id="suc"></span>
                </div>

                <label for="cust_post">주소<span class="rq"> *</span></label>
                <div class="tel-container">
                <input type="text" id="cust_post" name="cust_post" required placeholder="우편번호" readonly>
                <input type="text" id="cust_add" name="cust_add" required placeholder="주소를 입력하세요." readonly>
                <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
                </div>
                <label for="cust_detailAdd">상세주소<span class="rq"> *</span></label>
                <input type="text" id="cust_detailAdd" name="cust_detailAdd" required placeholder="상세주소를 입력하세요.">
                <br>
                <div id="join">
                <button type="submit" >회원가입</button>
                </div>
            </form>
        </div>
    </body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.6.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>

function goMain(e) {
    e.preventDefault();
    
    const data = $('form').serialize();  // key=value...로 문자열 정보를 만들어서

    $.ajax({ 
        url: '/midpro/cussignup.do',
        type: 'post',
        data: data,
        success: function(resp) {
            // 응답결과에 대해 분기처리해주자
            if (resp > 0) {
                alert("회원 가입 성공하였습니다");
                // 성공 상태를 로컬 스토리지에 저장
                localStorage.setItem('signupSuccess', 'true');
                // 회원 가입 성공 시에만 location.href를 설정
                location.href = "<%=request.getContextPath() %>/main/main.jsp?bar=on";
            } else {
                alert("회원 가입 실패하였습니다");
            }
        },
        error: function(xhr) {
            alert(xhr.status);
        }
        // ,dataType:'text' 
    }); 
}

// 페이지가 로드될 때 성공 상태를 확인
$(document).ready(function() {
    if (localStorage.getItem('signupSuccess') === 'true') {
        // 성공 상태가 있으면 로컬 스토리지에서 제거
        localStorage.removeItem('signupSuccess');
    } else {
        // 성공 상태가 없으면 다른 로직을 실행
    }
});

// window.onload = function() {
<%--     var message = "<%= request.getAttribute("registrationMessage") %>"; --%>
//     alert(message);
//     // 알림창을 닫은 후 메인 페이지로 이동
<%--     window.location.href = "<%= request.getContextPath() %>/main/main.jsp"; --%>
// };

//주소 검색 이벤트
$('#addrBtn').on('click',addr);

function addr() {
     new daum.Postcode({
         oncomplete: function(data) {
           
             document.getElementById('cust_post').value = data.zonecode;   //우편번호
             // jsp파일은 백틱을 사용한 탬플릿리터럴과 el tag형식이 사용해 충돌될 수 있으므로 백틱 사용시 $앞쪽에 \(백슬래시)를 붙여 쓰자
             document.getElementById("cust_add").value = data.roadAddress + "(" + data.jibunAddress + ")"; //도로명 주소
             document.getElementById("sample4_jibunAddress").value = data.jibunAddress; //지번 주소
             
         }
     }).open();
 }

//id중복검사
$('#idChk').on('click',function(){
//  $('#id').on('keyup',function(){});
    
    //id영역의 입력 값 얻기
    const idVal = $('#cust_id').val();
    
    //서버위치로 보내주기 - 비동기통신(AJAX) 이용해서 현재 페이지로 응답 받을 예정..
    $.ajax({
       url: '/midpro/customer/idChk.jsp',   //현재 위치로 요청보내고 다시 응답받을 예정..
       type: 'get',
       //data: "userId=" + idVal,
       data: {userId: idVal},   //객체 형식으로 정보 전달해도 key=value(url인코딩)형식으로 넘어감
       success:function(rst){
          console.log(rst);
          //id=disp영역에 결과 출력하기
          if(rst.rst == "ok"){
             $('#disp').text("사용가능").css('color','green');
          }else{
             $('#disp').text("사용불가").css('color','red');               
          }
       },
       error:function(xhr){
          alert(xhr.status);
       }
       ,dataType: 'json'
    });
 });
 
function requestIdentityVerification() {
	  PortOne.requestIdentityVerification({
	    storeId: "store-d05ec83a-78ae-4fdc-891b-bb5b43d7fc72",
	    identityVerificationId: "test_m4metadw",
	    channelKey: "channel-key-a66412a6-d0c1-436b-a5f0-0dfa0cedf2cd",
	    
	  });
	}
 $('#sucbutton').on('click',requestIdentityVerification);
 
//  const response = await PortOne.requestIdentityVerification({
// 	  /* 객체 생략 */
// 	  alert("인증 완료");
// 	});
// 	// 프로세스가 제대로 완료되지 않은 경우 에러 코드가 존재합니다
// 	if (response.code !== undefined) {
// 	  return alert(response.message);
// 	}

// 	const verificationResult = await fetch("{서버의 인증 정보를 받는 endpoint}", {
// 	  method: "POST",
// 	  headers: { "Content-Type": "application/json" },
// 	  body: JSON.stringify({
// 	    identityVerificationId,
// 	  }),
// 	});
	
// 	PortOne.requestIdentityVerification({
// 		  /* 파라미터 생략 */
// 		  redirectUrl: `${BASE_URL}/identity-verification-redirect`,
// 		});
 
</script>
</html>