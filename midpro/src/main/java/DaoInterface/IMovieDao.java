package DaoInterface;

import java.util.List;

import Vo.MovieVO;

public interface IMovieDao {
	/**
	 * 전체 영화 보여줌
	 * @return
	 */
	public List<MovieVO> getAllMovie();
	/**
	 * 영화 이름으로 영화 정보 보여줌
	 * @param Moive_name
	 * @return
	 */
	public MovieVO getMovie(String Moive_name);
	
}
