package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Service.TheaterServiceImpl;
import ServiceInterface.ITheaterService;
import Vo.TheaterVO;


@WebServlet("/theaterList.do")
public class TheaterList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ITheaterService service = TheaterServiceImpl.getInstance();
		List<TheaterVO> theaList = service.getAllTheater();
		
		request.setAttribute("thea", theaList);
		request.getRequestDispatcher("/theater/TheaterMain.jsp").forward(request, response);
	}

		//
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
