package T3_Model;

import java.io.Serializable;
import java.sql.Date;

public class dishVO implements Serializable{

	private String dishname;
	private String dishstatus;
	private String dishresume;
	private int dishprice;
	
	private String dishid;
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	public String getDishname() {
		return dishname;
	}
	public void setDishname(String dishname) {
		this.dishname = dishname;
	}
	public String getDishstatus() {
		return dishstatus;
	}
	public void setDishstatus(String dishstatus) {
		this.dishstatus = dishstatus;
	}
	public String getDishresume() {
		return dishresume;
	}
	public void setDishresume(String dishresume) {
		this.dishresume = dishresume;
	}
	public int getDishprice() {
		return dishprice;
	}
	public void setDishprice(int dishprice) {
		this.dishprice = dishprice;
	}
	
}
