package DaoInterface;

import java.util.List;

import Vo.Lost_ArticleVO;

public interface ILost_ArticleDao {

	/**
	 * 분실물 문의 삽입
	 * @param articleVO
	 * @return
	 */
	public int insertLost(Lost_ArticleVO articleVO);
	
	
	/**
	 * 분실물 문의 삭제
	 * @param Lost_id
	 * @return
	 */
	public int deleteLost(int Lost_id);
	
	/**
	 * 분실물 문의 조회
	 * @return
	 */
	public List<Lost_ArticleVO>getAllLost();
	
	/**
	 * 글 상세 보기
	 * @param Lost_id
	 * @return
	 */
	public Lost_ArticleVO getLost(int Lost_id);
	
	
}
