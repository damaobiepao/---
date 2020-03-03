package webMybatis.orderinformation;

public class OrderInformation {
	private String  ordernumber;
	private String  date;
	private String  uid;
	private String  muid;
	private String  deliveryfee;
	private String  consigneename;
	private String  consigneephonenumber;
	private String  consigneesaddress;
	private String  productname;
	private String  producttypes;
	private String  productprice;
	private String  expectnumberofproducts;
	private String 	status;
	public OrderInformation() {
		super();
		// TODO 自动生成的构造函数存根
	}
	public OrderInformation(String ordernumber, String date, String uid, String muid, String deliveryfee,
			String consigneename, String consigneephonenumber, String consigneesaddress, String productname,
			String producttypes, String productprice, String expectnumberofproducts, String status) {
		super();
		this.ordernumber = ordernumber;
		this.date = date;
		this.uid = uid;
		this.muid = muid;
		this.deliveryfee = deliveryfee;
		this.consigneename = consigneename;
		this.consigneephonenumber = consigneephonenumber;
		this.consigneesaddress = consigneesaddress;
		this.productname = productname;
		this.producttypes = producttypes;
		this.productprice = productprice;
		this.expectnumberofproducts = expectnumberofproducts;
		this.status = status;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getMuid() {
		return muid;
	}
	public void setMuid(String muid) {
		this.muid = muid;
	}
	public String getDeliveryfee() {
		return deliveryfee;
	}
	public void setDeliveryfee(String deliveryfee) {
		this.deliveryfee = deliveryfee;
	}
	public String getConsigneename() {
		return consigneename;
	}
	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}
	public String getConsigneephonenumber() {
		return consigneephonenumber;
	}
	public void setConsigneephonenumber(String consigneephonenumber) {
		this.consigneephonenumber = consigneephonenumber;
	}
	public String getConsigneesaddress() {
		return consigneesaddress;
	}
	public void setConsigneesaddress(String consigneesaddress) {
		this.consigneesaddress = consigneesaddress;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProducttypes() {
		return producttypes;
	}
	public void setProducttypes(String producttypes) {
		this.producttypes = producttypes;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
	public String getExpectnumberofproducts() {
		return expectnumberofproducts;
	}
	public void setExpectnumberofproducts(String expectnumberofproducts) {
		this.expectnumberofproducts = expectnumberofproducts;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
