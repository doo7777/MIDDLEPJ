package ServiceInterface;

import java.util.List;

import Vo.OneBoardVO;

public interface IOneBoardService {
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

	public int deleteBoard(int Board_ID);
	/**
	 * 전체 게시판 보기
	 * @return
	 */
	public List<OneBoardVO> getAllBoard();
}