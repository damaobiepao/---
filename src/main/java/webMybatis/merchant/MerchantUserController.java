package webMybatis.merchant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("merchantUserController")
public class MerchantUserController {
	@Autowired
	MerchantuserUserDao merchantuserUserDao;
	//�����ֻ�+�����ѯ�̼��û�
	public MerchantUser selectMerchantUser(MerchantUser merchantUser) {
		MerchantUser merchantUser2= merchantuserUserDao.selectMerchantUser(merchantUser);
		if(merchantUser2!=null) {
			return merchantUser2;
		}
		return null;
	}
	//<!-- �����ֻ��Ų�ѯ�̼��û� -->
	public boolean selectMerchantUserByPhone(String phone) {
		if(merchantuserUserDao.selectMerchantUserByPhone(phone)!=null)
			return true;
		return false;
	}
	//<!-- �����ֻ�����֤�Ƿ���ֻ����Ƿ��Ѿ��ύ������ -->
	public boolean selectMerchantUserRegistrationRequestByPhone(String phoneNumber) {
		if(merchantuserUserDao.selectMerchantUserRegistrationRequestByPhone(phoneNumber)!=null)
			return true;
		return false;
	}
	//<!-- �������֣��ֻ��ţ���ַ �ύ�̼��û�ע������ -->
	public boolean insertMerchantUserRegistrationRequestByBean(MerchantUserRegistrationRequest merchantUserRegistrationRequest) {
		if(merchantuserUserDao.insertMerchantUserRegistrationRequestByBean(merchantUserRegistrationRequest)==1)
			return true;
		return false;
	}
	//<!-- ��ѯȫ���ύ������ -->
	public List<MerchantUserRegistrationRequest> selectAllMerchantUserRegistrationRequest(){
		return merchantuserUserDao.selectAllMerchantUserRegistrationRequest();
	}
	//<!-- �����ֻ���ɾ�� �ύ������ -->
	public boolean deleteMerchantUserRegistrationRequestByPhone(String phoneNumber) {
		if(merchantuserUserDao.deleteMerchantUserRegistrationRequestByPhone(phoneNumber)==1)
			return true;
		return false;
	}
}
