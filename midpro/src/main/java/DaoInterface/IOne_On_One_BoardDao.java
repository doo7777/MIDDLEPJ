package DaoInterface;

import java.util.List;

import Vo.One_On_One_BoardVO;

public interface IOne_On_One_BoardDao {
	/**
	 * 게시물 등록
	 * @param boardVO
	 * @return
	 */
	public int insertBoard(One_On_One_BoardVO boardVO);
	/**
	 * 게시물 삭제
	 * @param Board_ID
	 * @return
	 */
	public int deleteBoard(int Board_ID);
	/**
	 * 게시물 수정 
	 * @param boardVO
	 * @return
	 */
	public int updateBoard(One_On_One_BoardVO boardVO);
	/**
	 * 전체 게시판 보기
	 * @return
	 */
	public List<One_On_One_BoardVO> getAllBoard();
//	/**
//	 * 게시물 글 번호로 게시글 갯수 검색
//	 * @param Board_ID
//	 * @return
//	 */
//	public int getBoadrCount(int Board_ID); 
	/**
	 * 게시글 번호로 게시물 검색
	 * @param Board_ID
	 * @return
	 */
	public One_On_One_BoardVO getBoard(int Board_ID);
}
