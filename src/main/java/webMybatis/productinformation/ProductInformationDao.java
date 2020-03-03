package webMybatis.productinformation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductInformationDao {
	//���ݲ������Բ�ѯ��Ʒ��Ϣ
	public ProductInformation selectProductInformationByBean(ProductInformation productInformation);
	public int insertProductInformationByBean(ProductInformation productInformation);
	public ArrayList<ProductInformation> selectAllProductInformationByMuid(String muid);
	public int deleteProductInformationBypartialinformation(ProductInformation productInformation);
	public int updateProductInformationByBean(ProductInformation productInformation);
	//<!--  ���ݹؼ����ڲ�Ʒ���ֻ����ͻ��Ʒ�����в��ҷ��ϵĲ�Ʒ��Ϣ -->
	public ArrayList<ProductInformation> selectProductInformationByKeywords(String keywords);
	//	<!-- ���ݲ������Զ�λһ����Ʒ��Ϣ��Ȼ��������� -->
	public int updateProductInformationNumberByBean(ProductInformation productInformation);
}
