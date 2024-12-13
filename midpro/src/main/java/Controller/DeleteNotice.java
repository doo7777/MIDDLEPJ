package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.NoticeServiceImpl;
import ServiceInterface.INoticeService;

@WebServlet("/deleteNotice.do")
public class DeleteNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String notice_ID = request.getParameter("notice_ID");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		service.deleteNotice(notice_ID);
		
		response.sendRedirect(request.getContextPath() + "/noticeList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
