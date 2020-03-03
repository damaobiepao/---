package webMybatis.productinformation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "productInformationService")
public class ProductInformationService {
	@Autowired
	public ProductInformationDao productInformationDao;
	//根据部分属性判断是否已经存在
	public boolean isexist(ProductInformation productInformation) {
		if(productInformationDao.selectProductInformationByBean(productInformation)!=null) {
			return true;
		}
		return false;
	}
	//根据部分属性查询商品信息
	public ProductInformation getbypartialinformation(ProductInformation productInformation) {
		return productInformationDao.selectProductInformationByBean(productInformation);
	}
	//插入一个商品信息
	public boolean insertProductInformation(ProductInformation productInformation) {
		if(productInformationDao.insertProductInformationByBean(productInformation)==1) {
			return true;
		}
		return false;
	}
	//<!-- 根据一个Muid查询所有存在的商品信息 -->
	public ArrayList<ProductInformation> selectAllProductInformationByMuid(String muid){
		return productInformationDao.selectAllProductInformationByMuid(muid);
	}
	//<!-- 根据部分属性删除一个商品信息 -->
	public boolean deleteProductInformationBypartialinformation(ProductInformation productInformation) {
		if(productInformationDao.deleteProductInformationBypartialinformation(productInformation)==1)
			return true;
		return false;
	}
	//<!-- 根据部分属性定位一个商品信息，然后更新 -->
	public boolean updateProductInformationByBean(ProductInformation productInformation) {
		if(productInformationDao.updateProductInformationByBean(productInformation)==1)
			return true;
		return false;	
	}
}
