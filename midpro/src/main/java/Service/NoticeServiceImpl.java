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
		return dao.updateNotice(noticeVO);
	}

	@Override
	public List<NoticeVO> getAllNotice() {
		// TODO Auto-generated method stub
		return dao.getAllNotice();
	}

	@Override
	public List<NoticeVO> searchNotice (String title) {
		// TODO Auto-generated method stub
		return dao.searchNotice(title);
	}

	@Override
	public int CountNoticeView(String notice_id) {
		// TODO Auto-generated method stub
		return dao.CountNoticeView(notice_id);
	}

	
	

}
