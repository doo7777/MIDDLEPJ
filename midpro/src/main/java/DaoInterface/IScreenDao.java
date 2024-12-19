package DaoInterface;

import java.util.List;

import Vo.NoticeVO;
import Vo.ScreenVO;

public interface IScreenDao {
	
	/**
	 * 상영관 모두 보기
	 * @param title
	 * @return
	 */
	public List<ScreenVO> getAllScreen();
	
}
