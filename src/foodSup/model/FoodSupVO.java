package foodSup.model;

public class FoodSupVO {
	private String foodSupId;
	private String foodSupName;
	private Integer foodSupStatus;
	private byte[] foodSupPic;
	private String foodSupResume;
	private byte[] foodSupLicense;
	
	public String getFoodSupId() {
		return foodSupId;
	}
	public void setFoodSupId(String foodSupId) {
		this.foodSupId = foodSupId;
	}
	public String getFoodSupName() {
		return foodSupName;
	}
	public void setFoodSupName(String foodSupName) {
		this.foodSupName = foodSupName;
	}
	public Integer getFoodSupStatus() {
		return foodSupStatus;
	}
	public void setFoodSupStatus(Integer foodSupStatus) {
		this.foodSupStatus = foodSupStatus;
	}
	public byte[] getFoodSupPic() {
		return foodSupPic;
	}
	public void setFoodSupPic(byte[] foodSupPic) {
		this.foodSupPic = foodSupPic;
	}
	public String getFoodSupResume() {
		return foodSupResume;
	}
	public void setFoodSupResume(String foodSupResume) {
		this.foodSupResume = foodSupResume;
	}
	public byte[] getFoodSupLicense() {
		return foodSupLicense;
	}
	public void setFoodSupLicense(byte[] foodSupLicense) {
		this.foodSupLicense = foodSupLicense;
	}
	
	
}
