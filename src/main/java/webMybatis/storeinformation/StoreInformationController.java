package webMybatis.storeinformation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("storeInformationController")
public class StoreInformationController {
	@Autowired
	public StoreInformationDao storeInformationDao;
	//根据手机号查询店铺信息
	public StoreInformation selectStoreInformationByPhone(String phone) {
		StoreInformation storeInformation= storeInformationDao.selectStoreInformationByPhone(phone);
		if (storeInformation!=null) {
			return storeInformation;
		} else {
			return null;
		}
	}	
}
