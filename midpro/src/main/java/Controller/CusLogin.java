package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Service.CustomerServiceImpl;
import ServiceInterface.ICustomerService;
import Util.PasswordUtil;
import Vo.CustomerVO;

@WebServlet("/cusLogin.do")
public class CusLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("application/json; charset=utf-8");
    	
    	String cust_id = request.getParameter("cust_id");
        String cust_pw = request.getParameter("cust_pw");
     // 비밀번호 해싱
        String hashedPassword = PasswordUtil.hashPassword(cust_pw);
        
        ICustomerService service = CustomerServiceImpl.getInstance();
        
        CustomerVO result = service.getCustomer(cust_id,hashedPassword);
        
        HttpSession session = request.getSession();
        
        if(result!=null) {
        	session.setAttribute("ok", result);
        }
        response.sendRedirect(request.getContextPath()+"/main/main.jsp");
    	
    	
	}

}
