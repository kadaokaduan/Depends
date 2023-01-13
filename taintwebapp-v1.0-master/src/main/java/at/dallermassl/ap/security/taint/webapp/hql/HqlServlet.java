package at.dallermassl.ap.security.taint.webapp.hql;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HqlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HqlServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		//1.读取hibernate.cfg.xml文件
		Configuration cfg = new Configuration();
		cfg.configure(); 
		
		//2.创建SessionFactory工厂
		SessionFactory factory = cfg.buildSessionFactory();
		
		//3.创建Session对象
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		String hql="from Student Where name = '" + name + "'";

		Query query=session.createQuery(hql);
	    //query.setString(1, name);

	    List<Student> list=query.list();

	    for(Student student:list){
	    	response.getWriter().println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(student.getName()));
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
