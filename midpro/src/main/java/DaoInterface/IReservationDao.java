package DaoInterface;

import java.awt.desktop.ScreenSleepEvent;
import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.ScreenVO;
import Vo.TheaterVO;

public interface IReservationDao {
	/**
	 * 
	 * @param reservation_PaymentVO
	 */
   int insertReservation(ReservationVO reservation_PaymentVO);
	    

   //영화 전체 보기
   public List<MovieVO> getAllMovie();
   
   
  //영화관 전체보기 
   public List<TheaterVO> getAllTheater();
   
   //영화 일정 전체보기
   public List<ScheduleVO> getAllSchedule();
   
   //상영관 전체보기
   public List<ScreenVO> getAllScreen();
   
   /**
    * 예매과정= 좌석,금액선택전 insert후 데이터 추가 삽입
    * @return
    */
   public int updateReserve(ReservationVO reservationVO);
   
   

}
