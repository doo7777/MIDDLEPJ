package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.ITicketDao;
import Util.MybatisUtil;
import Vo.TicketVO;

public class TicketDaoImpl implements ITicketDao{

	
	
	
	@Override
	public List<TicketVO> getAllTicket() {
		SqlSession session = MybatisUtil.getSqlSession();
		List<TicketVO> ticketList =null;
		
		
		
		
		try {
			ticketList = session.selectList("Ticket.getAllTicket");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)session.close();
		}
		
		return ticketList;
	}

}
