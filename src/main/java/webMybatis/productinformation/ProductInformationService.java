package webMybatis.productinformation;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "productInformationService")
public class ProductInformationService {
	@Autowired
	public ProductInformationDao productInformationDao;
	//���ݲ��������ж��Ƿ��Ѿ�����
	public boolean isexist(ProductInformation productInformation) {
		if(productInformationDao.selectProductInformationByBean(productInformation)!=null) {
			return true;
		}
		return false;
	}
	//���ݲ������Բ�ѯ��Ʒ��Ϣ
	public ProductInformation getbypartialinformation(ProductInformation productInformation) {
		return productInformationDao.selectProductInformationByBean(productInformation);
	}
	//����һ����Ʒ��Ϣ
	public boolean insertProductInformation(ProductInformation productInformation) {
		if(productInformationDao.insertProductInformationByBean(productInformation)==1) {
			return true;
		}
		return false;
	}
	//<!-- ����һ��Muid��ѯ���д��ڵ���Ʒ��Ϣ -->
	public ArrayList<ProductInformation> selectAllProductInformationByMuid(String muid){
		return productInformationDao.selectAllProductInformationByMuid(muid);
	}
	//<!-- ���ݲ�������ɾ��һ����Ʒ��Ϣ -->
	public boolean deleteProductInformationBypartialinformation(ProductInformation productInformation) {
		if(productInformationDao.deleteProductInformationBypartialinformation(productInformation)==1)
			return true;
		return false;
	}
	//<!-- ���ݲ������Զ�λһ����Ʒ��Ϣ��Ȼ����� -->
	public boolean updateProductInformationByBean(ProductInformation productInformation) {
		if(productInformationDao.updateProductInformationByBean(productInformation)==1)
			return true;
		return false;	
	}
}
