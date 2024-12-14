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
        
        String notice_id = request.getParameter("notice_id");

        INoticeService service = NoticeServiceImpl.getInstance();
        int result = service.deleteNotice(notice_id);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/noticeList.do");
        } else {
            response.sendRedirect(request.getContextPath() + "/fail.jsp");
        }
    }
}
