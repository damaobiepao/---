package webMybatis.storeinformation;

public class StoreInformation {
	public String phone;
	public String name;
	public String deliveryfee;
	public String phone2;
	public String storetype;
	public String productcategory;
	
	public StoreInformation(String phone, String name, String deliveryfee, String storetype) {
		super();
		this.phone = phone;
		this.name = name;
		this.deliveryfee = deliveryfee;
		this.storetype = storetype;
	}
	public StoreInformation() {
		super();
		// TODO 自动生成的构造函数存根
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeliveryfee() {
		return deliveryfee;
	}
	public void setDeliveryfee(String deliveryfee) {
		this.deliveryfee = deliveryfee;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getStoretype() {
		return storetype;
	}
	public void setStoretype(String storetype) {
		this.storetype = storetype;
	}
	public String getProductcategory() {
		return productcategory;
	}
	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}
	
}
