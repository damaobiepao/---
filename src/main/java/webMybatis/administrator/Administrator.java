package webMybatis.administrator;

public class Administrator {
	public String adminname;
	public String adminpass;
	
	public Administrator() {
		super();
		// TODO �Զ����ɵĹ��캯�����
	}
	public Administrator(String adminname, String adminpass) {
		super();
		this.adminname = adminname;
		this.adminpass = adminpass;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpass() {
		return adminpass;
	}
	public void setAdminpass(String adminpass) {
		this.adminpass = adminpass;
	}
	

	
}
