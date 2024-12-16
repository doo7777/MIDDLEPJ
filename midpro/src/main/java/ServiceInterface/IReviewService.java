package ServiceInterface;

import java.util.List;

import Vo.ReviewVO;

public interface IReviewService {
	/**
	 * 리뷰 추가 하는 메서드
	 * @param reviewVO
	 * @return
	 */
	public int insertReview(ReviewVO reviewVO);
	/**
	 * 리뷰 삭제하는 메서드
	 * @param review_num
	 * @return
	 */
	public int deleteReview(int review_num);
	
	/**
	 * 리뷰 삭제하는 메서드
	 * @param reviewVO
	 * @return
	 */
	public int updateReview(ReviewVO reviewVO);
	/**
	 * 전체 리뷰 조회한느 메서드
	 * @return
	 */
	public List<ReviewVO> getAllReview();
	
//	public ReviewVO getReview(int review_num); 보류
}
