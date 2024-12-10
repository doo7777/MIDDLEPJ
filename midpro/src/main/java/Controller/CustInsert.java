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

/**
 * Servlet implementation class cusInsert
 */
@WebServlet("/cusInsert.do")
public class CustInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/midpro/CustomerInsert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cust_id = request.getParameter("cust_id");
		String cust_pw = request.getParameter("cust_pw");
		String cust_name = request.getParameter("cust_name");
		String cust_email = request.getParameter("cust_email");
		String cust_tel = request.getParameter("cust_tel");
		String cust_post = request.getParameter("cust_post");
		String cust_add = request.getParameter("cust_add");
		String cust_detailAdd = request.getParameter("cust_detailAdd");
		
		//객체저장
	CustomerVO custVo = new CustomerVO();
	custVo.setCustomer_id(cust_id);
	custVo.setCust_pw(cust_pw);
	custVo.setCust_name(cust_name);
	custVo.setCust_email(cust_email);
	custVo.setCust_tel(cust_tel);
	custVo.setCust_postcode(cust_post);
	custVo.setCust_add(cust_add);
	custVo.setCust_detailadd(cust_detailAdd);
	
	//회원정보 DB저장
	ICustomerService service = CustomerServiceImpl.getInstance();
	service.insertCustomer(custVo);
	
	response.sendRedirect(request.getContextPath()+"/customerList.do");
	
		
	}

}














