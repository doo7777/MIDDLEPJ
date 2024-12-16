package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



import Service.ReviewServiceImpl;
import ServiceInterface.IReviewService;
import Vo.ReviewVO;


@WebServlet("/moviewReview.do")
public class MoviewReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	request.getRequestDispatcher("/review.jsp").forward(request, response);
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//요청에서 파라미터 가져오기
		String movieId = request.getParameter("movieId");
		String customerId = request.getParameter("customerId");
		String revStar = request.getParameter("revStar");
		String revContent = request.getParameter("revContent");
		
		
		// ReviewVO 객체 생성 및 값 설정
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setMovie_id(Integer.parseInt(movieId));
		reviewVo.setCustomer_id(customerId);
		reviewVo.setRev_star(Integer.parseInt(revStar));
		reviewVo.setRev_content(revContent);
		reviewVo.setRev_date(java.time.LocalDate.now().toString());
		
		//서비스호출 
		IReviewService service = ReviewServiceImpl.getInstance();
		int result = service.insertReview(reviewVo);
		
		response.getWriter().print(result);
		
	
	}

}
