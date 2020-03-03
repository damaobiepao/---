package webMybatis.productinformation;

public class ProductInformation {
	public String muid;
	public String productname;
	public String producttypes;
	public double productprice;
	public int numberofproducts;
	public String productdescription;
	
	public ProductInformation() {}
	public ProductInformation(String muid,String productname,String producttypes) {
		this.muid=muid;
		this.producttypes=producttypes;
		this.productname=productname;
	}
	public String getMuid() {
		return muid;
	}
	public void setMuid(String muid) {
		this.muid = muid;
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
	public double getProductprice() {
		return productprice;
	}
	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}
	public int getNumberofproducts() {
		return numberofproducts;
	}
	public void setNumberofproducts(int numberofproducts) {
		this.numberofproducts = numberofproducts;
	}
	public String getProductdescription() {
		return productdescription;
	}
	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}
}
