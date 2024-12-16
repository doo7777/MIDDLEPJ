package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/verifyIdentity.do")
public class VerifyIdentity extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setHeader("Access-Control-Allow-Origin", "*");
    	response.setHeader("Access-Control-Allow-Methods", "POST");
    	response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        // 클라이언트로부터 인증 ID를 받음
        String identityVerificationId = request.getParameter("identityVerificationId");

        // IAMPORT API 호출을 위한 URL
        String apiUrl = "https://api.iamport.kr/certifications/" + identityVerificationId;

        // 인증을 위한 API 키
        String apiKey = "ZUhPSzQzQUpCN1dLa1I0RFd3Y1VuQT09";  // IAMPORT에서 제공하는 API 인증 키

        // HttpURLConnection을 이용하여 IAMPORT API 호출
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", apiKey);  // 인증 헤더 추가
            conn.setDoOutput(true);

            // 요청 바디에 필요한 데이터 추가 (예: 인증 ID)
            JSONObject jsonBody = new JSONObject();
            jsonBody.put("identityVerificationId", identityVerificationId);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonBody.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // 응답 처리
            int status = conn.getResponseCode();
            if (status == HttpURLConnection.HTTP_OK) {
                // 성공적으로 인증이 완료되었으면, 클라이언트로 응답을 전달
                InputStream responseStream = conn.getInputStream();
                String responseData = new String(responseStream.readAllBytes(), StandardCharsets.UTF_8);

                response.setContentType("application/json");
                response.getWriter().write(responseData);  // 클라이언트로 결과 전달
            } else {
                response.setStatus(HttpURLConnection.HTTP_INTERNAL_ERROR);
                response.getWriter().write("{\"message\":\"본인 인증 실패\"}");
            }
        } catch (Exception e) {
            response.setStatus(HttpURLConnection.HTTP_INTERNAL_ERROR);
            response.getWriter().write("{\"message\":\"서버 오류: " + e.getMessage() + "\"}");
        }
    }
}