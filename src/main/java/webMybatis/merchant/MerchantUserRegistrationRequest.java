package webMybatis.merchant;

public class MerchantUserRegistrationRequest {
	public String name;
	public String phoneNumber;
	public String address;
	public MerchantUserRegistrationRequest() {
		
	}
	public MerchantUserRegistrationRequest(String name, String phoneNumber, String address) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
