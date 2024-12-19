package ServiceInterface;

import java.util.List;

import Vo.MovieVO;
import Vo.ReservationVO;
import Vo.ScheduleVO;

import Vo.ScreenVO;
import Vo.TheaterVO;

public interface IReservationService {
    /**
     * 예약 정보를 데이터베이스에 삽입합니다.
     * 
     * @param reservationVO 예약 정보 객체
     * @return 삽입된 행의 수
     */
    int insertReservation(ReservationVO reservationVO);

    /**
     * 전체 영화 목록을 가져옵니다.
     * 
     * @return 영화 목록
     */
    List<MovieVO> getAllMovie();

    /**
     * 전체 극장 목록을 가져옵니다.
     * 
     * @return 극장 목록
     */
    List<TheaterVO> getAllTheater();

    /**
     * 전체 스케줄 목록을 가져옵니다.
     * 
     * @return 스케줄 목록
     */
    List<ScheduleVO> getAllSchedule();

    /**
     * 상영관의 전체 목록을 가져옵니다.
     * 
     * @return
     */


	List<ScreenVO> getAllScreen();
}
