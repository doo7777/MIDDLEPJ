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

@WebServlet("/cusLogin.do")
public class CusLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html charset=utf-8");
    	
    	String cust_id = request.getParameter("cust_id");
        String cust_pw = request.getParameter("cust_pw");
    	
        ICustomerService service = CustomerServiceImpl.getInstance();
        
        
    	//db확인 
        CustomerVO result = service.getCustomer(cust_id, cust_pw);
        response.getWriter().print(result);
    	
    	
    	
    	
    	
	}

}
