package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.CustomerServiceImpl;
import ServiceInterface.ICustomerService;
import Vo.CustomerVO;

@WebServlet("/customerList.do")
public class CustomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICustomerService service = CustomerServiceImpl.getInstance();
		List<CustomerVO>custList = service.getAllCustomer();
		
		request.setAttribute("custs", custList);
		
		request.getRequestDispatcher("/CustomerList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
