package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.MyMessageDigest;
import bean.PictureFilenameFilter;
import webMybatis.User;
import webMybatis.UserController;
import webMybatis.administrator.Administrator;
import webMybatis.administrator.AdministratorService;
import webMybatis.merchant.MerchantUser;
import webMybatis.merchant.MerchantUserController;
import webMybatis.merchant.MerchantUserRegistrationRequest;
import webMybatis.orderinformation.OrderInformation;
import webMybatis.orderinformation.OrderInformationService;
import webMybatis.productinformation.ProductInformation;
import webMybatis.productinformation.ProductInformationService;
import webMybatis.storeinformation.StoreInformation;
import webMybatis.storeinformation.StoreInformationController;
import webMybatis.storeinformation.StoreInformationDao;

@Controller
public class DataController {
	//实现spring application.xml配置文件
	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	UserController userController= (UserController) applicationContext.getBean("userController");
	MerchantUserController merchantUserController = (MerchantUserController) applicationContext.getBean("merchantUserController") ;
	StoreInformationController storeInformationController=(StoreInformationController)applicationContext.getBean("storeInformationController");
	ProductInformationService productInformationService=(ProductInformationService) applicationContext.getBean("productInformationService");
	AdministratorService administratorService=(webMybatis.administrator.AdministratorService) applicationContext.getBean("administratorService");
	OrderInformationService orderInformationService=(OrderInformationService) applicationContext.getBean("orderInformationService");
	//管理员登陆检验
	@RequestMapping(value = "checkadministratorlogininformation")
	@ResponseBody
	public void checkadministratorlogininformation(Administrator administrator,HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession) throws NoSuchAlgorithmException, IOException {
		
		System.out.println("进入管理员登陆检验");
		//解决乱码问题
		httpServletRequest.setCharacterEncoding("UTF-8");
		httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
		//是否启用缓存
		httpServletResponse.setHeader("Cache-Control", "no-cache");
		httpServletResponse.setCharacterEncoding("UTF-8");
		//获取回复对象的实例
		PrintWriter out=httpServletResponse.getWriter();
		System.out.println(MyMessageDigest.getMD5(administrator.getAdminpass()));
		administrator.setAdminpass(MyMessageDigest.getMD5(administrator.getAdminpass()));
		
		ServletContext servletContext =httpServletRequest.getServletContext();
		
		if(servletContext.getAttribute("administrator_"+administrator.getAdminname())!=null) {
			out.print("当前用户名已经登录，你无法登录");
			out.flush();
			return;
		}
		if(administratorService.selectAdministrator(administrator)) {
			httpSession.setAttribute("administrator",administrator);
			servletContext.setAttribute("administrator_"+administrator.getAdminname(),administrator);
			out.print("成功");
			out.flush();
		}else {
			out.print("用户名或密码错误！！！");
			out.flush();
		}
	}
	//用户注册的昵称校验
	@RequestMapping(value = "signinusername")
	@ResponseBody
	public void signinusername(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
		System.out.println("进入昵称校验");
		
		//解决乱码问题
		httpServletRequest.setCharacterEncoding("UTF-8");
		httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
			//是否启用缓存
		httpServletResponse.setHeader("Cache-Control", "no-cache");
		httpServletResponse.setCharacterEncoding("UTF-8");
		//获取回复对象的实例
		PrintWriter out=httpServletResponse.getWriter();
		//获取输入的名字
		String name=httpServletRequest.getParameter("name");
		if(name.length()==0||name.length()>7) {
			out.print("<p class=\"text-danger\">昵称长度1-7个字符</p>");
			out.flush();	
		}else {
			boolean usernameisuse=userController.usernameisuse("'"+name+"'");
			if(usernameisuse) {
				out.print("<p class=\"text-danger\">昵称已经被使用</p>");
				out.flush();	
			}else {
				out.print("<p class=\"text-success\">昵称可使用</p>");
				out.flush();
				
			}
			
		}	
	}
	//用户注册的手机校验
	@RequestMapping(value = "signinuserphone")
	@ResponseBody
	public void signinuserphone(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
		System.out.println("进入手机号码校验");
		//解决乱码问题
		httpServletRequest.setCharacterEncoding("UTF-8");
		httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
			//是否启用缓存
		httpServletResponse.setHeader("Cache-Control", "no-cache");
		httpServletResponse.setCharacterEncoding("UTF-8");
		//获取回复对象的实例
		PrintWriter out=httpServletResponse.getWriter();
		//获取输入的电话号码
		String phone=httpServletRequest.getParameter("phone");
		if(phone.length()!=11) {
			out.print("<p class=\"text-danger\">手机号应为11位</p>");
			out.flush();	
		}else {
			boolean userphoneisuse=userController.userphoneisuse("'"+phone+"'");
			if( userphoneisuse) {
				out.print("<p class=\"text-danger\">手机号码已经被注册</p>");
				out.flush();	
			}else {
				out.print("<p class=\"text-success\">手机号可注册</p>");
				out.flush();
			}
		}
	}
	//用户注册的密码校验
	@RequestMapping(value = "signinuserpassword")
	@ResponseBody
	public void signinuserpassword(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
		System.out.println("进入注册的密码校验");
		//解决乱码问题
		httpServletRequest.setCharacterEncoding("UTF-8");
		httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
			//是否启用缓存
		httpServletResponse.setHeader("Cache-Control", "no-cache");
		httpServletResponse.setCharacterEncoding("UTF-8");
		//获取回复对象的实例
		PrintWriter out=httpServletResponse.getWriter();
		//获取输入的电话号码
		String password=httpServletRequest.getParameter("password");
		if(password.length()!=7) {
			out.print("<p class=\"text-danger\">密码只能为7位</p>");
			out.flush();	
		}else {
			out.print("<p class=\"text-success\">√</p>");
			out.flush();
		}
	}			
	//用户注册的密码二次校验
		@RequestMapping(value = "signinuserpasswordagain")
		@ResponseBody
		public void signinuserpasswordagain(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
			System.out.println("进入密码二次校验");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			//获取输入的电话号码
			String password=httpServletRequest.getParameter("password");
			String passwordagain=httpServletRequest.getParameter("passwordagain");
			if(!password.equals(passwordagain)) {
				out.print("<p class=\"text-danger\">两次密码不一致</p>");
				out.flush();	
			}else {
				out.print("<p class=\"text-success\">√</p>");
				out.flush();
			}
		}	
		//确认注册事件
		@RequestMapping(value = "signinconfirm")
		@ResponseBody
		public void signinconfirm(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
			System.out.println("进入正式确认注册");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			//获取注册信息
			String name="'"+httpServletRequest.getParameter("name")+"'";
			String phone="'"+httpServletRequest.getParameter("phone")+"'";
			String password="'"+httpServletRequest.getParameter("password")+"'";
			User user=new User(name, phone, password);
			boolean isok=userController.adduser(user);
			
			if(isok) {
				out.print("成功注册");
				out.flush();	
			}else {
				out.print("注册未成功，请稍后再试。");
				out.flush();
			}
		}
		//确认登录事件
		@RequestMapping(value = "loginconfirm")
		@ResponseBody
		public void loginconfirm(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
			System.out.println("进入确认登录");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			User exuser=new User("'"+httpServletRequest.getParameter("phone")+"'","'"+httpServletRequest.getParameter("password")+"'");
			User user=userController.logincheck(exuser);
			if(user!=null) {
				httpServletRequest.getSession().setAttribute("user", user);
				System.out.println("创建成功");
				out.print("登录成功");
				out.flush();
			}else {
				System.out.println("user为空");
				out.print("用户名或密码错误！！！");
				out.flush();
			}
		}
		//登出事件
		@RequestMapping(value = "logout")
		public String logout(HttpSession httpSession) throws IOException {
			if(httpSession.getAttribute("user")!=null) {
				httpSession.removeAttribute("user");
			}
			/*
			 * 交给了监听器处理
			*/
//			if(httpSession.getAttribute("shoppingcartMap")!=null)
//				httpSession.removeAttribute("shoppingcartMap");
			System.out.println("登出用户");
			return "forward:/tohello";
		}
		//用户搜索产品
		@RequestMapping(value = "searchproductinformation/{keywords}")
		public String searchproductinformation(@PathVariable(value = "keywords")String keywords,Model model,HttpSession httpSession) {
			if(httpSession.getAttribute("user")==null)
				return "forward:/tohello";
			ArrayList<StoreInformation> thestoreinformationfound = storeInformationController.storeInformationDao.selectStoreInformationByKeywords(keywords);
			ArrayList<ProductInformation> theproductinformationfound = productInformationService.productInformationDao.selectProductInformationByKeywords(keywords);
			model.addAttribute("thestoreinformationfound", thestoreinformationfound);
			model.addAttribute("theproductinformationfound", theproductinformationfound);
			return "displaypageofsearchedinformation";
		}
		//用户搜索@@进入查看全部店铺页面
		@RequestMapping(value = "/toallStorepage")
		public String toallStorepage(HttpSession httpSession,Model model) {
			if(httpSession.getAttribute("user")==null)
				return "forward:/tohello";
			ArrayList<StoreInformation> alltype = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type1 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type2 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type3 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type4 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type5 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type6 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type7 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> type8 = new ArrayList<StoreInformation>();
			ArrayList<StoreInformation> allstoreif = storeInformationController.storeInformationDao.selectallStoreInformation();
			for (StoreInformation tempStoreInformation : allstoreif) {
				alltype.add(tempStoreInformation);
				switch (tempStoreInformation.storetype) {
				case "快餐便当":
					type1.add(tempStoreInformation);
					break;
				case "特色菜系":
					type2.add(tempStoreInformation);
					break;
				case "全球美食":
					type3.add(tempStoreInformation);
					break;
				case "甜品饮品":
					type4.add(tempStoreInformation);
					break;
				case "商店超市":
					type5.add(tempStoreInformation);
					break;
				case "小吃夜宵":
					type6.add(tempStoreInformation);
					break;
				case "鲜花绿植":
					type7.add(tempStoreInformation);
					break;
				case "医药健康":
					type8.add(tempStoreInformation);
					break;
				default:
					break;
				}
			}
			model.addAttribute("alltype", alltype);
			model.addAttribute("type1", type1);
			model.addAttribute("type2", type2);
			model.addAttribute("type3", type3);
			model.addAttribute("type4", type4);
			model.addAttribute("type5", type5);
			model.addAttribute("type6", type6);
			model.addAttribute("type7", type7);
			model.addAttribute("type8", type8);
			return "allStorepage";
			
		}
		//用户加入购物车
		@RequestMapping(value = "/addtoshoppingcart")
		@ResponseBody
		public void addtoshoppingcart(HttpSession httpSession,HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest) throws IOException {
			System.out.println("进入用户加入购物车控制");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			
			//如果未登录
			if(httpSession.getAttribute("user")==null) {
				System.out.println("未登录");
				out.print("你未登录，请登录以后进行加购！！");
				out.flush();
				return;
			}
			String muid=httpServletRequest.getParameter("muid");
			String producttypes=httpServletRequest.getParameter("producttypes");
			String productname=httpServletRequest.getParameter("productname");
			String productprice=httpServletRequest.getParameter("productprice");
			System.out.println(muid+productname+producttypes);
			//不存在的商品
			
			ProductInformation productInformation=productInformationService.getbypartialinformation(new ProductInformation(muid, productname, producttypes));
			if(productInformation==null) {
				out.print("无法添加不存在的商品，请刷新商品页面！！！");
				out.flush();
				return;
			}
			if(productInformation.productprice!=Double.parseDouble(productprice)) {
				out.print("产品价格发生变化，请刷新商品页面，删除旧价格的商品！！！\n旧价格商品，将无法购买！！！");
				out.flush();
				return;
			}
			//商店对应的加购产品
			LinkedHashMap<String, LinkedList<String>> shoppingcartMap=(LinkedHashMap<String, LinkedList<String>>) httpSession.getAttribute("shoppingcartMap");
			if(shoppingcartMap==null) {
				//初始化
				System.out.println("空初始化Map");
				shoppingcartMap=new LinkedHashMap<String, LinkedList<String>>();
				//加入店铺名字+产品信息
				LinkedList<String> tempList=new LinkedList<String>();
					//更新店铺名字
				tempList.add(storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
				tempList.add(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_1"); 
				shoppingcartMap.put(muid, tempList);
				httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
				out.print("成功");
				out.flush();
				return;
			}else {
				System.out.println("Map不为空");
				LinkedList<String> tempList = shoppingcartMap.get(muid);
				//session中不存在该muid，对应的加购信息
				if(tempList==null) {
					System.out.println("tempList为空");
					//初始化muid对应的List
					tempList=new LinkedList<String>();
					//更新店铺名字
					tempList.add(storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
					tempList.add(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_1"); 
					shoppingcartMap.put(muid, tempList);
					httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
					out.print("成功");
					out.flush();
					System.out.println("不存在该muid，对应的加购信息");
					return;
				}else {
					System.out.println("tempList不为空");
					//存在店铺信息
							//如果是已经存在三个
						if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_3")) {
							System.out.println("有3个了1");
							tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
							shoppingcartMap.put(muid, tempList);
							httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
							out.print("单用户，单店铺，单产品最多购买数量为3");
							out.flush();
							System.out.println("有3个了2");
							return;
						}
						//如果是已经存在2个
					if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_2")) {
						System.out.println("有2个了1");
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						int index=tempList.indexOf(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_2");
						tempList.set(index,productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_3");
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("成功");
						out.flush();
						System.out.println("有2个了2");
						return;
					}
						//如果是已经存在1个
					if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_1")) {
						System.out.println("有1个了1");
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						int index=tempList.indexOf(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_1");
						tempList.set(index,productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_2");
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("成功");
						out.flush();
						System.out.println("有1个了2");
						return;
					}else {
						System.out.println("有1个了3");
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						tempList.add(productInformation.productname+"_"+productInformation.producttypes+"_"+productInformation.productprice+"_1"); 
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("成功");
						out.flush();
						System.out.println("有1个了4");
						return;
					}

				}
				
			}
			
		}
		//用户从购物车中删减
		@RequestMapping(value = "/removefromshoppingcart")
		@ResponseBody
		public void removefromshoppingcart(HttpSession httpSession,HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest) throws IOException {
			System.out.println("进入用户从购物车中删除控制");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			
			//如果未登录
			if(httpSession.getAttribute("user")==null) {
				System.out.println("未登录");
				out.print("你未登录，请登录以后进行操作！！");
				out.flush();
				return;
			}
			String muid=httpServletRequest.getParameter("muid");
			String producttypes=httpServletRequest.getParameter("producttypes");
			String productname=httpServletRequest.getParameter("productname");
			String productprice=httpServletRequest.getParameter("productprice");
			System.out.println(muid+productname+producttypes);
			//不存在的商品
			ProductInformation productInformation=productInformationService.getbypartialinformation(new ProductInformation(muid, productname, producttypes));
			if(productInformation==null) {
				out.print("无法删除不存在的商品，请重新登陆进行操作。");
				out.flush();
				return;
			}
			//商店对应的加购产品
			LinkedHashMap<String, LinkedList<String>> shoppingcartMap=(LinkedHashMap<String, LinkedList<String>>) httpSession.getAttribute("shoppingcartMap");
			if(shoppingcartMap==null) {
				out.print("不存在任何购物车信息，无法进行删除操作。\n建议重新登陆，进行操作。");
				out.flush();
				return;
			}else {
				System.out.println("Map不为空");
				LinkedList<String> tempList = shoppingcartMap.get(muid);
				//session中不存在该muid，对应的加购信息
				if(tempList==null) {
					System.out.println("tempList为空");
					out.print("不存在该店铺的任何商品加购信息，无法进行删除操作。\n建议重新登陆，进行操作。");
					out.flush();
					return;
				}else {
					System.out.println("tempList不为空");
					//存在店铺信息
							//如果是已经存在三个
						if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_3")) {
							tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
							int index=tempList.indexOf(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_3");
							tempList.set(index,productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_2");
							shoppingcartMap.put(muid, tempList);
							httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
							out.print("成功\n");
							out.flush();
							return;
						}
						//如果是已经存在2个
					if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_2")) {
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						int index=tempList.indexOf(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_2");
						tempList.set(index,productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_1");
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("成功\n");
						out.flush();
						return;
					}
						//如果是已经存在1个
					if(tempList.contains(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_1")) {
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						int index=tempList.indexOf(productInformation.productname+"_"+productInformation.producttypes+"_"+productprice+"_1");
						tempList.remove(index);
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("成功\n");
					}else {
						tempList.set(0,storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getName());
						shoppingcartMap.put(muid, tempList);
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						out.print("你在该店铺的购物车，没有加入这件产品，无法进行删除。\n建议重新登陆，进行操作。\n");
					}
					if(tempList.size()==1) {
						System.out.println(shoppingcartMap.remove(muid, tempList));
						httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
						System.out.println("清空该店铺购物车");
						out.print("系统提醒：未加入该店任何商品,即将清空该店铺购物车");
					}
					out.flush();
				}
			}
		}
		//用户点击购买预判（商品存在与否，是否刚被修改，）
		@RequestMapping("analysisofpurchaseevents")
		@ResponseBody
		public  void analysisofpurchaseevents(HttpSession httpSession,HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest,String muid,String productname,String producttypes,String expectnumberofproducts,String productprice) throws IOException {
			System.out.println("用户点击购买预判控制");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			//如果未登录
			if(httpSession.getAttribute("user")==null) {
				System.out.println("未登录");
				out.print("你未登录，请登录以后进行操作！！");
				out.flush();
				return;
			}
			LinkedHashMap<String, LinkedList<String>> shoppingcartMap=(LinkedHashMap<String, LinkedList<String>>) httpSession.getAttribute("shoppingcartMap");
			if(shoppingcartMap==null) {
				out.print("购物车信息异常，建议重新登录以后进行操作！！");
				out.flush();
				return;
			}
			LinkedList<String> tempList = shoppingcartMap.get(muid);
			if(tempList==null) {
				out.print("购物车信息异常，不存在该店铺购物车，\n***建议重新登录以后进行操作！！***");
				out.flush();
				return;
			}
			String[] name=productname.split("@");
			String[] type=producttypes.split("@");
			String[] price=productprice.split("@");
			String[] enumber=expectnumberofproducts.split("@");
			for(int i=0;i<name.length;i++) {
				String tempString=name[i]+"_"+type[i]+"_"+price[i]+"_"+enumber[i];
				if(!tempList.contains(tempString)) {
					out.print("服务器购物车中不存在 名字："+name[i]+" 类型："+type[i]+" 的商品\n***建议刷新或重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				ProductInformation productInformation=productInformationService.productInformationDao.selectProductInformationByBean(new ProductInformation(muid,name[i], type[i]));
				if(productInformation==null) {
					out.print("商品名字："+name[i]+" 类型："+type[i]+"已经被商家下架\n***建议重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				if(Double.parseDouble(price[i])!=productInformation.productprice) {
					tempList.remove(tempString);
					shoppingcartMap.put(muid, tempList);
					httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
					out.print("商品名字："+name[i]+" 类型："+type[i]+"的产品价格被修改为"+productInformation.productprice+"元\n***建议重新加购或重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				if(Integer.parseInt(enumber[i])>productInformation.numberofproducts) {
					out.print("商品名字："+name[i]+" 类型："+type[i]+"\n库存不足，库存为："+productInformation.numberofproducts+"\n***建议重新加购以后进行操作！！***");
					out.flush();
					return;
				}
			}
			//都没有问题
			httpSession.setAttribute("@muid",muid);
			httpSession.setAttribute("@name",name);
			httpSession.setAttribute("@type",type);
			httpSession.setAttribute("@price",price);
			httpSession.setAttribute("@enumber",enumber);
			out.print("成功");
			out.flush();
		}
		//用户点击订单中的确认购买事件
		@RequestMapping("confirmpurchase")
		@ResponseBody
		public  void confirmpurchase(HttpSession httpSession,HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest,String muid,String productname,String producttypes,String expectnumberofproducts,String productprice,String deliveryfee) throws IOException {
			System.out.println("用户点击订单中的确认购买事件控制");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			//如果未登录
			if(httpSession.getAttribute("user")==null) {
				System.out.println("未登录");
				out.print("你未登录，请登录以后进行操作！！");
				out.flush();
				return;
			}
			LinkedHashMap<String, LinkedList<String>> shoppingcartMap=(LinkedHashMap<String, LinkedList<String>>) httpSession.getAttribute("shoppingcartMap");
			if(shoppingcartMap==null) {
				out.print("购物车信息异常，建议重新登录以后进行操作！！");
				out.flush();
				return;
			}
			LinkedList<String> tempList = shoppingcartMap.get(muid);
			if(tempList==null) {
				out.print("购物车信息异常，不存在该店铺购物车，\n***建议重新登录以后进行操作！！***");
				out.flush();
				return;
			}
			String[] name=productname.split("@");
			String[] type=producttypes.split("@");
			String[] price=productprice.split("@");
			String[] enumber=expectnumberofproducts.split("@");
			for(int i=0;i<name.length;i++) {
				String tempString=name[i]+"_"+type[i]+"_"+price[i]+"_"+enumber[i];
				if(!tempList.contains(tempString)) {
					out.print("服务器购物车中不存在 名字："+name[i]+" 类型："+type[i]+" 的商品\n***建议刷新或重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				if(Double.parseDouble(deliveryfee)!=Double.parseDouble(storeInformationController.storeInformationDao.selectStoreInformationByPhone(muid).getDeliveryfee())) {
					out.print("该商家配送费发生变化\n***请刷新界面以显示最新配送费！！***");
					out.flush();
					return;
				}
				ProductInformation productInformation=productInformationService.productInformationDao.selectProductInformationByBean(new ProductInformation(muid,name[i], type[i]));
				if(productInformation==null) {
					out.print("商品名字："+name[i]+" 类型："+type[i]+"已经被商家下架\n***建议重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				if(Double.parseDouble(price[i])!=productInformation.productprice) {
					tempList.remove(tempString);
					shoppingcartMap.put(muid, tempList);
					httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
					out.print("商品名字："+name[i]+" 类型："+type[i]+"的产品价格被修改为"+productInformation.productprice+"元\n***建议重新加购或重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				if(Integer.parseInt(enumber[i])>productInformation.numberofproducts) {
					out.print("商品名字："+name[i]+" 类型："+type[i]+"\n库存不足，库存为："+productInformation.numberofproducts+"\n***建议重新加购以后进行操作！！***");
					out.flush();
					return;
				}

			}
			//都没有问题
			for(int i=0;i<name.length;i++) {
				String tempString=name[i]+"_"+type[i]+"_"+price[i]+"_"+enumber[i];
				if(!tempList.contains(tempString)) {
					out.print("服务器购物车中不存在 名字："+name[i]+" 类型："+type[i]+" 的商品\n***建议刷新或重新登录以后进行操作！！***");
					out.flush();
					return;
				}
				tempList.remove(tempString);
				
				ProductInformation productInformation=productInformationService.productInformationDao.selectProductInformationByBean(new ProductInformation(muid,name[i], type[i]));
				if(Integer.parseInt(enumber[i])>productInformation.numberofproducts) {
					out.print("商品名字："+name[i]+" 类型："+type[i]+"\n库存不足，库存为："+productInformation.numberofproducts+"\n***建议重新加购以后进行操作！！***");
					out.flush();
					return;
				}
				productInformation.setNumberofproducts(Integer.parseInt(enumber[i]));
				if(productInformationService.productInformationDao.updateProductInformationNumberByBean(productInformation)!=1) {
					out.print("购买失败\n***建议重新加购以后进行操作！！***");
					out.flush();
					return;
				}
			}
			//移除购物车信息
			shoppingcartMap.put(muid, tempList);
			httpSession.setAttribute("shoppingcartMap", shoppingcartMap);
			//
			String date=String.valueOf(System.currentTimeMillis());
			Calendar calendar=Calendar.getInstance();
			calendar.setTimeInMillis(Long.parseLong(date));
			//其它信息已有，下面是获得用户电话号码和生成订单号
			User user=(User)httpSession.getAttribute("user");
			String uid = user.getPhone();
			String ordernumber=String.valueOf(calendar.get(Calendar.YEAR))+String.valueOf(calendar.get(Calendar.MONTH)+1)+String.valueOf(calendar.get(Calendar.DATE))+date.substring(8,13)+UUID.randomUUID().toString().substring(0,8);
			OrderInformation orderInformation=new OrderInformation(ordernumber, date, uid, muid, deliveryfee, httpServletRequest.getParameter("consigneename"),httpServletRequest.getParameter("consigneephonenumber"), httpServletRequest.getParameter("consigneesaddress"), productname, producttypes, productprice, expectnumberofproducts,"0");
			orderInformationService.orderInformationDao.insertByBean(orderInformation);
			out.print("成功");
			out.flush();
		}
		//用户修改订单状态的事件
		@RequestMapping(value = "handleorderstatus")
		public  void handleorderstatus(HttpSession httpSession,HttpServletResponse httpServletResponse,HttpServletRequest httpServletRequest) throws IOException {
			System.out.println("用户修改订单状态的事件控制");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			
			String wantstatus=httpServletRequest.getParameter("wantstatus");
			String ordernumber=httpServletRequest.getParameter("ordernumber");
			HashMap<String, String> hashMap=new HashMap<String, String>();
			hashMap.put("wantstatus",wantstatus);
			hashMap.put("ordernumber",ordernumber);
			if(orderInformationService.orderInformationDao.updateOrderStatusByordernumber(hashMap)!=1) {
				out.println("发生错误，无法完成该操作\n*****请稍后再试*****");
				out.flush();
				return;
			}
			out.print("成功");
			out.flush();
		}
		//商家登录
		/***************************************************************************************************/
	//商家用户-登录检验
		@RequestMapping(value = "merchantusertolgoin")
		@ResponseBody
		public void merchantusertolgoin(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession) throws IOException, ServletException {
			System.out.println("进入商家确认登录");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
			//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();	
			
			String phone=httpServletRequest.getParameter("phone");
			String password=httpServletRequest.getParameter("password");
			MerchantUser merchantUser= merchantUserController.selectMerchantUser(new MerchantUser(phone, password));
			if(!phone.isEmpty()&&!password.isEmpty()) {
				if(merchantUser!=null){
					httpSession.setAttribute("merchantuser", merchantUser);
					httpSession.setAttribute("storeinformation", storeInformationController.selectStoreInformationByPhone(merchantUser.getPhone()));
					httpSession.setAttribute("productInformation",productInformationService.selectAllProductInformationByMuid(phone));
					out.print("成功");
					out.flush();
				}else {
					out.print("手机号或密码错误");
					out.flush();
				}
			}else {
				out.print("手机号和密码不可以为空，且同为11位");
				out.flush();
			}
		}
		//商家用户-提交注册的申请信息
		@RequestMapping(value = "submitamerchantuserregistrationrequest",method = RequestMethod.POST)
		@ResponseBody
		public void submitamerchantuserregistrationrequest(MerchantUserRegistrationRequest merchantUserRegistrationRequest,HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession) throws IOException {
			System.out.println("进入商家提交注册的申请信息");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
			//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();	
			
			if(merchantUserController.selectMerchantUserByPhone(merchantUserRegistrationRequest.getPhoneNumber())) {
				out.print("该手机号已经被注册");
				out.flush();
				return;
			}
			if(merchantUserController.selectMerchantUserRegistrationRequestByPhone(merchantUserRegistrationRequest.getPhoneNumber())) {
				out.print("该手机号已经提交过注册申请，请耐心等待。");
				out.flush();
				return;
			}
			if(merchantUserController.insertMerchantUserRegistrationRequestByBean(merchantUserRegistrationRequest)) {
				out.print("成功");
				out.flush();
				return;
			}else {
				out.print("请稍后再试。");
				out.flush();
			}
		}
		//商家用户-删除@提交注册的申请信息
		@RequestMapping(value = "deleteMerchantUserRegistrationRequest/{phone}/{nowNumberOFpages}")
		public String deleteMerchantUserRegistrationRequest(@PathVariable(value = "phone")String phone,@PathVariable(value = "nowNumberOFpages")String nowNumberOFpages,HttpSession httpSession,HttpServletRequest httpServletRequest) {
			if(httpSession.getAttribute("administrator")==null)
				return "forward:/toenteradministratorpage" ;
			merchantUserController.deleteMerchantUserRegistrationRequestByPhone(phone);
			httpServletRequest.setAttribute("administratorStartPage", nowNumberOFpages);
			return "forward:/toadministratorpage";
		}
		//商家用户-请求更新全部产品信息
		@RequestMapping(value = "**/updatesessionproductinformation")
		public String updatesessionproductinformation(HttpSession httpSession,Model model) {
			MerchantUser merchantUser = (MerchantUser) httpSession.getAttribute("merchantuser");
			if(merchantUser==null)
				return "forward:/tomerchant";
			httpSession.setAttribute("productInformation",productInformationService.selectAllProductInformationByMuid(merchantUser.getPhone()));
			model.addAttribute("orderInformation", orderInformationService.orderInformationDao.selectAllOrderforMUIDInformation(merchantUser.getPhone()));
			return "merchantHomepage";
		}
		//商家用户-提交商铺信息
		@RequestMapping(value = "submitstoreinformation")
		@ResponseBody
		public void submitstoreinformation(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession) throws IOException {
			System.out.println("进入提交商铺信息");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			//获取信息
			MerchantUser merchantUser= (MerchantUser) httpSession.getAttribute("merchantuser");
			StoreInformation storeInformation= (StoreInformation) httpSession.getAttribute("storeinformation");
			
			System.out.println(merchantUser.getPhone());
			
			String name=httpServletRequest.getParameter("name");
			String deliveryfee=httpServletRequest.getParameter("deliveryfee");
			String phone2=httpServletRequest.getParameter("phone2");
			String storetype=httpServletRequest.getParameter("storetype");
			String productcategory=httpServletRequest.getParameter("productcategory");
			
			HashMap<String, String>hashMap=new HashMap<String, String>();
			hashMap.put("phone", merchantUser.getPhone());
			hashMap.put("name", name);
			hashMap.put("deliveryfee", deliveryfee);
			hashMap.put("phone2", phone2);
			hashMap.put("storetype", storetype);
			hashMap.put("productcategory", productcategory);
			
			StoreInformationDao storeInformationDao= storeInformationController.storeInformationDao;
			if(storeInformationDao.updateStoreInformationByPhone(hashMap)==1) {
				if(httpSession.getAttribute("merchantuser")!=null) {
					httpSession.removeAttribute("merchantuser");
					httpSession.removeAttribute("storeinformation");
				}
				out.write("成功");
			}else {
				out.write("失败");
			}
			
		}
		//商家用户-提交商品信息
		@RequestMapping(value = "/submitproductinformation")
		@ResponseBody
		public void submitproductinformation(@RequestParam(value = "productpicture",required = false) List<MultipartFile> files,@RequestParam(value = "isnew") boolean isnew,ProductInformation productInformation,HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws IOException {
			System.out.println("提交商品信息");
			//解决乱码问题
			httpServletRequest.setCharacterEncoding("UTF-8");
			httpServletResponse.setHeader("content-type","text/html; charset=UTF-8");
				//是否启用缓存
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setCharacterEncoding("UTF-8");
			//获取回复对象的实例
			PrintWriter out=httpServletResponse.getWriter();
			
			MerchantUser merchantUser=(MerchantUser) httpServletRequest.getSession().getAttribute("merchantuser");
			if(merchantUser==null) {
				out.print("你没有登录！！！");
				out.flush();
				return;
			}
			String muid=merchantUser.getPhone();
			productInformation.setMuid(merchantUser.getPhone());
			String productname=productInformation.getProductname();
			String producttypes=productInformation.getProducttypes();
			//判断是否新建
			if(isnew) {
				//查重
				if(productInformationService.isexist(productInformation)) {
					out.print("该类型下有重名商品");
				}else {
					if(productInformationService.insertProductInformation(productInformation)) {
						//成功插入后查看图片进行插入。
						int i=0;
						for (MultipartFile multipartFile : files) {
							String fileType=multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
							String fileName=muid+"_"+producttypes+"_"+productname+"_"+i+fileType;
							i++;
							String filePath="D:\\缓存\\fileUpload\\productpicture\\"+fileName;
							System.out.println(filePath);
							File file=new File(filePath);
							System.out.println(file.exists());
							try {
								multipartFile.transferTo(file);
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
							System.out.println(file.exists());
						}
						httpServletRequest.getSession().setAttribute("productInformation",productInformationService.selectAllProductInformationByMuid(merchantUser.getPhone()));
						out.print("成功");
						out.flush();
					}else {
						out.print("请稍后再试！");
						out.flush();
					}
				}
			}else {//修改商品
				//是否存在这个商品
				if(productInformationService.isexist(productInformation)) {
					//先删除现有图片
					File tempfile=new File("D:\\缓存\\fileUpload\\productpicture");			
					String tempfileName=muid+"_"+producttypes+"_"+productname+"_";
					for (File temp : tempfile.listFiles(new PictureFilenameFilter(tempfileName))) {
						temp.delete();
					}
					if(productInformationService.updateProductInformationByBean(productInformation)) {
						//成功修改后查看图片进行插入。
						int i=0;
						for (MultipartFile multipartFile : files) {
							String fileType=multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
							String fileName=muid+"_"+producttypes+"_"+productname+"_"+i+fileType;
							i++;
							String filePath="D:\\缓存\\fileUpload\\productpicture\\"+fileName;
							System.out.println(filePath);
							File file=new File(filePath);
							System.out.println(file.exists());
							try {
								multipartFile.transferTo(file);
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
							System.out.println(file.exists());
						}
						httpServletRequest.getSession().setAttribute("productInformation",productInformationService.selectAllProductInformationByMuid(merchantUser.getPhone()));
						out.print("成功");
						out.flush();
					}else {
						out.print("请稍后再试！");
						out.flush();
					}
					
				}else {
					out.print("请稍后再试！");
					out.flush();
				}
				
			}
		}
		//商家用户-删除商品信息
		@RequestMapping(value = "**/deleteproductinformation/{muid}/{producttypes}/{productname}")
		public String deleteproductinformation(@PathVariable(value = "muid" )String muid,@PathVariable(value = "producttypes" )String producttypes,@PathVariable(value = "productname" )String productname,HttpServletRequest httpServletRequest) {
			MerchantUser MerchantUser = (MerchantUser) httpServletRequest.getSession().getAttribute("merchantuser");
			if(MerchantUser==null)
				return "forward:/tomerchant";
			String sessionmuid=MerchantUser.getPhone();
			if(!sessionmuid.equals(muid))
				return "forward:/tomerchantHomepage";
			ProductInformation productInformation=productInformationService.getbypartialinformation(new ProductInformation(muid, productname, producttypes));
			if(productInformation==null)
				return "forward:/tomerchantHomepage";
			
			productInformationService.deleteProductInformationBypartialinformation(productInformation);
			File file=new File("D:\\缓存\\fileUpload\\productpicture");			
			String fileName=muid+"_"+producttypes+"_"+productname+"_";
			for (File tempfile : file.listFiles(new PictureFilenameFilter(fileName))) {
				tempfile.delete();
			}
			return "forward:/tomerchantHomepage";
			
		}
		
}
