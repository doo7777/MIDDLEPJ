package Dao;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import DaoInterface.IRPaymentDao;
import Util.MybatisUtil;
import Vo.RPaymentVO;

public class RPaymentDaoImpl implements IRPaymentDao{
	
private static RPaymentDaoImpl dao;

private RPaymentDaoImpl() {}

public static RPaymentDaoImpl getInstance() {
	
	if(dao==null) {
		dao=new RPaymentDaoImpl();
	}
	return dao;
}

//결제 정보 추가
@Override
public int insertRPayment(RPaymentVO rpaymentVO) {
	SqlSession session = MybatisUtil.getSqlSession();
	
	int cnt = 0;
	
	try {
		cnt = session.insert("RPayment.insertRPayment", rpaymentVO);
		if(cnt>0)session.commit();
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(session != null)session.close();
	}
	return cnt;
	
}
//결제 정보 조회
public List<RPaymentVO> getAllRPayment(){
	  SqlSession session = MybatisUtil.getSqlSession();
	  List<RPaymentVO> rpaymentList = null;
	  
	  try {
		rpaymentList = session.selectList("RPayment.getAllRPayment");
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(session != null)session.close();
	}
	  
	  return rpaymentList;
	  
	}
	


}
