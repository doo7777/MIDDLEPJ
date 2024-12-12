package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.CustomerServiceImpl;
import ServiceInterface.ICustomerService;
import Vo.CustomerVO;

@WebServlet("/cussignup.do")
public class CusSignup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("/Signup.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("utf-8");
        // 파라미터 수신
        String cust_id = request.getParameter("cust_id");
        String cust_pw = request.getParameter("cust_pw");
        String cust_name = request.getParameter("cust_name");
        String cust_email = request.getParameter("cust_email");
        String cust_tel = request.getParameter("cust_tel");
        String cust_post = request.getParameter("cust_post");
        String cust_add = request.getParameter("cust_add");
        String cust_detailAdd = request.getParameter("cust_detailAdd");

        // VO 객체에 데이터 설정
        CustomerVO custVo = new CustomerVO();
        custVo.setCustomer_id(cust_id);
        custVo.setCust_pw(cust_pw);
        custVo.setCust_name(cust_name);
        custVo.setCust_email(cust_email);
        custVo.setCust_tel(cust_tel);
        custVo.setCust_postcode(cust_post);
        custVo.setCust_add(cust_add);
        custVo.setCust_detailadd(cust_detailAdd);

        // 서비스 호출
        ICustomerService service = CustomerServiceImpl.getInstance();
        int result = service.insertCustomer(custVo);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/main/main.jsp");
        } else {
            response.getWriter().println("<h1>회원가입 실패. 다시 시도해주세요.</h1>");
        }
    }
}