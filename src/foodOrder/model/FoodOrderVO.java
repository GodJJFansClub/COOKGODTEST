package foodOrder.model;

import java.sql.Date;

public class FoodOrderVO {
	private String foodOrId;
	private Integer foodOrStatus;
	private Date foodOrStart;
	private Date foodOrSend;
	private Date foodOrRcv;
	private Date foodOrEnd;
	private String foodOrName;
	private String foodOrAddr;
	private Integer foodOrTel;
	private String custId;
	public String getFoodOrId() {
		return foodOrId;
	}
	public void setFoodOrId(String foodOrId) {
		this.foodOrId = foodOrId;
	}
	public Integer getFoodOrStatus() {
		return foodOrStatus;
	}
	public void setFoodOrStatus(Integer foodOrStatus) {
		this.foodOrStatus = foodOrStatus;
	}
	public Date getFoodOrStart() {
		return foodOrStart;
	}
	public void setFoodOrStart(Date foodOrStart) {
		this.foodOrStart = foodOrStart;
	}
	public Date getFoodOrSend() {
		return foodOrSend;
	}
	public void setFoodOrSend(Date foodOrSend) {
		this.foodOrSend = foodOrSend;
	}
	public Date getFoodOrRcv() {
		return foodOrRcv;
	}
	public void setFoodOrRcv(Date foodOrRcv) {
		this.foodOrRcv = foodOrRcv;
	}
	public Date getFoodOrEnd() {
		return foodOrEnd;
	}
	public void setFoodOrEnd(Date foodOrEnd) {
		this.foodOrEnd = foodOrEnd;
	}
	public String getFoodOrName() {
		return foodOrName;
	}
	public void setFoodOrName(String foodOrName) {
		this.foodOrName = foodOrName;
	}
	public String getFoodOrAddr() {
		return foodOrAddr;
	}
	public void setFoodOrAddr(String foodOrAddr) {
		this.foodOrAddr = foodOrAddr;
	}
	public Integer getFoodOrTel() {
		return foodOrTel;
	}
	public void setFoodOrTel(Integer foodOrTel) {
		this.foodOrTel = foodOrTel;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	
}
