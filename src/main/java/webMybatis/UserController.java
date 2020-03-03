package webMybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("userController")
public class UserController {
	@Autowired
	UserDao userDao;
	//ע��У���û����Ƿ����
	public boolean usernameisuse(String username) {
		if(userDao.selectUserByName(username)!=null) {			
			return true;
		}else {
			return false;
		}
	}
	//ע��У���ֻ������Ƿ����
	public boolean userphoneisuse(String phone) {
		if(userDao.selectUserByPhone(phone)!=null) {	
			return true;
		}else {
			return false;
		}
	}
	//�����û�
	public boolean adduser(User user) {
		if(userDao.addUser(user)==1) {
			return true;
		}else {
			return false;
		}	
	}
	//��¼
	public User logincheck(User exuser) {
		User user=userDao.login(exuser);
		if(user!=null) {
			return user;
		}else {
			return null;
		}	
	}
}
