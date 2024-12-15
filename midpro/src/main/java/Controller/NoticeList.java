package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.NoticeServiceImpl;
import ServiceInterface.INoticeService;
import Vo.NoticeVO;

@WebServlet("/noticeList.do")
public class NoticeList extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      INoticeService service = NoticeServiceImpl.getInstance();
      List<NoticeVO>noticeList = service.getAllNotice();
      
      request.setAttribute("noticeList", noticeList);
      
      request.getRequestDispatcher("/notice/NoticeList.jsp").forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }

}