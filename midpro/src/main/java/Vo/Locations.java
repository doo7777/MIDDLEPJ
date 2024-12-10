package Vo;

public class Locations {
	private String locations_id;
	private String locations_name;
	private int group_num;
	public String getLocations_id() {
		return locations_id;
	}
	public void setLocations_id(String locations_id) {
		this.locations_id = locations_id;
	}
	public String getLocations_name() {
		return locations_name;
	}
	public void setLocations_name(String locations_name) {
		this.locations_name = locations_name;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	@Override
	public String toString() {
		return "Locations [locations_id=" + locations_id + ", locations_name=" + locations_name + ", group_num="
				+ group_num + "]";
	}
	
	
	
}
