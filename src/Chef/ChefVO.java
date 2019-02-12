package Chef;

import java.sql.Clob;

public class ChefVO {
	
	private String ChefId;
	private String ChefName;
	private String ChefTel;
	private String ChefAddr;
	private String ChefArea;
	private String ChefStatus;
	private String ChefChannel;
	private Clob ChefResume;
	
	public String getChefId() {
		return ChefId;
	}
	public void setChefID(String chefId) {
		ChefId = chefId;
	}
	public String getChefName() {
		return ChefName;
	}
	public void setChefName(String chefName) {
		ChefName = chefName;
	}
	public String getChefTel() {
		return ChefTel;
	}
	public void setChefTel(String chefTel) {
		ChefTel = chefTel;
	}
	public String getChefAddr() {
		return ChefAddr;
	}
	public void setChefAddr(String chefAddr) {
		ChefAddr = chefAddr;
	}
	public String getChefArea() {
		return ChefArea;
	}
	public void setChefArea(String chefArea) {
		ChefArea = chefArea;
	}
	public String getChefStatus() {
		return ChefStatus;
	}
	public void setChefStatus(String chefStatus) {
		ChefStatus = chefStatus;
	}
	public String getChefChannel() {
		return ChefChannel;
	}
	public void setChefChannel(String chefChannel) {
		ChefChannel = chefChannel;
	}
	public Clob getChefResume() {
		return ChefResume;
	}
	public void setChefResume(Clob chefResume) {
		ChefResume = chefResume;
	}
}
