package DaoInterface;

import java.util.List;

import Vo.LocationsVO;

public interface ILocationsDao {
	public List<LocationsVO> getAllLocations();
	
	public int getLocationsCount(String locations_ID);
	
	public LocationsVO getLocations(String Locations_NAME);
	
	
}
