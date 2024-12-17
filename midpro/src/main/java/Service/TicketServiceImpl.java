package Service;

import java.util.List;

import Dao.ReviewDaoImpl;
import Dao.TicketDaoImpl;
import DaoInterface.ITicketDao;
import ServiceInterface.ITicketService;
import Vo.TicketVO;

public class TicketServiceImpl implements ITicketService {

	private static TicketServiceImpl service;
	private TicketServiceImpl dao;
	
	private TicketServiceImpl() {
		dao = TicketServiceImpl.getInstance();
		}
		
		public static TicketServiceImpl getInstance() {
			if(service==null) service = new TicketServiceImpl();
			
			return service;
		}

	
	
	
	
	
	
	
	@Override
	public List<TicketVO> getAllTicket() {
		// TODO Auto-generated method stub
		return null;
	}


	

}
