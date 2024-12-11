package DaoInterface;

import java.util.List;

import Vo.PaymentVO;

public interface IPaymentDao {
	
	/**
	 * 
	 * 결제 정보 삽입
	 * @param paymentVO
	 * @return
	 * EX) 결제 금액, 결제 수단, 결제 상태
	 */
	

	  public int insertPayment(PaymentVO paymentVO);
	  
	  /**
	   * 관리자
	   * 결제 정보 조회
	   * 
	   * @return
	   */
	  public List<PaymentVO>getAllPayment();
	  
	  
	  /**
	   * 사용자
	   * 결제 전체  조회
	   * @param Customer_ID
	   * @return
	   */
	 public List<PaymentVO>getPaymentAll(int Customer_ID);
	 
	 /**
	  * 사용자
	  * 결제 내역 조회
	  * @param Customer_ID
	  * @return
	  */
	 public PaymentVO getPayment(int Customer_ID);
	
	  
	  
}
