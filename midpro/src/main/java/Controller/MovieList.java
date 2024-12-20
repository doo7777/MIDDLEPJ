package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import Service.MovieServiceImpl;
import ServiceInterface.IMovieService;
import Vo.MovieVO;

@WebServlet("/movieList.do")
public class MovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMovieService service = MovieServiceImpl.getInstance();
		
		String movie_id = request.getParameter("movie_id");
		
		List<MovieVO> movieList = service.getAllMovie();
		
		 HttpSession session = request.getSession();
		 
//		 if(movieList!=null) {
//	        	session.setAttribute("ok", movieList);
//	        }
		 
		request.setAttribute("movieList", movieList);
		request.getRequestDispatcher("/Movie/movieList.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
