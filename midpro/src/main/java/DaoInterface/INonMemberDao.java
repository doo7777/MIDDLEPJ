package DaoInterface;

import java.util.List;

import Vo.NonMemberVO;

public interface INonMemberDao {
	/**
	 * 비회원 정보 등록
	 * @param nonMemberVO
	 * @return
	 */
	public int insertNonMember(NonMemberVO nonMemberVO);
	/**
	 * 비회원 정보 삭제
	 * @param nonMember_ID
	 * @return
	 */
	public int deleteNonMember(String nonMember_ID);
	/**
	 * 비회원 전체 결제내역 & 문의내역 보기
	 * @return
	 */
	public List<NonMemberVO> getAllNonMember();
	/**
	 * 비회원의 내역 & 문의내역의 갯수 보기
	 * @param nonMember_ID
	 * @return
	 */
	public int getNonMemberCount(String nonMember_ID);
	/**
	 * 비회원 ID를 입력해서 입력했던 비회원 정보 보기
	 * @param nonMember_ID
	 * @return
	 */
	public NonMemberVO getNonMember(String nonMember_ID);
	
}
	
