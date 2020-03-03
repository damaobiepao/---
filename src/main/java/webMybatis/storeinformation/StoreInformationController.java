package webMybatis.storeinformation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("storeInformationController")
public class StoreInformationController {
	@Autowired
	public StoreInformationDao storeInformationDao;
	//�����ֻ��Ų�ѯ������Ϣ
	public StoreInformation selectStoreInformationByPhone(String phone) {
		StoreInformation storeInformation= storeInformationDao.selectStoreInformationByPhone(phone);
		if (storeInformation!=null) {
			return storeInformation;
		} else {
			return null;
		}
	}	
}
