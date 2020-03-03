package webMybatis;

public class User {
	public String name;
	public String phone;
	public String password;
	//空
	public User() {
		
	}
	////构造方法-2个属性
	public User(String phone,String password) {
		this.phone=phone;
		this.password=password;
	}
	//构造方法-3个属性
	public User(String name,String phone,String password) {
		this.name=name;
		this.phone=phone;
		this.password=password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
