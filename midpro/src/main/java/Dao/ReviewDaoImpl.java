package Dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import DaoInterface.IReviewDao;
import Util.MybatisUtil;
import Vo.ReviewVO;

public class ReviewDaoImpl implements IReviewDao {
    
    private static ReviewDaoImpl dao;

    private ReviewDaoImpl() {}

    public static ReviewDaoImpl getInstance() {
        if (dao == null) {
            dao = new ReviewDaoImpl();
        }
        return dao;
    }

    @Override
    public int insertReview(ReviewVO reviewVO) {
        SqlSession session = MybatisUtil.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.insert("Review.insertReview", reviewVO);
            if (cnt > 0) session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return cnt;
    }

    @Override
    public int deleteReview(int review_num) {
        SqlSession session = MybatisUtil.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.delete("Review.deleteReview", review_num);
            if (cnt > 0) session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return cnt;
    }

    @Override
    public int updateReview(ReviewVO reviewVO) {
        SqlSession session = MybatisUtil.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.update("Review.updateReview", reviewVO);
            if (cnt > 0) session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return cnt;
    }

    @Override
    public List<ReviewVO> getAllReview() {
        SqlSession session = MybatisUtil.getSqlSession();
        List<ReviewVO> reviewList = null;

        try {
            reviewList = session.selectList("Review.getAllReview");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return reviewList;
    }
}
