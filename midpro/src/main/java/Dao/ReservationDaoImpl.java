package Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IReservationDao;
import Util.MybatisUtil;
import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;
import Vo.ScreenVO;
import Vo.TheaterVO;

public class ReservationDaoImpl implements IReservationDao{

	private static ReservationDaoImpl dao;
	
	private ReservationDaoImpl() {}
	
	public static ReservationDaoImpl getInstance() {
		if (dao==null) {
			dao=new ReservationDaoImpl();
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
	
	//무비 정보 조회
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

	
	
	
	public List<ScheduleVO> getAllSchedule(){
		SqlSession session = MybatisUtil.getSqlSession();
		List<ScheduleVO> scheduleList =null;
		
		try {
			scheduleList = session.selectList("Schedule.getAllSchedule");
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(session !=null)session.close();
			
		
		}
		return scheduleList;
	}
	
	
   public List<ScreenVO> getAllScreen(){
	   SqlSession session = MybatisUtil.getSqlSession();
	   List<ScreenVO> screenList=null;
	   
	   try {
		screenList = session.selectList("Screen.getAllScreen");
	} catch (Exception e) {
	   e.printStackTrace();
	}finally {
		if(session !=null)session.close();
	}
	   
	   return screenList;
   }

@Override
public int updateReserve(ReservationVO reservationVO) {
	
	SqlSession session = MybatisUtil.getSqlSession();
	
	int cnt =0;
	
	try {
		cnt = session.update("Reservation.updateReserve",reservationVO);
		if(cnt>0) session.commit();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session != null) session.close();
	}
	return cnt;
}
	


}



