package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.ScheduleServiceImpl;
import ServiceInterface.IScheduleService;
import Vo.ScheduleVO;


@WebServlet("/scheduleList.do")
public class ScheduleList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		
		List<ScheduleVO>scdList = service.getAllSchedule();
		
		request.setAttribute("scd", scdList);
		
		request.getRequestDispatcher("/schedule/ScheduleList.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
