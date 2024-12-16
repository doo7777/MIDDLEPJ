package Controller;

import java.io.IOException;

import Service.OneBoardServiceImpl;
import ServiceInterface.IOneBoardService;
import Vo.OneBoardVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/oneBoardInsert.do")
public class OneBoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
			
			String oneonone_id = request.getParameter("oneonone_id");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writedate = request.getParameter("writedate");
//			String notice_view = request.getParameter("notive_view");
//			String notice_sort = request.getParameter("notice_sort");
			
			OneBoardVO oneboardVO = new OneBoardVO();
			oneboardVO.setOneonone_id(oneonone_id);
			oneboardVO.setSubject(subject);
			oneboardVO.setContent(content);
			oneboardVO.setWritedate(writedate);
//			oneboardVO.setNotice_view(notice_view);
//			oneboardVO.setNotice_sort(notice_sort);
			
			IOneBoardService service = OneBoardServiceImpl.getInstance();
			int result = service.insertBoard(oneboardVO);
			
//			String noticeSort = request.getParameter("notice_sort");
			
			if(result>0) {
				response.sendRedirect(request.getContextPath()+"/noticeList.do");
				
			}else {
				response.getWriter().println("<h1>1:1문의 등록실패</h1>");
			}
			
		   
		   
	   }

	}


