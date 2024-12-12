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
        
        <form action="<%=request.getContextPath() %>/cussignup.do" method="post">
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
            <input type="tel" id="cust_tel" name="cust_tel" required placeholder="010-0000-0000" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{4}">

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
			<div id="signup">
            <button type="submit" >회원가입</button>
            </div>
        </form>
    </div>
</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
</html>