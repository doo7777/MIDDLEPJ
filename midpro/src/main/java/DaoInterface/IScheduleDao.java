package DaoInterface;

import java.util.List;

import Vo.ScheduleVO;

public interface IScheduleDao {
	/**
	 * 영화 제목을 받아서 영화의 상영시간표를 알려줌
	 * @param Movie_name
	 * @return
	 */
	public List<ScheduleVO> getScheduleName(String Movie_name);
	
	 
	
	/**
	 * 상영관 ID를 받아서 영화의 상영시간표를 알려줌
	 * @param Screen_ID
	 * @return
	 */
	public List<ScheduleVO> getScheduleScreenId(int Screen_ID);
	
	
	
	/**
	 * 전체 상영 영화 시간표를 보여줌
	 * @return
	 */
	public List<ScheduleVO> getAllDetail();



	
	
	  List<ScheduleVO> getAllSchedule();
	

    /**
     * 영화 이름, 날짜, 극장 이름, 지역을 받아서 상영 시간표를 가져옴
     * @param scheduleVO
     * @return
     */
    public List<ScheduleVO> getScheduleByMovie(ScheduleVO scheduleVO);
}
