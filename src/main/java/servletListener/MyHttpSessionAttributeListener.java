package servletListener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import webMybatis.User;
import webMybatis.administrator.Administrator;

public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener{

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO 自动生成的方法存根
		HttpSessionAttributeListener.super.attributeAdded(se);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO 自动生成的方法存根
		System.out.println("删除属性");
		
		if(se.getValue() instanceof Administrator) {
			Administrator administrator=(Administrator) se.getValue();
			ServletContext servletContext=se.getSession().getServletContext();
			servletContext.removeAttribute("administrator_"+administrator.getAdminname());
		}
		if(se.getValue() instanceof User) {
			se.getSession().removeAttribute("shoppingcartMap");
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO 自动生成的方法存根
		HttpSessionAttributeListener.super.attributeReplaced(se);
	}

}
