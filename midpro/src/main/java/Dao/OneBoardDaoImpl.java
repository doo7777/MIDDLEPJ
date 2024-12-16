package Dao;

import java.util.List;

import DaoInterface.IOneBoardDao;
import Vo.OneBoardVO;

public class OneBoardDaoImpl implements IOneBoardDao{
	
	private static OneBoardDaoImpl dao;
	private OneBoardDaoImpl() {}
	public static OneBoardDaoImpl getInstance() {
		if(dao==null) dao = new OneBoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(OneBoardVO boardVO) {
		return 0;
	}
	@Override
	public int updateBoard(OneBoardVO boardVO) {
		return 0;
	}
	@Override
	public List<OneBoardVO> getAllBoard() {
		return null;
	}
	@Override
	public OneBoardVO getBoard(int Board_ID) {
		return null;
	}
	

}
