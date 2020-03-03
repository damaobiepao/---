package webMybatis.merchant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("merchantUserController")
public class MerchantUserController {
	@Autowired
	MerchantuserUserDao merchantuserUserDao;
	//根据手机+密码查询商家用户
	public MerchantUser selectMerchantUser(MerchantUser merchantUser) {
		MerchantUser merchantUser2= merchantuserUserDao.selectMerchantUser(merchantUser);
		if(merchantUser2!=null) {
			return merchantUser2;
		}
		return null;
	}
	//<!-- 根据手机号查询商家用户 -->
	public boolean selectMerchantUserByPhone(String phone) {
		if(merchantuserUserDao.selectMerchantUserByPhone(phone)!=null)
			return true;
		return false;
	}
	//<!-- 根据手机号验证是否该手机号是否已经提交过申请 -->
	public boolean selectMerchantUserRegistrationRequestByPhone(String phoneNumber) {
		if(merchantuserUserDao.selectMerchantUserRegistrationRequestByPhone(phoneNumber)!=null)
			return true;
		return false;
	}
	//<!-- 根据名字，手机号，地址 提交商家用户注册申请 -->
	public boolean insertMerchantUserRegistrationRequestByBean(MerchantUserRegistrationRequest merchantUserRegistrationRequest) {
		if(merchantuserUserDao.insertMerchantUserRegistrationRequestByBean(merchantUserRegistrationRequest)==1)
			return true;
		return false;
	}
	//<!-- 查询全部提交的请求 -->
	public List<MerchantUserRegistrationRequest> selectAllMerchantUserRegistrationRequest(){
		return merchantuserUserDao.selectAllMerchantUserRegistrationRequest();
	}
	//<!-- 根据手机号删除 提交的请求 -->
	public boolean deleteMerchantUserRegistrationRequestByPhone(String phoneNumber) {
		if(merchantuserUserDao.deleteMerchantUserRegistrationRequestByPhone(phoneNumber)==1)
			return true;
		return false;
	}
}
