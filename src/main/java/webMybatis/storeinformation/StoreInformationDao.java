package webMybatis.storeinformation;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreInformationDao {
	//�����ֻ��Ų�ѯ������Ϣ
	public StoreInformation selectStoreInformationByPhone(String phone);
	//<!-- �����ֻ��Ÿ��µ�����Ϣ -->
	public int updateStoreInformationByPhone(Map map);
	//<!--  ���ݹؼ���--�ڵ������ֻ����ͻ��Ʒ�����в��ҷ��ϵĵ�����Ϣ -->
	public ArrayList<StoreInformation> selectStoreInformationByKeywords(String keywords);
	//<!-- ������е��� -->
	public ArrayList<StoreInformation> selectallStoreInformation();
}
