package Controller;

import java.io.IOException;
import java.util.List;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;
import Vo.CustomerVO;
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
		 
		 CustomerVO customer = (CustomerVO)request.getSession().getAttribute("ok");
		 String Customer_id= customer.getCustomer_id();
	      
		 //사용자 문의 내역조회
		 List<OneBoardVO>OneBoardList = service.getAllBoard();
		 request.setAttribute("OneBoardList", OneBoardList);
		 
		 
		 //상세보기 처리
	      String oneonone_id = request.getParameter("oneonone_id");
	      if(oneonone_id !=null) {
	    	  for(OneBoardVO board : OneBoardList) {
	    		  if(board.getOneonone_id().equals(oneonone_id)) {
	    			  request.setAttribute("selectBoard", board);
	    			  break;
	    		  }
	    	  }
	      }
	      
	      request.getRequestDispatcher("/notice/oneBoard/OneBoardMain.jsp").forward(request, response);
	      
	      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
