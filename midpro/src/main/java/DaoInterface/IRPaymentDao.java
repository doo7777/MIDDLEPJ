package DaoInterface;

import java.util.List;

import Vo.RPaymentVO;

public interface IRPaymentDao {
   
	//결제 정보 추가
	int insertRPayment(RPaymentVO rpaymentVO);
    
	//결제 정보 조회
	 List<RPaymentVO> getAllRPayment(); 

}
