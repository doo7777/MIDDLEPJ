package Service;

import java.util.List;

import Dao.NoticeDaoImpl;
import DaoInterface.INoticeDao;
import DaoInterface.IScreenDao;
import ServiceInterface.IScreenService;
import Vo.ScreenVO;

public class ScreenServiceImpl implements IScreenService{
	
	private static ScreenServiceImpl service;
	private IScreenDao dao;
	
	private ScreenServiceImpl() {
		dao = ScreenServiceImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service==null) service = new NoticeServiceImpl();
		
		return service;
	}
	
	

	@Override
	public List<ScreenVO> getAllScreen() {
		// TODO Auto-generated method stub
		return null;
	}

}
