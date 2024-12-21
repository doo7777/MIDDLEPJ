package ServiceInterface;

import java.util.List;

import Vo.TicketVO;

public interface ITicketService {

	
	/**
	 * 요금을 조회하는 메서드
	 * 
	 */
	public List<TicketVO>getAllTicket();
}
