package Service;

import java.util.List;

import Dao.TheaterDaoImpl;
import DaoInterface.ITheaterDao;
import ServiceInterface.ITheaterService;
import Vo.TheaterVO;

public class TheaterServiceImpl implements ITheaterService{
	private ITheaterDao dao;
	
	private static TheaterServiceImpl service;
	
	private TheaterServiceImpl() {
		dao = TheaterDaoImpl.getInstance();
	}
	
	public static TheaterServiceImpl getInstance() {
		if(service==null) service = new TheaterServiceImpl();
		return service;
	}

	@Override
	public List<TheaterVO> getAllTheater() {
		return dao.getAllTheater();
		
	}

	@Override
	public TheaterVO getTheater(String Theater_name) {
		return dao.getTheater(Theater_name);
	}

	
}
