package webMybatis.orderinformation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "orderInformationService")
public class OrderInformationService {
	@Autowired
	public OrderInformationDao orderInformationDao;

}
