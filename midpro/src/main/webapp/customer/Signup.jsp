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
            width: 50%;
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
        }
        button {
/*             margin-top: 20px; */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #007BFF;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
            float:right;
            display: inline;
        }
        button:hover {
            background: #0056b3;
        }
        #cust_id, 
        #cust_post{
        width : 420px;
        }
        #id{
        display :inline-block;
        }
        #signup{
        display:flex;
        justify-content:center;
        width:500px;
        }
    </style>
</head>
<body>
    <div class="container">
   	    <img src="../main/sorce/img/DGV-로고.png" alt="로고" class="logo" width ="50px">
        <h1>회원가입</h1>
        
        <form onsubmit="goMain(event)">
        <label for="cust_id">아이디<span class="rq"> * <span id="disp"></span></span></label>
        <div id="id">
            <input type="text" id="cust_id" name="cust_id" required placeholder="ID를 입력하세요."
             pattern="[a-zA-Z][a-zA-Z0-9]{2,7}">
                        
             <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
			</div>
			<label for="cust_pw1">비밀번호<span class="rq"> *<span id="pwchk1"></span></span></label>
			<input type="password" id="cust_pw1" name="cust_pw1" required placeholder="비밀번호를 입력하세요." 
			       pattern="(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+\|]).{8,}">
			
			<label for="cust_pw2">비밀번호 확인<span class="rq"> *<span id="pwchk2"></span></span></label>
			<input type="password" id="cust_pw2" name="cust_pw2" required placeholder="비밀번호를 입력하세요."
			       onkeyup="checkPasswordMatch()"> <!-- 비밀번호 확인 onkeyup 이벤트 -->
             
            <label for="cust_name">이름<span class="rq"> *</span></label>
            <input type="text" id="cust_name" name="cust_name" required placeholder="이름을 입력하세요."   pattern="^[가-힣]+$">

		    <label for="cust_bir">생년월일<span class="rq"> *</span></label>
		    <input type="date" class="form-control" id="bir" name="cust_bir" required>
		    
            <label for="cust_email">이메일<span class="rq"> *</span></label>
            <input type="email" id="cust_email" name="cust_email" required placeholder="이메일을 입력하세요." pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z]+){1,2}">

            <label for="cust_tel">전화번호<span class="rq"> *</span></label>  
            <input type="tel" id="cust_tel" name="cust_tel" required placeholder="010-0000-0000" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{4}"><br>
            <button type=button id="sucbutton">본인 인증</button><span id="suc"></span>
           
            <label for="cust_post">우편번호<span class="rq"> *</span></label>
            <div>
            <input type="text" id="cust_post" name="cust_post" required placeholder="우편번호를 입력하세요.">
            
			<button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>
			</div>
			
            <label for="cust_add">주소<span class="rq"> *</span></label>
            <input type="text" id="cust_add" name="cust_add" required placeholder="주소를 입력하세요.">

            <label for="cust_detailAdd">상세주소<span class="rq"> *</span></label>
            <input type="text" id="cust_detailAdd" name="cust_detailAdd" required placeholder="상세주소를 입력하세요.">
            <br>
			<div id="join">
            <button type="submit" id='sign'>회원가입</button>
            </div>
        </form>
    </div>
    
</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.6.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>

<script>
function goMain(e) { //회원가입 버튼을 눌렀을때 작동되는 코드들
    e.preventDefault();
    
    const id = $('#cust_id').val();
    const pw1 = $('#cust_pw1').val();
    const pw2 = $('#cust_pw2').val();
   const name = $('#cust_name').val();

    if (id === '' || pw1 === '' || pw2 === '' || name === '') {
        alert('모든 필드를 채워주세요.');
        return; // 조건이 만족되지 않으면 진행하지 않음
    }

    if (pw1 !== pw2) {
        alert('비밀번호가 일치하지 않습니다.');
        $('#pwchk2').text("비밀번호 불일치").css('color','red');
        return;
    }

    if (!/^[a-zA-Z][a-zA-Z0-9]{2,7}$/.test(id)) {
        alert('아이디 형식이 올바르지 않습니다.');
        return;
    }

    if (!/(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+\|]).{8,}/.test(pw1)) {
        alert('비밀번호 형식이 올바르지 않습니다.');
        return;
    } 
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

function checkPasswordMatch() {
    const pw1 = $('#cust_pw1').val();
    const pw2 = $('#cust_pw2').val();
    
    // 비밀번호 형식이 올바르지 않으면 경고 메시지를 출력
    if (!/(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+\|]).{8,}/.test(pw1)) {
        $('#pwchk1').text("비밀번호 형식이 올바르지 않습니다. (대문자, 소문자, 숫자, 특수문자 포함 8자 이상)").css('color', 'red');
    } else {
        $('#pwchk1').text(""); // 형식이 올바르면 메시지 삭제
    }

    // 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (pw1 === pw2) {
        $('#pwchk2').text("비밀번호 일치").css('color', 'green');
    } else {
        $('#pwchk2').text("비밀번호 불일치").css('color', 'red');
    }
}
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
    if( $('#cust_id').val() == ''){
    	 $('#disp').text("사용 불가").css('color', 'red');
    	alert('ID는 필수 입력 요소입니다');
    }else{
    //id영역의 입력 값 얻기
    const idVal = $('#cust_id').val();
    
 // ID가 패턴을 벗어났을 경우
    const pattern = /^[a-zA-Z][a-zA-Z0-9]{2,7}$/;
    if (!pattern.test(idVal)) {
        $('#disp').text("사용 불가").css('color', 'red');
        alert("ID는 영문 대소문자로 시작하고, 숫자와 영문 대소문자만 포함하며, 3자 이상 8자 이하로 입력하세요");
    } else {
        $.ajax({
            url: '/midpro/customer/idChk.jsp',
            type: 'get',
            data: { userId: idVal },
            success: function(rst) {
                if (rst.rst == "ok") {
                    $('#disp').text("사용가능").css('color', 'green');
                } else {
                    $('#disp').text("사용불가").css('color', 'red');
                }
            },
            error: function(xhr) {
                alert(xhr.status);
            },
            dataType: 'json'
        });
    }
   }
});
//본인인증 버튼 클릭 시 처리
$('#sucbutton').on('click', function() {
    if ($('#cust_id').val()=='' || $('#disp').text() == "사용 불가" ){
        alert('ID 중복검사 미인증');
    } else {
        requestIdentityVerification();
        $('#suc').text("본인인증 완료");
    }
});

function requestIdentityVerification() {
    const random = Math.floor(Math.random() * 9999);  // 클라이언트에서 난수 생성
    const idVal = $('#cust_id').val() + random;

    PortOne.requestIdentityVerification({
        storeId: "store-d05ec83a-78ae-4fdc-891b-bb5b43d7fc72",
        identityVerificationId: idVal,
        channelKey: "channel-key-a66412a6-d0c1-436b-a5f0-0dfa0cedf2cd",
    });
}
 
</script>
</html>