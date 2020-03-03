package webMybatis.merchant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MerchantuserUserDao {
	//根据手机号和密码查询商家用户
	public MerchantUser selectMerchantUser(MerchantUser merchantUser);
	//<!-- 根据手机号查询商家用户 -->
	public MerchantUser selectMerchantUserByPhone(String phone);
	//<!-- 根据手机号验证是否该手机号是否已经提交过申请 -->
	public MerchantUserRegistrationRequest selectMerchantUserRegistrationRequestByPhone(String phoneNumber);
	//<!-- 根据名字，手机号，地址 提交商家用户注册申请 -->
	public int insertMerchantUserRegistrationRequestByBean(MerchantUserRegistrationRequest merchantUserRegistrationRequest);
	//<!-- 查询全部提交的请求 -->
	public List<MerchantUserRegistrationRequest> selectAllMerchantUserRegistrationRequest();
	//<!-- 根据手机号删除 提交的请求 -->
	public int deleteMerchantUserRegistrationRequestByPhone(String phoneNumber);
}
