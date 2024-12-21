<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>개인정보 수정</title>
</head>
<body>
<%@ include file="/main/Top.jsp" %>

        <h2>개인정보 수정</h2>
    <form>
        <label for="name">이름:</label> 
        <input type="text" id="name" name="name" value="<%=result.getCust_name() %>" required>
        <br>

        <label for="customer_id">아이디:</label>
        <input type="text" id="customer_id" name="customer_id" value="<%=result.getCustomer_id() %>" required><br>

        <label for="birthdate">생년월일:</label>
        <input type="text" id="birthdate" name="birthdate" value="<%=result.getCust_add() %>" required><br>

        <label for="phone">휴대전화번호:</label>
        <input type="tel" id="phone" name="phone" required><button>변경하기</button><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" value="<%=result.getCust_email() %>" required><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><button>변경하기</button><br>

        <button type="submit">저장</button>
    </form>
       <%@ include file="/main/Bottom.jsp" %>
</body>
</html>

