package Service;



import java.util.List;

import Dao.ReservationDaoImpl;
<<<<<<< HEAD
import DaoInterface.IReservation;
import ServiceInterface.IReservationService;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.TheaterVO;
public class ReservationServiceImpl implements IReservationService{
		private static ReservationServiceImpl service;
		private IReservation dao;
		
		private ReservationServiceImpl() {
			dao = ReservationDaoImpl.getInstance();
		}
		

	public static ReservationServiceImpl getInstance() {
			if(service==null) service = new ReservationServiceImpl();
			
			return service;
		}


	@Override
	public int insertReservation(ReservationVO reservationVO) {
		// TODO Auto-generated method stub
		return dao.insertReservation(reservationVO);
	}


	@Override
	public List<MovieVO> getAllMovie() {
		// TODO Auto-generated method stub
		return dao.getAllMovie();
	}


	@Override
	public List<TheaterVO> getAllTheater() {
		// TODO Auto-generated method stub
		return dao.getAllTheater();
	}



=======
import DaoInterface.IReservationDao;

import ServiceInterface.IReservationService;
import  Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.ScreenVO;
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
		return dao.getAllMovie();
	}


	@Override
	public List<TheaterVO> getAllTheater() {
		// TODO Auto-generated method stub
		return dao.getAllTheater();
	}
		
	
	
    @Override
    public List<ScheduleVO>getAllSchedule(){
		return dao.getAllSchedule();
	}

    @Override
    public List<ScreenVO>getAllScreen(){
    	return dao.getAllScreen();
    }
>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ


	
}
