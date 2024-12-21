package Service;

import java.util.List;

import Dao.RPaymentDaoImpl;
import DaoInterface.IRPaymentDao;
import ServiceInterface.IRPaymentService;
import Vo.RPaymentVO;

public class RPaymentServiceImpl implements IRPaymentService{
 private static RPaymentServiceImpl service;
 private IRPaymentDao dao;
 
 private RPaymentServiceImpl() {
	 dao = RPaymentDaoImpl.getInstance();
 }
 
 public  static RPaymentServiceImpl getInstance() {
	 if(service==null) service = new RPaymentServiceImpl();
	 
	 return service;
 }
	
	
	@Override
	public int insertRPayment(RPaymentVO rpaymentVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RPaymentVO> getAllRPayment() {
		// TODO Auto-generated method stub
		return null;
	}

}
