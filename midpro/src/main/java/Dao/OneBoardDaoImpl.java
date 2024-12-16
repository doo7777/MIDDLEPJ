package Dao;

import java.util.List;

import DaoInterface.IOneBoardDao;
import Vo.OneBoard;

public class OneBoardDaoImpl implements IOneBoardDao{
	
	private static OneBoardDaoImpl dao;
	private OneBoardDaoImpl() {}
	public static OneBoardDaoImpl getInstance() {
		if(dao==null) dao = new OneBoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(OneBoard boardVO) {
		return 0;
	}
	@Override
	public int updateBoard(OneBoard boardVO) {
		return 0;
	}
	@Override
	public List<OneBoard> getAllBoard() {
		return null;
	}
	@Override
	public OneBoard getBoard(int Board_ID) {
		return null;
	}
	

}
