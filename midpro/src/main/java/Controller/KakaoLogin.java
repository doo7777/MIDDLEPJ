package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import Service.CustomerServiceImpl;
import ServiceInterface.ICustomerService;
import Vo.CustomerVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

   @WebServlet("/kakaoLogin.do")
   public class KakaoLogin extends HttpServlet {
       private static final long serialVersionUID = 1L;
       private static final String CLIENT_ID = "66af43424a17bc735630e486e280ccae"; // 카카오 앱의 REST API 키
       private static final String REDIRECT_URI = "http://localhost/midpro/kakaoLogin.do"; // 리디렉션 URI


	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	request.setCharacterEncoding("utf-8");
	    	response.setCharacterEncoding("utf-8");
	    	response.setContentType("text/html charset=utf-8");
	    	
	    	String code = request.getParameter("code");
	    	System.out.println("code=" + code);
	        
	        if (code != null) {
	            try {
	                // 1. code로 access_token을 얻기 위한 API 호출
	                String tokenUrl = "https://kauth.kakao.com/oauth/token";
	                String params = "grant_type=authorization_code"
	                            + "&client_id=" + CLIENT_ID
	                            + "&redirect_uri=" + REDIRECT_URI
	                            + "&code=" + code;


                   URL url = new URL(tokenUrl);
                   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                   conn.setRequestMethod("POST");
                   conn.setDoOutput(true);
                   conn.getOutputStream().write(params.getBytes());

                   BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                   String responseStr = br.readLine();
                   br.close();

                   // 2. 응답에서 access_token을 추출
                   JsonObject jsonResponse = JsonParser.parseString(responseStr).getAsJsonObject();
                   String accessToken = jsonResponse.get("access_token").getAsString();
                   
                   // 3. access_token으로 카카오 API 호출하여 사용자 정보 받기
                   String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
                   HttpURLConnection userInfoConn = (HttpURLConnection) new URL(userInfoUrl).openConnection();
                   userInfoConn.setRequestMethod("GET");
                   userInfoConn.setRequestProperty("Authorization", "Bearer " + accessToken);

                   BufferedReader userInfoReader = new BufferedReader(new InputStreamReader(userInfoConn.getInputStream()));
                   String userInfoResponse = userInfoReader.readLine();
                   userInfoReader.close();

                   // 4. 사용자 정보 파싱
                   JsonObject userJson = JsonParser.parseString(userInfoResponse).getAsJsonObject();
                   System.out.println(userInfoResponse);
                   JsonObject kakaoAccount = userJson.getAsJsonObject("kakao_account");
//                   JsonObject profile = kakaoAccount.getAsJsonObject("profile");
                   
                // 사용자 정보 변수
                   String email = kakaoAccount.has("email") ? kakaoAccount.get("email").getAsString().trim() : null;
                   String name = kakaoAccount.has("name") ? kakaoAccount.get("name").getAsString() : null;
                   String phoneNumber = kakaoAccount.has("phone_number") ? kakaoAccount.get("phone_number").getAsString() : null;
                   if (phoneNumber != null) {
                       // 전화번호에서 '+82'를 '0'으로 교체
                       phoneNumber = phoneNumber.replaceFirst("^\\+82", "0");
                       
                       // 전화번호의 공백, 하이픈 제거
                       phoneNumber = phoneNumber.replaceAll("[^0-9]", "");
                   }
                   String birthyear = kakaoAccount.has("birthyear") ? kakaoAccount.get("birthyear").getAsString() : null; // 생년월일
                   String birthday = kakaoAccount.has("birthday") ? kakaoAccount.get("birthday").getAsString() : null; // 생년월일

                   System.out.println("카카오 이메일: " + email);
                   System.out.println("카카오 이름: " + name);
                   System.out.println("카카오 전화번호: " + phoneNumber);
                   System.out.println("카카오 생년: " + birthyear);
                   System.out.println("카카오 월일: " + birthday);
                   System.out.println("토큰 값 : " + accessToken);
                   ICustomerService service = CustomerServiceImpl.getInstance();
                   
                   //카카오 로그인에서 따온 이메일을 디비에서 조회 하여 객체 설정
                   CustomerVO customerVo = service.getCustomer(email);
                   //DB에 조회한 이메일로 가입한 고객이 없을때
                   if(customerVo==null) {
                      // 신규 고객이라면 회원가입 처리 여부를 묻는 팝업을 띄우기 위해 같은 페이지로 포워딩
                       request.setAttribute("email", email);  // 카카오 이메일을 전달
                       request.setAttribute("name", name);    // 카카오 이름을 전달
                       request.setAttribute("birthyear", birthyear);
                       request.setAttribute("birthday", birthday);
                       request.setAttribute("phoneNumber", phoneNumber);
                       
                       String authCompleted = "true";
                       // 본인 인증을 건너뛰도록 처리 (예시: 이미 카카오로 인증되었기 때문에)
                       request.setAttribute("authCompleted", authCompleted);
                       System.out.println(authCompleted);
                       request.getRequestDispatcher("/customer/kakaoChk.jsp").forward(request, response);  // 메인 페이지로 포워딩
                       
                   }else {
                      // 이미 가입된 사용자라면 로그인 처리
                      
                       HttpSession session = request.getSession();
                       
                       if(customerVo!=null) {
                          session.setAttribute("ok", customerVo);
                       }
                       response.sendRedirect(request.getContextPath() + "/main/main.jsp");
                   }

               } catch (Exception e) {
                   // 예외 발생 시 로그 출력
                   e.printStackTrace();
                   // 클라이언트에게 오류 메시지 반환
                   response.getWriter().println("Error: " + e.getMessage());
               }
           } else {
               // 로그인 실패 처리
               response.getWriter().println("로그인 실패하였습니다");
           }
       }

   

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
