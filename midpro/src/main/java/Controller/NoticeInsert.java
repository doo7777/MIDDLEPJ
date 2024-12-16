package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service.NoticeServiceImpl;
import ServiceInterface.INoticeService;
import Vo.NoticeVO;

@WebServlet("/noticeInsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	request.getRequestDispatcher("/notice/InsertNotice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	
	String notice_id = request.getParameter("notice_id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String post_date = request.getParameter("post_date");
	String notice_view = request.getParameter("notive_view");
	String notice_sort = request.getParameter("notice_sort");
	
	NoticeVO noticeVO = new NoticeVO();
	noticeVO.setNotice_id(notice_id);
	noticeVO.setTitle(title);
	noticeVO.setContent(content);
	noticeVO.setPost_date(post_date);
	noticeVO.setNotice_view(notice_view);
	noticeVO.setNotice_sort(notice_sort);
	
	INoticeService service = NoticeServiceImpl.getInstance();
	int result = service.insertNotice(noticeVO);
	
	String noticeSort = request.getParameter("notice_sort");
	
	if(result>0) {
		response.sendRedirect(request.getContextPath()+"/noticeList.do");
		
	}else {
		response.getWriter().println("<h1>공지글 등록실패</h1>");
	}
	
	
	
	}

}
