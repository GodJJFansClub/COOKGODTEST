package Menu_Order;

import java.sql.*;

public class MenuOrderVO {
	
	private String menuOdId;
	private String menuOdStatus;
	private Timestamp menuOdStart;
	private Timestamp menuOdBook;
	private Date menuOdEnd;
	private Integer menuOdRate;
	private String menuOdMsg;
	private String custId;
	private String chefId;
	private String menuId;
	
	public String getMenuOdId() {
		return menuOdId;
	}
	public void setMenuOdId(String menuOdId) {
		this.menuOdId = menuOdId;
	}
	public String getMenuOdStatus() {
		return menuOdStatus;
	}
	public void setMenuOdStatus(String menuOdStatus) {
		this.menuOdStatus = menuOdStatus;
	}
	public Timestamp getMenuOdStart() {
		return menuOdStart;
	}
	public void setMenuOdStart(Timestamp menuOdStart) {
		this.menuOdStart = menuOdStart;
	}
	public Timestamp getMenuOdBook() {
		return menuOdBook;
	}
	public void setMenuOdBook(Timestamp menuOdBook) {
		this.menuOdBook = menuOdBook;
	}
	public Date getMenuOdEnd() {
		return menuOdEnd;
	}
	public void setMenuOdEnd(Date menuOdEnd) {
		this.menuOdEnd = menuOdEnd;
	}
	public Integer getMenuOdRate() {
		return menuOdRate;
	}
	public void setMenuOdRate(Integer menuOdRate) {
		this.menuOdRate = menuOdRate;
	}
	public String getMenuOdMsg() {
		return menuOdMsg;
	}
	public void setMenuOdMsg(String menuOdMsg) {
		this.menuOdMsg = menuOdMsg;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getChefId() {
		return chefId;
	}
	public void setChefId(String chefId) {
		this.chefId = chefId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
}
