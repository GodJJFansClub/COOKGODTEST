package com.favChef.model;

public class FavChefVO {
	private String custId;
	private String chefId;

	public FavChefVO() {
		super();
	}

	public String getChefId() {
		return chefId;
	}

	public void setChefId(String chefId) {
		this.chefId = chefId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public FavChefVO(String chefId, String custId) {
		super();
		this.chefId = chefId;
		this.custId = custId;
	}

}
