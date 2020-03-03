package webMybatis.administrator;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdministratorDao {
	public Administrator selectAdministrator(Administrator administrator);
}
