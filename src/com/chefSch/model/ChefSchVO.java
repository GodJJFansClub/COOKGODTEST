package com.chefSch.model;

import java.sql.*;

public class ChefSchVO {
	
	private String chefId;
	private String chefName;
	private Date chefSchDate;
	private String chefSchStatus;
	
	public String getChefId() {
		return chefId;
	}
	public void setChefId(String chefId) {
		this.chefId = chefId;
	}
	public String getChefName() {
		return chefName;
	}
	public void setChefName(String chefName) {
		this.chefName = chefName;
	}
	public Date getChefSchDate() {
		return chefSchDate;
	}
	public void setChefSchDate(Date chefSchDate) {
		this.chefSchDate = chefSchDate;
	}
	public String getChefSchStatus() {
		return chefSchStatus;
	}
	public void setChefSchStatus(String chefSchStatus) {
		this.chefSchStatus = chefSchStatus;
	}
}
