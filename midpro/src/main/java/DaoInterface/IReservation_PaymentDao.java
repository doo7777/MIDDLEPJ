package DaoInterface;

import java.util.List;

import Vo.Reservation_PaymentVO;

public interface IReservation_PaymentDao {
	/**
	 * 
	 * @param reservation_PaymentVO
	 */
	  public int createReservation_Payment(Reservation_PaymentVO reservation_PaymentVO);
	    
	  public Reservation_PaymentVO getReservation_Payment (int reservation_Payment_ID);
	    
	  public List<Reservation_PaymentVO> getAllReservation_Payments();
	    

}
