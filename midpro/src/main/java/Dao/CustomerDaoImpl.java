package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.ICustomerDao;
import Util.MybatisUtil;
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
		
		int cnt=0;
		
		try {
			cnt = session.insert(null);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}

	@Override
	public int getCoustomerCount(String cus_ID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCustomer(String cus_ID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCustomer(CustomerVO cusVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CustomerVO> getAllCustomer() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO getCustomer(String cus_ID) {
		// TODO Auto-generated method stub
		return null;
	}

}
