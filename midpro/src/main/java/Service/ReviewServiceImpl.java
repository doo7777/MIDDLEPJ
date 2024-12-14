package Service;

import java.util.List;

import Dao.ReviewDaoImpl;
import DaoInterface.IReviewDao;
import ServiceInterface.IReviewService;
import Vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	private static ReviewServiceImpl service;
	private IReviewDao dao;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	
	public static ReviewServiceImpl getInstance() {
		if(service==null) service = new ReviewServiceImpl();
		
		return service;
	}

	@Override
	public int insertReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int review_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewVO> getAllReview() {
		// TODO Auto-generated method stub
		return null;
	}
	 
	

}
