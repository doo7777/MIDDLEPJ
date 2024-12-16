package DaoInterface;

import java.util.List;

import Vo.OneBoard;

public interface IOneBoardDao {
	/**
	 * 게시물 등록
	 * @param boardVO
	 * @return
	 */
	public int insertBoard(OneBoard boardVO);
	/**
	 * 게시물 삭제
	 * @param Board_ID
	 * @return
	 *
	public int deleteBoard(int Board_ID);
	/**
	 * 게시물 수정 
	 * @param boardVO
	 * @return
	 */
	public int updateBoard(OneBoard boardVO);
	/**
	 * 전체 게시판 보기
	 * @return
	 */
	public List<OneBoard> getAllBoard();
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
	public OneBoard getBoard(int Board_ID);
}
