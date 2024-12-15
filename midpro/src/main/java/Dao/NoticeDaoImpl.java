package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.INoticeDao;
import Util.MybatisUtil;
import Vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao{
	
	private static NoticeDaoImpl dao;
	private NoticeDaoImpl() {}
	public static NoticeDaoImpl getInstance() {
		if(dao==null) dao = new NoticeDaoImpl();
		
		return dao;
	}
	@Override
	public int insertNotice(NoticeVO noticeVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("Board.insertNotice",noticeVO);
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
	public int deleteNotice(String notice_ID) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int cnt = 0;
			
		try {
			cnt = session.delete("Board.deleteNotice",notice_ID);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db연결실패~~~");
		} finally {
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		
		
		return 0;
	}

	@Override
	public List<NoticeVO> getAllNotice() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<NoticeVO>noticeList =null;
		
		try {
			noticeList = session.selectList("Board.getAllNotice");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return noticeList;
	}

	@Override

	public NoticeVO getNotice(String title ) {

		return null;
	}
	@Override
	public int CountNoticeView(String notice_id) {
		SqlSession session =MybatisUtil.getSqlSession();
		
		int cnt =0;
		
		try {
			cnt = session.update("Board.NoticeCount_view",notice_id);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session !=null) session.close();
		}
		
		
		return cnt;
	}

}
