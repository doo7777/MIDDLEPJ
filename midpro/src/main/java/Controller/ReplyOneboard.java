package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;
import Vo.OneBoardVO;

@WebServlet("/replyOneboard.do")
public class ReplyOneboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOneBoardService service = OneBoardServiceImpl.getInstance();
		
		String oneonone_id = request.getParameter("oneonone_id");
		String res_board = request.getParameter("res_board");
		String response_board_content = request.getParameter("response_board_content");
		
		OneBoardVO boardVO = new OneBoardVO();
		boardVO.setOneonone_id(oneonone_id);
		boardVO.setRes_board(res_board);
		boardVO.setResponse_board_content(response_board_content);
		
		int result = service.rlplyOneboard(boardVO);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/oneBoardList.do");
		} else {
			
		}
		
		
		
	}

}
