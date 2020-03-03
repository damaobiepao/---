package webMybatis;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	// 查询用户Byname
	public User selectUserByName(String name);
	//询用户Byphone
	public User selectUserByPhone(String phone);
	//插入用户
	public int addUser(User user);
	//登录查询
	public User login(User user);
}
