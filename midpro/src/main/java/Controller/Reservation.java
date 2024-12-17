package Controller;

import java.io.IOException;
import java.util.List;

import Service.Reservation_PaymentServiceImpl;
import ServiceInterface.IReservation_PaymentService;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.TheaterVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/reservation.do")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//데이터 가져오기
		String customer_id = request.getParameter("customer_id");
		String movie_name = request.getParameter("movie_name");
		int theater_id = Integer.parseInt(request.getParameter("theater_id"));
	    
	    //ReservationVO에 값 설정
	    ReservationVO reservationVO = new ReservationVO();
	    reservationVO.setCustomer_id(customer_id);
	    reservationVO.setMovie_name(movie_name);
	    reservationVO.setTheater_id(theater_id);
	    
	    //서비스 호출
	    IReservation_PaymentService service = Reservation_PaymentServiceImpl.getInstance();
	    int result = service.insertReservation(reservationVO);
	       List<MovieVO> movieList = service.getAllMovie();
	        List<TheaterVO> theaterList = service.getAllTheater();
	        request.setAttribute("movieList", movieList);
	        request.setAttribute("theaterList", theaterList);
	    
	     if (result > 0) {
	            request.setAttribute("successMessage", "예약이 완료되었습니다.");
	        } else {
	            request.setAttribute("errorMessage", "예약 실패. 다시 시도해 주세요.");
	        }

	    response.sendRedirect(request.getContextPath()+"/Reservation/MovieC.jsp");
		
	}

}
