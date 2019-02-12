package T3_Model;

import java.io.Serializable;

public class dishFoodVO implements Serializable{

	private String dishid;
	private String foodid;
	private int dishfqty;
	private String dishfunit;
	public String getDishid() {
		return dishid;
	}
	public void setDishid(String dishid) {
		this.dishid = dishid;
	}
	public String getFoodid() {
		return foodid;
	}
	public void setFoodid(String foodid) {
		this.foodid = foodid;
	}
	public int getDishfqty() {
		return dishfqty;
	}
	public void setDishfqty(int dishfqty) {
		this.dishfqty = dishfqty;
	}
	public String getDishfunit() {
		return dishfunit;
	}
	public void setDishfunit(String dishfunit) {
		this.dishfunit = dishfunit;
	}
	
	
}
