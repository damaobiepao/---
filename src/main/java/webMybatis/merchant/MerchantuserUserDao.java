package webMybatis.merchant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MerchantuserUserDao {
	//�����ֻ��ź������ѯ�̼��û�
	public MerchantUser selectMerchantUser(MerchantUser merchantUser);
	//<!-- �����ֻ��Ų�ѯ�̼��û� -->
	public MerchantUser selectMerchantUserByPhone(String phone);
	//<!-- �����ֻ�����֤�Ƿ���ֻ����Ƿ��Ѿ��ύ������ -->
	public MerchantUserRegistrationRequest selectMerchantUserRegistrationRequestByPhone(String phoneNumber);
	//<!-- �������֣��ֻ��ţ���ַ �ύ�̼��û�ע������ -->
	public int insertMerchantUserRegistrationRequestByBean(MerchantUserRegistrationRequest merchantUserRegistrationRequest);
	//<!-- ��ѯȫ���ύ������ -->
	public List<MerchantUserRegistrationRequest> selectAllMerchantUserRegistrationRequest();
	//<!-- �����ֻ���ɾ�� �ύ������ -->
	public int deleteMerchantUserRegistrationRequestByPhone(String phoneNumber);
}
