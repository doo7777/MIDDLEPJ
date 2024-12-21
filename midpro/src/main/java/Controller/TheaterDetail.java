package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.ScheduleServiceImpl;
import Service.TheaterServiceImpl;
import ServiceInterface.IScheduleService;
import ServiceInterface.ITheaterService;
import Vo.ScheduleVO;
import Vo.TheaterVO;


@WebServlet("/theaterDetail.do")
public class TheaterDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String thName = request.getParameter("theater_name");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		TheaterVO thVo = service.getTheater(thName);
		
		
		IScheduleService scheduleService = ScheduleServiceImpl.getInstance(); // 추가		
		List<ScheduleVO> scheduleList = scheduleService.getScheduleThName(thVo.getTheater_name()); // 추가
		
		
		
		request.setAttribute("theaterVo", thVo);
		request.setAttribute("scd", scheduleList);  // 추가
		
		request.getRequestDispatcher("/theater/TheaterDetail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
