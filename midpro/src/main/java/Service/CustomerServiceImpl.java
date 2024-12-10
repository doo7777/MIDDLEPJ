package Service;

import java.util.List;

import Dao.CustomerDaoImpl;
import DaoInterface.ICustomerDao;
import ServiceInterface.ICustomerService;
import Vo.CustomerVO;

public class CustomerServiceImpl implements ICustomerService{
	
	private static CustomerServiceImpl service;
	private ICustomerDao dao;
	
	private CustomerServiceImpl() {
		dao = CustomerDaoImpl.getInstance();
	}
	

	@Override
	public int insertCustomer(CustomerVO cusVO) {
		// TODO Auto-generated method stub
		return dao.insertCustomer(cusVO);
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
