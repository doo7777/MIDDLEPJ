package Controller;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Util.MybatisUtil;
import Vo.MovieVO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchMovie.do")
public class SearchMovie extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자가 입력한 검색어를 받는다
        String query = request.getParameter("query");
        System.out.println("query : " + query);
        
        // MyBatis 세션을 열어 DB에서 검색 결과를 가져온다
        SqlSession session = MybatisUtil.getSqlSession();
        try {
            // DB에서 검색된 영화 목록을 가져온다
            List<MovieVO> movieList = session.selectList("Movie.searchMovies", query);
            
            // 결과를 request에 저장
            request.setAttribute("movieList", movieList);
            
            // 검색 결과를 다른 JSP 페이지로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Movie/showMovies.jsp");
            dispatcher.forward(request, response);  // showMovies.jsp로 포워딩
        } finally {
            session.close();
        }
    }
}
