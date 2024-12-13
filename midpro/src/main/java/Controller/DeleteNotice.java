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

    // POST 방식으로 요청을 처리
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        // 삭제할 notice_id를 파라미터로 받기
        String notice_id = request.getParameter("notice_id");

        // 공지사항 삭제 처리
        INoticeService service = NoticeServiceImpl.getInstance();
        int result = service.deleteNotice(notice_id);

        // 삭제 성공 시, 공지사항 리스트 페이지로 리디렉션
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/noticeList.do");
        } else {
            // 실패 시, 실패 페이지로 리디렉션
            response.sendRedirect(request.getContextPath() + "/fail.jsp");
        }
    }
}
