package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IOneBoardDao;
import Util.MybatisUtil;
import Vo.NoticeVO;
import Vo.OneBoardVO;

public class OneBoardDaoImpl implements IOneBoardDao{
	
	private static OneBoardDaoImpl dao;
	private OneBoardDaoImpl() {}
	public static OneBoardDaoImpl getInstance() {
		if(dao==null) dao = new OneBoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(OneBoardVO OneBoardVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("Board.insertOneBoard",OneBoardVO);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패~~~~~~~");
		}  finally {
			if(session != null) session.close();
		}
		return cnt;
	}
	
	@Override
	public int deleteBoard(String oneonone_id) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int cnt =0;
		
		try {
			cnt = session.delete("Board.deleteOneBoard",oneonone_id);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session !=null) session.close();
		}
		
		return cnt;
	}
	
	
	@Override
	public List<OneBoardVO> getAllBoard() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<OneBoardVO>onboardList =null;
		
		try {
			onboardList = session.selectList("Board.getAllOneBoard");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return onboardList;
	}

}
