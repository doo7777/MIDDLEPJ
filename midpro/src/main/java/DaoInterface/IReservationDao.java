package DaoInterface;

import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.TheaterVO;

public interface IReservationDao {
	/**
	 * 
	 * @param reservation_PaymentVO
	 */
   int insertReservation(ReservationVO reservation_PaymentVO);
	    

   public List<MovieVO> getAllMovie();
   
   
   
   public List<TheaterVO> getAllTheater();
   
   
   
   
   public List<ScheduleVO> getAllSchedule();
   
   

}
