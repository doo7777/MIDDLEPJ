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
   
    
   
   /** screen_id ==> theater_name으로 수정한 부분
    * 영화관명을 받아서 영화의 상영시간표를 알려줌
    * @param Theater_name
    * @return
    */
   public List<ScheduleVO> getScheduleThName(String Theater_name);
   
      
   /**
    * 전체 상영 영화 시간표를 보여줌
    * @return
    */
   public List<ScheduleVO> getAllDetail();
   

    /**
     * 영화 이름, 날짜, 극장 이름, 지역을 받아서 상영 시간표를 가져옴
     * @param scheduleVO
     * @return
     */
    public List<ScheduleVO> getScheduleByMovie(ScheduleVO scheduleVO);
}
