package ServiceInterface;

import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.TheaterVO;

public interface IReservationService {
	public int insertReservation(ReservationVO reservationVO) ;
	
	  public List<MovieVO> getAllMovie(); 
	  public List<TheaterVO> getAllTheater(); 
	  }

