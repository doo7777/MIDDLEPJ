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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        INoticeService service = NoticeServiceImpl.getInstance();
        
        //선택된 게시물들 일괄삭제
        String[] notice_ids = request.getParameterValues("notice_ids");
        
        //하나의 게시글만 삭제
        String notice_id = request.getParameter("notice_id");
        
        int result=0;
        
        if(notice_ids !=null && notice_ids.length>0) {
//        	service.deleteNotice(notice_id);
        	for(String id : notice_ids) {
        		result += service.deleteNotice(id);
        	}
        }
        if(notice_id != null) {
        	result += service.deleteNotice(notice_id);
        }

        


        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/noticeList.do");
        } else {
            response.sendRedirect(request.getContextPath() + "/fail.jsp");
        }
    }
}
