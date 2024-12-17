package Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DaoInterface.IMovieDao;
import ServiceInterface.IMovieService;
import Util.MybatisUtil;
import Vo.MovieVO;

public class MovieDaoImpl implements IMovieDao{
	
	private static MovieDaoImpl dao;
	private MovieDaoImpl() {}
	public static MovieDaoImpl getInstance() {
		if(dao==null) dao = new MovieDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<MovieVO> getAllMovie() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<MovieVO>movieList = null;
		
		try {
			movieList = session.selectList("Movie.getAllMovies");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session !=null) session.close();
			
		}
		return movieList;
		
		
	}
	@Override
	public MovieVO getMovie(String Moive_name) {
		// TODO Auto-generated method stub
		return null;
	}

}
