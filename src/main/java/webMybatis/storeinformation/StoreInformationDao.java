package webMybatis.storeinformation;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreInformationDao {
	//根据手机号查询店铺信息
	public StoreInformation selectStoreInformationByPhone(String phone);
	//<!-- 根据手机号更新店铺信息 -->
	public int updateStoreInformationByPhone(Map map);
	//<!--  根据关键字--在店铺名字或类型或产品类型中查找符合的店铺信息 -->
	public ArrayList<StoreInformation> selectStoreInformationByKeywords(String keywords);
	//<!-- 查出所有店铺 -->
	public ArrayList<StoreInformation> selectallStoreInformation();
}
