package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Vo.Reservation_PaymentVO;


@WebServlet("/rp.do")
public class RP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("/RP.jsp").forward(request, response);
	}

	//요청에서 파라미터 가져오기
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     HttpSession session = request.getSession();
     String customerId = (String) session.getAttribute("customerId"); //세션에서 고객정보 가져옴
     String movieName = request.getParameter("movieName");
     String scheduleId = request.getParameter("scheduleId");
     String screenId = request.getParameter("screenId");
     String custGrade = request.getParameter("custGrade");
     String reservPayDate = request.getParameter("reservPayDate");
     String reservPaySeats = request.getParameter("reservPaySeats");
     String reservPayPNumber = request.getParameter("reservPayPNumber");
     String reservPayTicketPrice = request.getParameter("reservPayTicketPrice");
     String reservPayMethod = request.getParameter("reservPayMethod");
     String reservPayTelNum = request.getParameter("reservPayTelNum");
     
     //RpVO 객체 생성 및 값설정
     Reservation_PaymentVO rpVO = new Reservation_PaymentVO();
     
     rpVO.setCustomer_id(customerId);
     rpVO.setMovie_name(movieName);
     rpVO.setSchedule_id(scheduleId);
     rpVO.
	}

}
