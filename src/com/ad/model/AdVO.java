package com.ad.model;

import java.sql.Timestamp;

public class AdVO {
	private String adId;
	private Integer adStatus;
	private Timestamp adStart;
	private Timestamp adEnd;
	private Integer adType;
	private String adTitle;
	private String adCon;
	private String foodSupId;
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public Integer getAdStatus() {
		return adStatus;
	}
	public void setAdStatus(int i) {
		this.adStatus = i;
	}
	public Timestamp getAdStart() {
		return adStart;
	}
	public void setAdStart(Timestamp adStart) {
		this.adStart = adStart;
	}
	public Timestamp getAdEnd() {
		return adEnd;
	}
	public void setAdEnd(Timestamp adEnd) {
		this.adEnd = adEnd;
	}
	public Integer getAdType() {
		return adType;
	}
	public void setAdType(int i) {
		this.adType = i;
	}
	public String getAdTitle() {
		return adTitle;
	}
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}
	public String getAdCon() {
		return adCon;
	}
	public void setAdCon(String adCon) {
		this.adCon = adCon;
	}
	public String getFoodSupId() {
		return foodSupId;
	}
	public void setFoodSupId(String foodSupId) {
		this.foodSupId = foodSupId;
	}
	
}
