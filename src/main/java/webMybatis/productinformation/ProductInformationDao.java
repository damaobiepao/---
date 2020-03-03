package webMybatis.productinformation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductInformationDao {
	//根据部分属性查询商品信息
	public ProductInformation selectProductInformationByBean(ProductInformation productInformation);
	public int insertProductInformationByBean(ProductInformation productInformation);
	public ArrayList<ProductInformation> selectAllProductInformationByMuid(String muid);
	public int deleteProductInformationBypartialinformation(ProductInformation productInformation);
	public int updateProductInformationByBean(ProductInformation productInformation);
	//<!--  根据关键字在产品名字或类型或产品描述中查找符合的产品信息 -->
	public ArrayList<ProductInformation> selectProductInformationByKeywords(String keywords);
	//	<!-- 根据部分属性定位一个商品信息，然后更新数量 -->
	public int updateProductInformationNumberByBean(ProductInformation productInformation);
}
