package DaoInterface;

import java.util.List;

import Vo.NoticeVO;

public interface INoticeDao {
	/**
	 * 관리자 공지사항 등록
	 * @param noticeVO
	 * @return
	 */
	public int insertNotice(NoticeVO noticeVO);
	/**
	 * 공지사항 삭제
	 * @param notice_ID
	 * @return
	 */
	public int deleteNotice(int notice_ID);
	/**
	 * 공지사항 수정
	 * @param noticeVO
	 * @return
	 */
	public int updateNotice(NoticeVO noticeVO);
	/**
	 * 전체 공지사항 보여줌
	 * @return
	 */
	public List<NoticeVO> getAllNotice();
	/**
	 * 게시물 제목으로 공지글 검색
	 * @param title
	 * @return
	 */
	public NoticeVO getNotice(String title);
	

}
