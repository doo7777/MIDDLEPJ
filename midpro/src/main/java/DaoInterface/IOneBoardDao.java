package DaoInterface;

import java.util.List;

import Vo.OneBoardVO;

public interface IOneBoardDao {
	/**
	 * 게시물 등록
	 * @param boardVO
	 * @return
	 */
	public int insertBoard(OneBoardVO boardVO);
	/**
	 * 게시물 삭제
	 * @param Board_ID
	 * @return
	 */
	public int deleteBoard(String oneonone_id);
	
	
	public List<OneBoardVO> getAllBoard();
	
}
