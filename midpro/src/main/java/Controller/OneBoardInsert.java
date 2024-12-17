package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;
import Vo.OneBoardVO;

@WebServlet("/oneBoardInsert.do")
public class OneBoardInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	// 세션에서 사용자 정보를 가져오기
        HttpSession session = request.getSession();
        String customer_id = request.getParameter("customer_id"); // 세션에 저장된 customer_id
        String person_name = request.getParameter("person_name"); // 세션에 저장된 person_name
        String person_email = request.getParameter("person_email"); // 세션에 저장된 person_email

        // 요청에서 가져온 데이터
        String person_tel = request.getParameter("person_tel");
        String question_type = request.getParameter("question_type");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        // OneBoardVO에 값 설정
        OneBoardVO oneBoardVO = new OneBoardVO();
        oneBoardVO.setCustomer_id(customer_id); // 세션에서 가져온 customer_id
        oneBoardVO.setPerson_name(person_name); // 세션에서 가져온 person_name
        oneBoardVO.setPerson_email(person_email); // 세션에서 가져온 person_email
        oneBoardVO.setPerson_tel(person_tel); // 요청에서 가져온 데이터
        oneBoardVO.setQuestion_type(question_type);
        oneBoardVO.setSubject(subject);
        oneBoardVO.setContent(content);

        // 서비스 호출
        IOneBoardService service = OneBoardServiceImpl.getInstance();
        int result = service.insertBoard(oneBoardVO);

        // 결과 처리
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/oneBoard/OneBoardInsert.jsp");
        } else {
            response.getWriter().println("<h1>1:1 문의 등록 실패<h1>");
        }
    }
}
