package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.SeatServiceImpl;
import ServiceInterface.ISeatService;
import Vo.ReservationVO;
import Vo.SeatVO;

@WebServlet("/seatList.do")
public class SeatList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//    int seat_id = Integer.parseInt(request.getParameter("seat_id"));
//  
//    //ReservationVO에 값 설정
//    ReservationVO reservationVO = new ReservationVO();
//    reservationVO.setSeat_id(seat_id);	
//       
//    //좌석 선택
//        ISeatService seatService = SeatServiceImpl.getInstance();
//        List<SeatVO>seatList = seatService.getAllSeat();
//        
//        request.setAttribute("seatList", seatList);
//        request.getRequestDispatcher("/RESERVATION/seatC.jsp").forward(request, response);
//        
        
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
