package DaoInterface;

import java.util.List;

import Vo.CustomerVO;

public interface ICustomerDao {
	/**
	 * 회원 가입
	 * @param cusVO
	 * @return
	 */
	public int insertCustomer(CustomerVO cusVO);
	
	/**
	 * 회원 ID중복검사
	 * @param cus_ID
	 * @return
	 */
	public int getCoustomerCountid(String cus_ID);

	/**
	 * 회원 번호 중복검사
	 * @param cus_number
	 * @return
	 */
	public int getCoustomerCountnumber(String cus_number);
	
	
	/**
	 * 전체 회원 보기
	 * @return
	 */
	public List<CustomerVO> getAllCustomer();
	
	/**
	 * 회원 ID로 회원 정보 받기
	 * @param cus_ID
	 * @return
	 */
	public CustomerVO getCustomer(String cus_ID, String cus_pw);
	
	/**
	 * 회원 이메일로 회원 정보 받기 
	 * @param cus_email
	 * @return
	 */
	public CustomerVO getCustomer(String cus_email);
	
}
