package Service;

import java.util.List;

import Dao.NoticeDaoImpl;
import DaoInterface.INoticeDao;
import ServiceInterface.INoticeService;
import Vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	
	private static NoticeServiceImpl service;
	private INoticeDao dao;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service==null) service = new NoticeServiceImpl();
		
		return service;
	}
	
	

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return dao.insertNotice(noticeVO);
	}

	@Override
	public int deleteNotice(String notice_ID) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(notice_ID);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeVO> getAllNotice() {
		// TODO Auto-generated method stub
		return dao.getAllNotice();
	}

	@Override
	public NoticeVO getNotice(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int CountNoticeView(String notice_ID) {
		// TODO Auto-generated method stub
		return dao.CountNoticeView(notice_ID);
	}
	
	

}
