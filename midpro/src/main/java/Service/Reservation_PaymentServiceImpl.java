package Service;



import java.util.List;

import Dao.Reservation_PaymentDaoImpl;
import DaoInterface.IReservation_PaymentDao;
import ServiceInterface.IReservation_PaymentService;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.TheaterVO;
public class Reservation_PaymentServiceImpl implements IReservation_PaymentService{
		private static Reservation_PaymentServiceImpl service;
		private IReservation_PaymentDao dao;
		
		private Reservation_PaymentServiceImpl() {
			dao = Reservation_PaymentDaoImpl.getInstance();
		}
		

	public static Reservation_PaymentServiceImpl getInstance() {
			if(service==null) service = new Reservation_PaymentServiceImpl();
			
			return service;
		}


	@Override
	public int insertReservation(ReservationVO reservation_PaymentVO) {
		// TODO Auto-generated method stub
		return dao.insertReservation(reservation_PaymentVO);
	}


	@Override
	public List<MovieVO> getAllMovie() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<TheaterVO> getAllTheater() {
		// TODO Auto-generated method stub
		return null;
	}



	
}
