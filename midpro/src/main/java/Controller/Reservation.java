package Controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import Service.ReservationServiceImpl;
import Service.ScheduleServiceImpl;
import Service.SeatServiceImpl;
import ServiceInterface.IReservationService;
import ServiceInterface.IScheduleService;
import ServiceInterface.ISeatService;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.ScreenVO;
import Vo.SeatVO;
import Vo.TheaterVO;
import jakarta.servlet.RequestDispatcher;
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
      request.getRequestDispatcher("/MovieC.jsp").forward(request, response);
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청 인코딩 설정
		
		// 폼 데이터 받아오기
        int reservationId = Integer.parseInt(request.getParameter("reservation_id"));
        String customerId = request.getParameter("customer_id");
        int seatId = Integer.parseInt(request.getParameter("seat_id"));
        int scheduleId = Integer.parseInt(request.getParameter("schedule_id"));
        String movieName = request.getParameter("movie_name");
        int screenId = Integer.parseInt(request.getParameter("screen_id"));
        int theaterId = Integer.parseInt(request.getParameter("theater_id"));
        int reservationNum = Integer.parseInt(request.getParameter("reservation_num"));
        int reservationPrice = Integer.parseInt(request.getParameter("reservation_price"));
	   
        // 예약일 설정 (현재 날짜)
        Date reservationDate = new Date(Calendar.getInstance().getTimeInMillis());

        // ReservationVO 객체 생성 및 데이터 설정
        ReservationVO reservation = new ReservationVO();
        reservation.setReservation_id(reservationId);
        reservation.setCustomer_id(customerId);
        reservation.setSeat_id(seatId);
        reservation.setSchedule_id(scheduleId);
        reservation.setMovie_name(movieName);
        reservation.setScreen_id(screenId);
        reservation.setTheater_id(theaterId);
        reservation.setReservation_num(reservationNum);
        reservation.setReservation_status("예약 완료"); // 상태 설정
        reservation.setReservation_date(reservationDate);
        reservation.setReservation_price(reservationPrice);
        
        // 예약 정보를 request에 저장
        request.setAttribute("reservation", reservation);
        
        // step2Reserve.jsp로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/RESERVATION/step2Test.jsp");
        dispatcher.forward(request, response);
	   
	   /* 기존 작성 내용
		 * request.setCharacterEncoding("utf-8");
		 * response.setCharacterEncoding("utf-8");
		 * response.setContentType("text/html charset=utf-8");
		 * 
		 * //데이터 가져오기 String customer_id = request.getParameter("customer_id"); String
		 * movie_name = request.getParameter("movie_name"); int theater_id
		 * =Integer.parseInt(request.getParameter("theater_id")); int schedule_id =
		 * Integer.parseInt(request.getParameter("schedule_id")); int screen_id =
		 * Integer.parseInt(request.getParameter("screen_id"));
		 * 
		 * 
		 * 
		 * //ReservationVO에 값 설정 ReservationVO reservationVO = new ReservationVO();
		 * reservationVO.setCustomer_id(customer_id);
		 * reservationVO.setMovie_name(movie_name);
		 * reservationVO.setTheater_id(theater_id);
		 * 
		 * //좌석 reservationVO.setSchedule_id(schedule_id);
		 * reservationVO.setScreen_id(screen_id);
		 * 
		 * //서비스 호출 IReservationService reservService =
		 * ReservationServiceImpl.getInstance(); int result =
		 * reservService.insertReservation(reservationVO);
		 * 
		 * List<MovieVO> movieList = reservService.getAllMovie(); List<TheaterVO>
		 * theaterList = reservService.getAllTheater(); List<ScreenVO> screenList =
		 * reservService.getAllScreen();
		 * 
		 * IScheduleService scheduleService = ScheduleServiceImpl.getInstance();
		 * 
		 * List<ScheduleVO>scheduleList = scheduleService.getAllSchedule();
		 * request.setAttribute("schedeulList", scheduleList);
		 * request.setAttribute("movieList", movieList);
		 * request.setAttribute("theaterList", theaterList);
		 * request.setAttribute("screenList", screenList);
		 * request.setAttribute("reservation_id", reservationVO.getReservation_id());
		 * 
		 * if (result > 0) { SeatVO seatVO = new SeatVO(); ISeatService seatService =
		 * SeatServiceImpl.getInstance(); List<SeatVO> seatList =
		 * seatService.getReservSeat(reservationVO);
		 * 
		 * 
		 * int screen_ids =Integer.parseInt(request.getParameter("screen_id"));
		 * reservationVO.setScreen_id(screen_id);
		 * 
		 * 
		 * // int updateReserve = reservService.updateReserve(reservationVO);
		 * 
		 * System.out.println("seatVO데이터확인:" + seatVO);
		 * System.out.println("seatlist데이터확인:" + seatList);
		 * System.out.println("reservationVO 데이터 확인" + reservationVO);
		 * System.out.println("screen_id 데이터 확인" + screen_id);
		 * 
		 * 
		 * request.setAttribute("seatList", seatList);
		 * request.getRequestDispatcher("/RESERVATION/seatC.jsp").forward(request,
		 * response); } else { request.setAttribute("errorMessage",
		 * "예약 실패. 다시 시도해 주세요."); }
		 */
       }


    }
