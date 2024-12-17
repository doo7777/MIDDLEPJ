package Service;

import java.util.List;

import Dao.OneBoardDaoImpl;
import DaoInterface.IOneBoardDao;
import ServiceInterface.IOneBoardService;
import Vo.OneBoardVO;

public class OneBoardServiceImpl implements IOneBoardService{

	private static OneBoardServiceImpl service;
	private IOneBoardDao dao;
	
	private OneBoardServiceImpl() {
		dao = OneBoardDaoImpl.getInstance();
	}
	
	public static OneBoardServiceImpl getInstance() {
		if(service==null) service = new OneBoardServiceImpl();
		return service;
	}
	
	@Override
	public int insertBoard(OneBoardVO boardVO) {
		return dao.insertBoard(boardVO);
	}

	@Override
	public int deleteBoard(String oneonone_id) {
		return dao.deleteBoard(oneonone_id);
	}

	@Override
	public List<OneBoardVO> getAllBoard() {
		return dao.getAllBoard();
	}



}