package Service;

import java.util.List;

import Dao.ScheduleDaoImpl;
import DaoInterface.IScheduleDao;
import ServiceInterface.IScheduleService;
import Vo.ScheduleVO;

public class ScheduleServiceImpl implements IScheduleService{
	private IScheduleDao dao;
	
	private static ScheduleServiceImpl service;
	  
	private ScheduleServiceImpl() {
		dao = ScheduleDaoImpl.getInstance();
	}
		
	public static ScheduleServiceImpl getInstance() {
		if(service==null) service = new ScheduleServiceImpl();
		return service;
	}

	@Override
	public List<ScheduleVO> getScheduleName(String Movie_name) {
		return dao.getScheduleName(Movie_name);
	}

	@Override
	public List<ScheduleVO> getScheduleScreenId(int Screen_ID) {
		return dao.getScheduleScreenId(Screen_ID);
	}

	@Override
	public List<ScheduleVO> getAllDetail() {
		return dao.getAllDetail();
	}
	
}
