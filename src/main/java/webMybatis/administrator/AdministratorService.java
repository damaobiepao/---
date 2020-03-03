package webMybatis.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "administratorService")
public class AdministratorService {
	@Autowired
	AdministratorDao administratorDao;
	//����һ��bean�жϸù���Ա�Ƿ����
	public boolean  selectAdministrator(Administrator administrator) {
		if(administratorDao.selectAdministrator(administrator)!=null) {
			return true;
		}
		return false;
	}
}
