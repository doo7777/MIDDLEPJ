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
	
	public static CustomerServiceImpl getInstance() {
		if(service==null) service = new CustomerServiceImpl();
		
		return service;
	}
	
	
	@Override
	public int insertCustomer(CustomerVO cusVO) {
		return dao.insertCustomer(cusVO);
	}

	@Override
	public int getCoustomerCount(String cus_ID) {
		return dao.getCoustomerCountid(cus_ID);
	}


	@Override
	public List<CustomerVO> getAllCustomer() {
		return dao.getAllCustomer();
	}

	@Override
	public CustomerVO getCustomer(String cus_ID, String cus_pw) {
		return dao.getCustomer(cus_ID, cus_pw);
	}

	@Override
	public int getCoustomerCountnumber(String cus_number) {
		return dao.getCoustomerCountnumber(cus_number);
	}

	@Override
	public CustomerVO getCustomer(String cus_email) {
		return dao.getCustomer(cus_email);
	}

}
