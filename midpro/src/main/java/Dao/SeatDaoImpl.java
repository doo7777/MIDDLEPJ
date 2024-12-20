package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.ISeatDao;
import Util.MybatisUtil;
import Vo.ReservationVO;
import Vo.SeatVO;

public class SeatDaoImpl implements ISeatDao{
	
	private static SeatDaoImpl dao;
	private SeatDaoImpl() {}
	public static SeatDaoImpl getInstance() {
		if(dao==null) dao = new SeatDaoImpl();
		
		return dao;
	}

	@Override
	public int updateSeat(SeatVO seatVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SeatVO> getAllSeat() {
		
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<SeatVO>seatList = null;
		
		try {
			seatList = session.selectList("Movie.getAllSeat");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return seatList;
	}

	@Override
	public int getSeatCount(int Seat_ID) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	   @Override
	   public List<SeatVO> getReservSeat(ReservationVO reservationVO) {
	      SqlSession session = MybatisUtil.getSqlSession();
	      
	      List<SeatVO>ReservSeatList = null;
	      
	      try {
	         ReservSeatList = session.selectList("Movie.getReservSeat",reservationVO);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if(session != null) session.close();
	      }
	      
	      return ReservSeatList;
	   }


}
