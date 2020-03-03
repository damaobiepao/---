package webMybatis.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "administratorService")
public class AdministratorService {
	@Autowired
	AdministratorDao administratorDao;
	//根据一个bean判断该管理员是否存在
	public boolean  selectAdministrator(Administrator administrator) {
		if(administratorDao.selectAdministrator(administrator)!=null) {
			return true;
		}
		return false;
	}
}
