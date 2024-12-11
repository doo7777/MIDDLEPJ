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
            background-color: #f4f4f9;
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
        input[type="tel"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #007BFF;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원가입</h1>
        <form action="<%=request.getContextPath() %>/cusInsert.do" method="post">
            <label for="cust_id">아이디:</label>
            <input type="text" id="cust_id" name="cust_id" required placeholder="아이디를 입력하세요.">

 			<div>
             <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
         	 <span id="disp"></span>
         	</div>

            <label for="cust_pw">비밀번호:</label>
            <input type="password" id="cust_pw" name="cust_pw" required placeholder="비밀번호를 입력하세요.">

            <label for="cust_name">이름:</label>
            <input type="text" id="cust_name" name="cust_name" required placeholder="이름을 입력하세요.">

            <label for="cust_email">이메일:</label>
            <input type="email" id="cust_email" name="cust_email" required placeholder="이메일을 입력하세요.">

            <label for="cust_tel">전화번호:</label>
            <input type="tel" id="cust_tel" name="cust_tel" required placeholder="전화번호를 입력하세요.">

            <label for="cust_post">우편번호:</label>
            <input type="text" id="cust_post" name="cust_post" required placeholder="우편번호를 입력하세요.">

            <label for="cust_add">주소:</label>
            <input type="text" id="cust_add" name="cust_add" required placeholder="주소를 입력하세요.">

            <label for="cust_detailAdd">상세주소:</label>
            <input type="text" id="cust_detailAdd" name="cust_detailAdd" required placeholder="상세주소를 입력하세요.">

            <button type="submit">회원가입</button>
        </form>
    </div>
</body>
<script>
//id중복검사
$('#idChk').on('click',function(){
//  $('#id').on('keyup',function(){});
    
    //id영역의 입력 값 얻기
    const idVal = $('#cust_id').val();
    
    //서버위치로 보내주기 - 비동기통신(AJAX) 이용해서 현재 페이지로 응답 받을 예정..
    $.ajax({
       url: 'idChk.jsp',   //현재 위치로 요청보내고 다시 응답받을 예정..
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