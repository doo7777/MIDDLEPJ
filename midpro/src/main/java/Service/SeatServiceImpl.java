package Service;

import java.util.List;

import Dao.SeatDaoImpl;
import DaoInterface.ISeatDao;
import ServiceInterface.ISeatService;
import Vo.SeatVO;

public class SeatServiceImpl implements ISeatService{
	
	private static SeatServiceImpl service;
	private ISeatDao dao;
	
	private SeatServiceImpl() {
		dao = SeatDaoImpl.getInstance();
	}
	
	public static SeatServiceImpl getInstance() {
		if( service==null) service = new SeatServiceImpl();
		
		return service;
	}

	@Override
	public int updateSeat(SeatVO seatVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SeatVO> getAllSeat() {
		// TODO Auto-generated method stub
		return dao.getAllSeat();
	}

	@Override
	public int getSeatCount(int Seat_ID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SeatVO> getReservSeat(SeatVO seatVO) {
		// TODO Auto-generated method stub
		return null;
	}

}
