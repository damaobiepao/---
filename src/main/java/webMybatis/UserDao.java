package webMybatis;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	// ��ѯ�û�Byname
	public User selectUserByName(String name);
	//ѯ�û�Byphone
	public User selectUserByPhone(String phone);
	//�����û�
	public int addUser(User user);
	//��¼��ѯ
	public User login(User user);
}
