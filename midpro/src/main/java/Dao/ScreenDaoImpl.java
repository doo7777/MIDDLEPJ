package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IScreenDao;
import Util.MybatisUtil;
import Vo.NoticeVO;
import Vo.ScreenVO;

public class ScreenDaoImpl implements IScreenDao{
	
	private static ScreenDaoImpl dao;
	private ScreenDaoImpl() {}
	
	public static ScreenDaoImpl getInstance() {
		if(dao==null) dao = new ScreenDaoImpl();
		
		return dao;
	}

	@Override
	public List<ScreenVO> getAllScreen() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<ScreenVO>ScreenList =null;
		
		try {
			ScreenList = session.selectList("Board.getAllNotice");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return ScreenList;
	}
	

}
