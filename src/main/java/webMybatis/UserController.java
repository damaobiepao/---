package webMybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("userController")
public class UserController {
	@Autowired
	UserDao userDao;
	//注册校验用户名是否存在
	public boolean usernameisuse(String username) {
		if(userDao.selectUserByName(username)!=null) {			
			return true;
		}else {
			return false;
		}
	}
	//注册校验手机号码是否存在
	public boolean userphoneisuse(String phone) {
		if(userDao.selectUserByPhone(phone)!=null) {	
			return true;
		}else {
			return false;
		}
	}
	//插入用户
	public boolean adduser(User user) {
		if(userDao.addUser(user)==1) {
			return true;
		}else {
			return false;
		}	
	}
	//登录
	public User logincheck(User exuser) {
		User user=userDao.login(exuser);
		if(user!=null) {
			return user;
		}else {
			return null;
		}	
	}
}
