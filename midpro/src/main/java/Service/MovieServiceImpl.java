package Service;

import java.util.List;

import Dao.MovieDaoImpl;
import DaoInterface.IMovieDao;
import ServiceInterface.IMovieService;
import Vo.MovieVO;

public class MovieServiceImpl implements IMovieService{
	
	private static MovieServiceImpl service;
	private IMovieDao dao;
	
	private MovieServiceImpl() {
		dao = MovieDaoImpl.getInstance();
	}
	
	public static MovieServiceImpl getInstance() {
		if(service==null) service = new MovieServiceImpl();
		
		return service;
	}

	@Override
	public List<MovieVO> getAllMovie() {
		// TODO Auto-generated method stub
		return dao.getAllMovie();
	}

	@Override
	public MovieVO getMovie(String Moive_name) {
		// TODO Auto-generated method stub
		return null;
	}

}
