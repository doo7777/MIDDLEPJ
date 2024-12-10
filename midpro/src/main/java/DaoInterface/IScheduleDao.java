package DaoInterface;

import java.util.List;

import Vo.ScheduleVO;

public interface IScheduleDao {
	/**
	 * 영화 ID를 받아서 영화의 상영시간표를 알려줌
	 * @param schedule_ID
	 * @return
	 */
	public ScheduleVO getSchedule(int Moive_ID);
	
	/**
	 * 전체 상영 영화 시간표를 보여줌
	 * @return
	 */
	public List<ScheduleVO> getAllSchedule();
	
}
