package Service;



import java.util.List;

import Dao.ReservationDaoImpl;
import DaoInterface.IReservationDao;

import ServiceInterface.IReservationService;
import  Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.TheaterVO;
public class ReservationServiceImpl implements IReservationService{
		private static ReservationServiceImpl service;
		private IReservationDao dao;
		
		private ReservationServiceImpl() {
			dao = ReservationDaoImpl.getInstance();
		}
		

	public static ReservationServiceImpl getInstance() {
			if(service==null) service = new ReservationServiceImpl();
			
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
		
    @Override
    public List<ScheduleVO>getAllSchedule(){
		return null;
	}



	
}
