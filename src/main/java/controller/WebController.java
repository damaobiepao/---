package controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.PictureFilenameFilter;
import webMybatis.User;
import webMybatis.merchant.MerchantUser;
import webMybatis.merchant.MerchantUserController;
import webMybatis.orderinformation.OrderInformation;
import webMybatis.orderinformation.OrderInformationService;
import webMybatis.productinformation.ProductInformation;
import webMybatis.productinformation.ProductInformationService;
import webMybatis.storeinformation.StoreInformationController;

@Controller
public class WebController {
	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	ProductInformationService productInformationService=(ProductInformationService) applicationContext.getBean("productInformationService");
	MerchantUserController merchantUserController=(MerchantUserController) applicationContext.getBean("merchantUserController");
	StoreInformationController storeInformationController=(StoreInformationController) applicationContext.getBean("storeInformationController");
	OrderInformationService orderInformationService=(OrderInformationService) applicationContext.getBean("orderInformationService");
	//������ҳ�Ŀ���
	@RequestMapping(value = {"**/tohello","**/WEB-INF/**","**/WEB-INF/*"})
	public void fourzerofourtohello(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws ServletException, IOException{	
		RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("/hello.jsp");
		requestDispatcher.forward( httpServletRequest,httpServletResponse);
	}
	//���ʹ���Ա��¼����
	@RequestMapping(value = "/toenteradministratorpage")
	public String toenteradministratorpage(HttpSession httpSession) throws ServletException, IOException {
		if(httpSession.getAttribute("administrator")!=null)
			return "forward:/toadministratorpage";
		return "enteradministratorpage";
	}
	//���ʹ���Ա������
	@RequestMapping(value = "/toadministratorpage")
	public String toadministratorpage(HttpSession httpSession,HttpServletRequest httpServletRequest,Model model) throws ServletException, IOException {
		if(httpSession.getAttribute("administrator")==null)
			return "forward:/toenteradministratorpage" ;
		
		model.addAttribute("merchantUserRegistrationRequest",merchantUserController.selectAllMerchantUserRegistrationRequest());
		if(httpServletRequest.getAttribute("administratorStartPage")==null) {
			model.addAttribute("administratorStartPage",1);
		}else {
			System.out.println(httpServletRequest.getAttribute("administratorStartPage"));
			String tempString= httpServletRequest.getAttribute("administratorStartPage").toString();
			System.out.println(tempString);
			int administratorStartPage=Integer.parseInt(tempString.trim());
			httpServletRequest.removeAttribute("administratorStartPage");
			model.addAttribute("administratorStartPage",administratorStartPage);
		}
		return "administratorpage";
	}
	//�˳�����Ա������
	@RequestMapping(value = "/exitadministratorpage")
	public String exitadministratorpage(HttpSession httpSession) throws ServletException, IOException {
		httpSession.removeAttribute("administrator");
		return "forward:/tohello";
	}
	//���ʸ�����ҳ
	@RequestMapping(value = {"**/touserhtml/{n}","**/touserhtml"})
	public String touserhtml(@PathVariable(value = "n",required = false)String n,HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Model model) throws ServletException, IOException {
		HttpSession httpSession=httpServletRequest.getSession();
		//�̵��Ӧ�ļӹ���Ʒ
		LinkedHashMap<String, LinkedList<String>> shoppingcartMap=(LinkedHashMap<String, LinkedList<String>>) httpSession.getAttribute("shoppingcartMap");
		User user=(User) httpSession.getAttribute("user");
		if(user!=null) {
			//�̵��Ӧ�ļӹ���Ʒ
			model.addAttribute("shoppingcartMap", shoppingcartMap);
			//
			if (n==null||Integer.parseInt(n)>shoppingcartMap.size()) {
				model.addAttribute("n", 1);
			}else{
				model.addAttribute("n", n);
			}
			model.addAttribute("orderInformation", orderInformationService.orderInformationDao.selectAllOrderforUIDInformation(user.getPhone()));
			
			return "user";
		}else {
			return "forward:/tohello";
		}
	}
	//�����̼ҵ�¼��ҳ
	@RequestMapping(value = "**/tomerchant")
	public String tomerchant(HttpServletRequest httpServletRequest){
		if(httpServletRequest.getSession().getAttribute("merchantuser")!=null) {
			return "forward:/updatesessionproductinformation";
		}
		return "merchant";
		
	}
	//�����̼���ҳ
	@RequestMapping(value = "**/tomerchantHomepage")
	public String tomerchanthtml(HttpServletRequest httpServletRequest){
		if(httpServletRequest.getSession().getAttribute("merchantuser")!=null) {
			return "forward:/updatesessionproductinformation";
		}
		else {
			return "forward:/tomerchant";
		}
	}
	//�˳��̼���ҳ����
	@RequestMapping(path = "**/outmerchantHomepage")
	public String outmerchantHomepage(HttpServletRequest httpServletRequest,HttpSession httpSession){

		
		if(httpSession.getAttribute("merchantuser")!=null) {
			httpSession.removeAttribute("merchantuser");
			httpSession.removeAttribute("storeinformation");
			httpSession.removeAttribute("productInformation");
			return "forward:/tomerchant";
		}
		return "forward:/tomerchant";
		
	}
	//�̼ҽ�����Ʒ�޸Ľ���+Ȩ�޿���
	@RequestMapping(path = "**/updateprocutinformation/{muid}/{producttypes}/{productname}/**")
	public String updateprocutinformation(@PathVariable(value = "muid" )String muid,@PathVariable(value = "producttypes" )String producttypes,@PathVariable(value = "productname" )String productname,HttpServletRequest httpServletRequest,HttpSession httpSession,Model model) {
	    System.out.println("������Ʒ�޸Ľ���-Ȩ�޿���");
		MerchantUser merchantUser = (MerchantUser) httpSession.getAttribute("merchantuser");
		if(merchantUser==null)
			return "forward:/tomerchantHomepage";
		ProductInformation productInformation=productInformationService.getbypartialinformation(new ProductInformation(muid, productname, producttypes));
		if(productInformation==null)
			return "forward:/tomerchantHomepage";
		
		if(muid.equals(merchantUser.getPhone())) {
			File file=new File("D:\\����\\fileUpload\\productpicture");			
			String fileName=muid+"_"+producttypes+"_"+productname+"_";
			
			String[] pictureName = new String[3];
			int i=0;
			for (String string : file.list(new PictureFilenameFilter(fileName))) {
				pictureName[i]=string;
				i++;
			}
			productInformation.setMuid(muid);
			model.addAttribute("productinformation",productInformation);
			model.addAttribute("pictureName", pictureName);
			return "updateProcutInformation";
		}else {
			return "forward:/tomerchantHomepage";
		}
	}
	//�������ҳ��
	@RequestMapping(value = "/tostorepage/{phone}")
	public String tostorepage(@PathVariable(value = "phone",required = true) String phone,Model model,HttpSession httpSession) {
		if(httpSession.getAttribute("user")==null)
			return "forward:/tohello";
		if(storeInformationController.selectStoreInformationByPhone(phone)==null)
			return "forward:/tohello";
		model.addAttribute("storeInformation", storeInformationController.storeInformationDao.selectStoreInformationByPhone(phone));
		model.addAttribute("productInformation", productInformationService.productInformationDao.selectAllProductInformationByMuid(phone));
		return "storepage";
	}
	//�����Ʒ����ҳ����
	@RequestMapping(value = "**/toprocutinformationpage/{muid}/{producttypes}/{productname}/**")
	public String toprocutinformationpage (@PathVariable(value = "muid" )String muid,@PathVariable(value = "producttypes" )String producttypes,@PathVariable(value = "productname" )String productname,HttpServletRequest httpServletRequest,HttpSession httpSession,Model model) {
			System.out.println("�����Ʒ����ҳ�������");
			//���δ��¼��������ҳ
			if(httpSession.getAttribute("user")==null)
				return "forward:/tohello";
			//�����ڲ�Ʒ��Ϣ�����ص���ҳ
			ProductInformation productInformation=productInformationService.getbypartialinformation(new ProductInformation(muid, productname, producttypes));
			if(productInformation==null)
				return "forward:/tostorepage/"+muid;
			
			File file=new File("D:\\����\\fileUpload\\productpicture");			
			String fileName=muid+"_"+producttypes+"_"+productname+"_";
			
			String[] pictureName = new String[3];
			int i=0;
			for (String string : file.list(new PictureFilenameFilter(fileName))) {
				pictureName[i]=string;
				i++;
			}
			model.addAttribute("productinformation",productInformation);
			model.addAttribute("pictureName", pictureName);
			return "procutinformationpage";
	}
	//�������
	@RequestMapping(value = "**/topurchaseinterface")
	public String topurchaseinterface (HttpServletRequest httpServletRequest,HttpSession httpSession,Model model) {
		//���δ��¼��������ҳ
		if(httpSession.getAttribute("user")==null)
			return "forward:/tohello";
		
		String muid = (String) httpSession.getAttribute("@muid");
		String[] name = (String[]) httpSession.getAttribute("@name");
		String[] type = (String[]) httpSession.getAttribute("@type");
		String[] price = (String[]) httpSession.getAttribute("@price");
		String[] enumber = (String[]) httpSession.getAttribute("@enumber");
		model.addAttribute("storeInformation",storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid));
		model.addAttribute("muid", muid);
		model.addAttribute("name", name);
		model.addAttribute("type", type);
		model.addAttribute("price", price);
		model.addAttribute("enumber", enumber);
		return "purchaseinterface";
	}
	//���붩����Ϣ
	@RequestMapping(value = "/toorder/{ordernumber}/{who}")
	public String toorder(@PathVariable(value = "ordernumber",required = false)String ordernumber,@PathVariable(value = "who",required = false)String who,HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession,Model model) {
		System.out.println("���붩����Ϣ����");
		//�û�
		if (who.equals("0")) {
			User user=(User) httpSession.getAttribute("user");
			//���δ��¼��������ҳ
			if(user!=null) {
				if (ordernumber==null) 
					return "forward:/touserhtml";
				OrderInformation orderInformation=orderInformationService.orderInformationDao.selectOrderInformationByOnum(ordernumber);
				//�ö����ţ������ڸ��û�
				if (!user.phone.equals(orderInformation.getUid())) 
					return "forward:/touserhtml";
				model.addAttribute("orderInformation",orderInformation);
				model.addAttribute("storeInformation", storeInformationController.storeInformationDao.selectStoreInformationByPhone(orderInformation.getMuid()));
				return "order";
			}
		}
		//�̼�
		if (who.equals("1")) {
			MerchantUser merchantUser=(MerchantUser) httpSession.getAttribute("merchantuser");
			if(merchantUser!=null) {
				if (ordernumber==null) 
					return "forward:/tomerchant";
				OrderInformation orderInformation=orderInformationService.orderInformationDao.selectOrderInformationByOnum(ordernumber);
				if(!merchantUser.phone.equals(orderInformation.getMuid()))
					return "forward:/tomerchantHomepage";
				model.addAttribute("orderInformation",orderInformation);
				model.addAttribute("storeInformation", storeInformationController.storeInformationDao.selectStoreInformationByPhone(orderInformation.getMuid()));
				return "order";
			}
		}
			return "forward:/tohello";
		
		
			

		
	}
}
