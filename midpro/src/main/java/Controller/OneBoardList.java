package Controller;

import java.io.IOException;
import java.util.List;


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
	      
	      String OneBoard_id = request.getParameter("ONEONONE_id");
	      
	      
	      List<OneBoardVO>OneBoardList = service.getAllBoard();
	      
	      
	      request.setAttribute("OneBoardList", OneBoardList);
	      request.getRequestDispatcher("/notice/NoticeList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
