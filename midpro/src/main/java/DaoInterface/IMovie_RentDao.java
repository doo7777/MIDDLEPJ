package DaoInterface;

import java.util.List;

import Vo.Movie_RentVO;

public interface IMovie_RentDao {
	
<<<<<<< HEAD
=======
	/**
	 * VO객체 받아와 DB에 저장 => 대관시작,종료일,영화관위치,상영관,금액,고객명,인원
	 * @param MvRentVO
	 * @return
	 */
	public List<Movie_RentVO> insertRentMoive(Movie_RentVO MvRentVO);
	
	/**
	 * 예약자 id를 받아 대관예약을 취소하는 메서드
	 * @param customer_id
	 * @return
	 */
	public int deleteRentMoive(String customer_id);
	
	
	/**
	 * DB에 insert된 예약정보를 가져와 대관정보 변경
	 * @param MvRentVO
	 * @return
	 */
	public int updateRentMovie(Movie_RentVO MvRentVO);
	
	
	
	
	
	
	

>>>>>>> branch 'main' of https://github.com/doo7777/MIDDLEPJ.git
}
