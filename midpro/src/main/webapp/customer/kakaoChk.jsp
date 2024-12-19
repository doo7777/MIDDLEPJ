<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 확인</title>
    <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 기본적으로 숨겨놓고 */
            position: fixed;
            z-index: 1; /* 모달이 다른 요소 위에 나타나도록 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0); /* 배경 색 */
            background-color: rgba(0,0,0,0.4); /* 배경 투명도 */
            padding-top: 60px;
        }

        /* 모달 콘텐츠 */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        // 모달 띄우기
        window.onload = function() {
            var modal = document.getElementById("signupModal");
            modal.style.display = "block";  // 페이지 로드 시 모달 창 띄우기
        };

     // 회원가입 페이지로 POST 방식으로 이동
        function goToSignUp() {
            var email = '<%= request.getAttribute("email") %>';
            var name = '<%= request.getAttribute("name") %>';
            var birthyear = '<%= request.getAttribute("birthyear") %>';
            var birthday = '<%= request.getAttribute("birthday") %>';
            var phoneNumber = '<%= request.getAttribute("phoneNumber") %>';
            var authCompleted = '<%= request.getAttribute("authCompleted") %>';
            
            console.log(authCompleted);
            // 동적으로 form을 생성
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = "<%= request.getContextPath() %>/customer/Signup.jsp";
            
            // hidden input 요소 생성
            var emailField = document.createElement('input');
            emailField.type = 'hidden';
            emailField.name = 'email';
            emailField.value = email;
            form.appendChild(emailField);
            
            var nameField = document.createElement('input');
            nameField.type = 'hidden';
            nameField.name = 'name';
            nameField.value = name;
            form.appendChild(nameField);
            
            var phoneNumberField = document.createElement('input');
            phoneNumberField.type = 'hidden';
            phoneNumberField.name = 'phoneNumber';
            phoneNumberField.value = phoneNumber;
            form.appendChild(phoneNumberField);
            
            var birthdayField = document.createElement('input');
            birthdayField.type = 'hidden';
            birthdayField.name = 'birthday';
            birthdayField.value = birthday;
            form.appendChild(birthdayField);
            
            var birthyeaField = document.createElement('input');
            birthyeaField.type = 'hidden';
            birthyeaField.name = 'birthyear';
            birthyeaField.value = birthyear;
            form.appendChild(birthyeaField);
            
            // authCompleted 값을 hidden input으로 추가
            var authCompletedField = document.createElement('input');
            authCompletedField.type = 'hidden';
            authCompletedField.name = 'authCompleted';
            authCompletedField.value = authCompleted;  // authCompleted 값 전달
            form.appendChild(authCompletedField);
            
            // 폼을 body에 append하고 제출
            document.body.appendChild(form);
            form.submit();
        }

        // 메인 페이지로 이동
        function goToMain() {
            window.location.href = "<%= request.getContextPath() %>/main/main.jsp";
        }

        // 모달 창 닫기
        function closeModal() {
            var modal = document.getElementById("signupModal");
            modal.style.display = "none";
        }
    </script>
</head>
<body>
    <h2>카카오 로그인</h2>
    <!-- 회원가입 확인 모달 -->
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>회원가입이 필요합니다</h3>
            <p>카카오 이메일로 로그인하셨습니다. 해당 이메일로 가입하시겠습니까?</p>
            <button onclick="goToSignUp()">확인</button>
            <button onclick="goToMain()">취소</button>
        </div>
    </div>
</body>
</html>