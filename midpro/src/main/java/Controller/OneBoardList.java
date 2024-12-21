package Controller;

import java.io.IOException;
import java.util.List;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;
import Vo.OneBoardVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/oneBoardList.do")
public class OneBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 IOneBoardService service = OneBoardServiceImpl.getInstance();
	      
	      String oneonone_id = request.getParameter("oneonone_id");
	      
	      
	      List<OneBoardVO>OneBoardList = service.getAllBoard();
	      
	      
	      request.setAttribute("OneBoardList", OneBoardList);
	      request.getRequestDispatcher("/notice/oneBoard/OneBoardMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
