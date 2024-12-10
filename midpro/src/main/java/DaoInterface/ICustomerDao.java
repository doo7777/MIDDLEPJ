package DaoInterface;

import java.util.List;

import Vo.CustomerVO;

public interface ICustomerDao {
	//회원가입
	public int insertCustomer(CustomerVO cusVO);
	
	//중복 검사(?)
	public int getCoustomerCount(String cus_ID);
	
	//회원 탈퇴
	public int deleteCustomer(String cus_ID);
	
	//회원 수정
	public int updateCustomer(CustomerVO cusVO);
	
	//전체 회원 서칭 
	public List<CustomerVO> getAllCustomer();
	
	//ID로 회원 정보 가져오기
	public CustomerVO getCustomer(String cus_ID);
	
}