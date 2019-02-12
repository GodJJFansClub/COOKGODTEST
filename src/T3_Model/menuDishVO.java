package T3_Model;

import java.io.Serializable;

public class menuDishVO implements Serializable{

	private String menuid;
	private String dishid;
	public String getMenuid() {
		return menuid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	
	
}
