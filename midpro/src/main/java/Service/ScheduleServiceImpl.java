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
   
   
// screen_id ==> theater_name 수정한 부분-------------------------------
   
   @Override
   public List<ScheduleVO> getScheduleThName(String Theater_name) {
      return dao.getScheduleThName(Theater_name);
   }

   @Override
   public List<ScheduleVO> getAllDetail() {
      return dao.getAllDetail();
   }
   
   
   @Override
    public List<ScheduleVO> getScheduleByMovie(ScheduleVO scheduleVO){
      return dao.getScheduleByMovie(scheduleVO);
   }
	

	
	@Override
	public List<ScheduleVO> getAllSchedule(){
		return dao.getAllSchedule();
	}

	
}
