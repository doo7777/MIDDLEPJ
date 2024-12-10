package DaoInterface;

import java.util.List;

import Vo.LocationsVO;

public interface ILocationsDao {
	/**
	 * 전국 지역을 다 보여줌
	 * @return
	 */
	public List<LocationsVO> getAllLocations();
	
	
	
}
