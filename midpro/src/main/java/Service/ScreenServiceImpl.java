package Service;

import java.util.List;

import Dao.NoticeDaoImpl;
import Dao.ScreenDaoImpl;
import DaoInterface.INoticeDao;
import DaoInterface.IScreenDao;
import ServiceInterface.IScreenService;
import Vo.ScreenVO;

public class ScreenServiceImpl implements IScreenService{
	
	private static ScreenServiceImpl service;
	private IScreenDao dao;
	
	private ScreenServiceImpl() {
		dao = ScreenDaoImpl.getInstance();
	}
	
	public static ScreenServiceImpl getInstance() {
		if(service==null) service = new ScreenServiceImpl();
		
		return service;
	}
	
	

	@Override
	public List<ScreenVO> getAllScreen() {
		// TODO Auto-generated method stub
		return dao.getAllScreen();
	}

}
