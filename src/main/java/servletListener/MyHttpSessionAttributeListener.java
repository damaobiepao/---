package servletListener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import webMybatis.User;
import webMybatis.administrator.Administrator;

public class MyHttpSessionAttributeListener implements HttpSessionAttributeListener{

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO �Զ����ɵķ������
		HttpSessionAttributeListener.super.attributeAdded(se);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO �Զ����ɵķ������
		System.out.println("ɾ������");
		
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
		// TODO �Զ����ɵķ������
		HttpSessionAttributeListener.super.attributeReplaced(se);
	}

}
