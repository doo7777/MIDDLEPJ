package Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IReservation_PaymentDao;
import Util.MybatisUtil;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.TheaterVO;

public class Reservation_PaymentDaoImpl implements IReservation_PaymentDao{

	private static Reservation_PaymentDaoImpl dao;
	
	private Reservation_PaymentDaoImpl() {}
	
	public static Reservation_PaymentDaoImpl getInstance() {
		if (dao==null) {
			dao=new Reservation_PaymentDaoImpl();
		}
		return dao;
	}

	
	//예매 정보 추가
	@Override
	public int insertReservation(ReservationVO reservationVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.insert("Reservation.insertReservation", reservationVO);
			
			if(cnt>0)session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(session != null)session.close();
		}
		return cnt;
	}
	
	
	public List<MovieVO> getAllMovie(){
	   SqlSession session = MybatisUtil.getSqlSession();
	   List<MovieVO> movieList = null;
	   
	try {
		movieList = session.selectList("Movie.getAllMovies");
	} catch (Exception e) {
		e.printStackTrace();
		
	}finally {
		if(session != null)session.close();
	}
	return movieList;
}


	public List<TheaterVO> getAllTheater(){
		   SqlSession session = MybatisUtil.getSqlSession();
		   List<TheaterVO> theaterList = null;
		   
		try {
			theaterList = session.selectList("Theater.getAllTheater");
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(session != null)session.close();
		}
		return theaterList;
	}

	
	
	
	



}
