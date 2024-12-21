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

@WebServlet("/updateNotice.do")
public class UpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		INoticeService service = NoticeServiceImpl.getInstance();
		
		String updateNotice = request.getParameter("notice_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String notice_sort = request.getParameter("notice_sort");
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNotice_id(updateNotice); // 수정 대상 게시글 지정
		noticeVo.setTitle(title);
		noticeVo.setContent(content);
		noticeVo.setNotice_sort(notice_sort);
		
		int update = service.updateNotice(noticeVo);
		boolean success = update>0;
		
		if(success) {
			// 성공 시 목록 페이지로 
			 response.sendRedirect(request.getContextPath() + "/noticeList.do"); 
		} else {
		}
		
		
	}

}
