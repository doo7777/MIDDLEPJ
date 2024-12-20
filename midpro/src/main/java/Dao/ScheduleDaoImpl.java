package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IScheduleDao;
import Util.MybatisUtil;
import Vo.NoticeVO;
import Vo.ScheduleVO;

public class ScheduleDaoImpl implements IScheduleDao{
	
	private static ScheduleDaoImpl dao;
	private ScheduleDaoImpl() {}
	public static ScheduleDaoImpl getInstance() {
		if(dao==null) dao = new ScheduleDaoImpl();
		
		return dao;
	}
	 
	
// 영화관-상영관 스케줄 전체 조회 ---------------------------------------------------	

	@Override
	public List<ScheduleVO> getAllDetail() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<ScheduleVO> scdList = null;
		
		try {
			scdList = session.selectList("Schedule.getAllDetail");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}		
		
		return scdList;
	}
	
// 영화제목으로 검색된 스케줄 조회	
	@Override
	public List<ScheduleVO> getScheduleName(String Movie_name) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<ScheduleVO> scdListNm = null;
		
		try {
			scdListNm = session.selectList("Schedule.getScheduleName", Movie_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return scdListNm;
	}
	
	@Override
	public List<ScheduleVO> getScheduleScreenId(int Screen_ID) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<ScheduleVO> scdListSId = null;
		
		try {
			scdListSId = session.selectList("Schedule.getScheduleScreenId", Screen_ID);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return scdListSId;
	}
	
	@Override
	public List<ScheduleVO> getAllSchedule() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<ScheduleVO>scheduleList =null;
		
		try {
			scheduleList = session.selectList("Schedule.getAllSchedule");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return scheduleList;
	}
	
	
    // 영화 이름, 날짜, 극장 이름, 지역으로 상영 스케줄 조회
    @Override
    public List<ScheduleVO> getScheduleByMovie(ScheduleVO scheduleVO) {
        SqlSession session = MybatisUtil.getSqlSession();
        List<ScheduleVO> scdListByMovie = null;

        try {
            scdListByMovie = session.selectList("Schedule.getScheduleByMovie", scheduleVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null) session.close();
        }

        return scdListByMovie;
    }
	


}
