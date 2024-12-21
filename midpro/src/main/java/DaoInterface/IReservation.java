package DaoInterface;

import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.TheaterVO;

public interface IReservation {
	/**
	 * 
	 * @param reservation_PaymentVO
	 */
   int insertReservation(ReservationVO reservationVO);
	    

   public List<MovieVO> getAllMovie();
   
   
   
   public List<TheaterVO> getAllTheater();
   

}
