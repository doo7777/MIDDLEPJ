package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.ITheaterDao;
import Util.MybatisUtil;
import Vo.TheaterVO;

public class TheaterDaoImpl implements ITheaterDao{
	
	private static TheaterDaoImpl dao;
	private TheaterDaoImpl() {}
	public static TheaterDaoImpl getInstance() {
		if(dao==null) dao = new TheaterDaoImpl();
		
		return dao;
	}

// 영화관 전체 조회 --------------------------------------------------------	
	@Override
	public List<TheaterVO> getAllTheater() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<TheaterVO> theaList = null;
		
		try {
			theaList = session.selectList("Theater.getAllTheater");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return theaList;
	}


	
// 이름으로 검색된 영화관 정보 조회 ------------------------------------------------	
	@Override
	public TheaterVO getTheater(String Theater_name) {
		TheaterVO theaterVo = null;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			
			theaterVo = session.selectOne("Theater.getTheater", Theater_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return theaterVo;
	}

}
