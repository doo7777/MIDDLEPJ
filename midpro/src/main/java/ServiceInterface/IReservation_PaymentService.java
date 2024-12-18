package ServiceInterface;

import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.TheaterVO;

public interface IReservation_PaymentService {
	public int insertReservation(ReservationVO reservation_PaymentVO) ;
	  public List<MovieVO> getAllMovie(); 
		   public List<TheaterVO> getAllTheater(); 
	  }

