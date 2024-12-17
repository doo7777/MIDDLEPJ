package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;

@WebServlet("/deleteOneBoard.do")
public class DeleteOneBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOneBoardService service = OneBoardServiceImpl.getInstance();
		
		//단일 문의 삭제
		String oneonone_id = request.getParameter("oneonone_id");
		
		//여러 문의 삭제
		String[] oneonone_ids = request.getParameterValues("oneonone_id");
		
		int result =0;
		
		//여러삭제 처리
		if(oneonone_ids !=null && oneonone_ids.length >0) {
			for(String oneboard : oneonone_ids) {
				result += service.deleteBoard(oneboard);
			}
		}
		
		//단일삭제 처리
		if(oneonone_id != null) {
			result += service.deleteBoard(oneonone_id);
		}
		
		if(result >0) {
			response.sendRedirect(request.getContextPath() + "/oneBoard/OneBoardMain.jsp");
		}
		
		
		
	}

}
