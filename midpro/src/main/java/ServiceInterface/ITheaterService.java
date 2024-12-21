package ServiceInterface;

import java.util.List;

import Vo.TheaterVO;

public interface ITheaterService {
	
	/**
	 *	전체 영화관을 보여줌 
	 * @return
	 */
	public List<TheaterVO> getAllTheater();
	
	/**
	 * 영화관명을 받아서 그 영화관에 대한 정보를 보여줌
	 * @param Theater_name
	 * @return
	 */
	public TheaterVO getTheater(String Theater_name);
	

}
