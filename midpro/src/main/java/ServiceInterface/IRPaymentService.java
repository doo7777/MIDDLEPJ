package ServiceInterface;

import java.util.List;

import Vo.RPaymentVO;

public interface IRPaymentService {
 /**결제 정보를 DB에 삽입합니다
  * 
  */
int insertRPayment(RPaymentVO rpaymentVO);


/**
 * 결제 정보를 조회합니다
 */

List<RPaymentVO>getAllRPayment();
}
 