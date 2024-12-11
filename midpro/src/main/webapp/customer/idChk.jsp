
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String uId = request.getParameter("userId");
   System.out.println(">>>>>>>>>>>>" + uId);
   
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs =  null;

   try{
      //JDBC이용해서 DB에 접근하고 결과 얻기
      
      //0. 라이브러리 준비 - ojdbc.jar
      //1. 드라이버 로딩
      Class.forName("oracle.jdbc.driver.OracleDriver");
      //2. 드라이버 매니저로 connection객체 생성
      String url = "jdbc:oracle:thin:@112.220.114.131:1521:xe";
      conn = DriverManager.getConnection(url, "teama_202409m", "java");
      //3. statement객체 생성
      stmt = conn.createStatement();
      //4. 쿼리 조회 후 응답 생성
      String sql = "select cust_id from customer where cust_id = '" + uId + "'";
      rs = stmt.executeQuery(sql);
      
      if(rs.next()){
         //넘어오는 정보가 존재한다 >> 중복
         //응답정보를 json형식으로 생성 후 전달 예정...
   %>
         {"rst":"no"}
   <% 
      }else{
         //중복아님
   %>      
         {"rst":"ok"}
   <%
      }
   }catch(SQLException e){
      e.printStackTrace();
   }finally{
      //객체종료
      rs.close();
      stmt.close();
      conn.close();
   }
   %>
   
   
   




