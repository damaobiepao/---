package webMybatis.orderinformation;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderInformationDao {
	//<!-- ͨ��bean����һ��������Ϣ -->
	public int insertByBean(OrderInformation orderInformation);
	//<!-- ��ѯ��uid���ж�����Ϣ -->
	public ArrayList<OrderInformation> selectAllOrderforUIDInformation(String uid);
	//<!-- ��ѯ��muid���ж�����Ϣ -->
	public ArrayList<OrderInformation> selectAllOrderforMUIDInformation(String muid);
	//<!--���¶�����״̬��Ϣ -->
	public int updateOrderStatusByordernumber(Map<String, String> map);
	//<!-- ���ݶ����Ų�ѯ������Ϣ -->
	public OrderInformation selectOrderInformationByOnum(String onum);
}
