package webMybatis.orderinformation;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderInformationDao {
	//<!-- 通过bean插入一个订单信息 -->
	public int insertByBean(OrderInformation orderInformation);
	//<!-- 查询该uid所有订单信息 -->
	public ArrayList<OrderInformation> selectAllOrderforUIDInformation(String uid);
	//<!-- 查询该muid所有订单信息 -->
	public ArrayList<OrderInformation> selectAllOrderforMUIDInformation(String muid);
	//<!--更新订单的状态信息 -->
	public int updateOrderStatusByordernumber(Map<String, String> map);
	//<!-- 根据订单号查询订单信息 -->
	public OrderInformation selectOrderInformationByOnum(String onum);
}
