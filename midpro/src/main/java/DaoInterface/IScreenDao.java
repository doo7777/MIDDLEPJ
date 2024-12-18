package DaoInterface;

import java.util.List;

import Vo.NoticeVO;
import Vo.ScreenVO;

public interface IScreenDao {
	
	/**
	 * 게시물 제목으로 공지글 검색
	 * @param title
	 * @return
	 */
	public List<ScreenVO> getAllScreen();
	
}
