package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.ICustomerDao;
import Util.MybatisUtil;
import Util.PasswordUtil;
import Vo.CustomerVO;

public class CustomerDaoImpl implements ICustomerDao{
	
	private static CustomerDaoImpl dao;
	private CustomerDaoImpl() {}
	public static CustomerDaoImpl getInstance() {
		if(dao==null) dao = new CustomerDaoImpl();
		
		return dao;
	}
	

	@Override
	//회원등록 메서드=============================================
	public int insertCustomer(CustomerVO cusVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		  String hashedPassword = PasswordUtil.hashPassword(cusVO.getCust_pw());
	      cusVO.setCust_pw(hashedPassword); // 해싱된 패스워드를 VO 객체에 설정
	        
		int cnt=0;
		
		try {
			
			cnt = session.insert("Customer.insertCustomer", cusVO);
			if(cnt>0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int getCoustomerCountid(String cus_ID) {
		
		SqlSession session = MybatisUtil.getSqlSession();
		int cnt = 0;
		try {
			cnt =session.selectOne("Customer.getCustomerCountid",cus_ID);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return cnt;
	}
	
	//회원전체 조회================================
	@Override
	public List<CustomerVO> getAllCustomer() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<CustomerVO>custList = null;
		
		try {
			custList = session.selectList("Customer.getAllCustomer");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return custList;
	}

	@Override
	public CustomerVO getCustomer(String cus_ID, String cus_pw) {
		SqlSession session = MybatisUtil.getSqlSession();
		CustomerVO loginCustomerVo = null;
		
		CustomerVO customerVo = new CustomerVO();
		customerVo.setCustomer_id(cus_ID);
		customerVo.setCust_pw(cus_pw);
		
		try {
			loginCustomerVo = session.selectOne("Customer.getCustomerdetail", customerVo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return loginCustomerVo;
	}
	@Override
	public CustomerVO getCustomer(String cus_email) {
		SqlSession session = MybatisUtil.getSqlSession();
		CustomerVO loginCustomerVo = null;
		
		CustomerVO customerVo = new CustomerVO();
		customerVo.setCust_email(cus_email);
		try {
			loginCustomerVo = session.selectOne("Customer.getCustomer",customerVo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return loginCustomerVo;
	}
	@Override
	public int getCoustomerCountnumber(String cus_number) {
		SqlSession session = MybatisUtil.getSqlSession();
		int cnt = 0;
		try {
			cnt =session.selectOne("Customer.getCustomerCountnumber",cus_number);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

}
