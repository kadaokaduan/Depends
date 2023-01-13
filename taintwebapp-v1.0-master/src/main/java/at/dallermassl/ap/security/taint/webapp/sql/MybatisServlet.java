package at.dallermassl.ap.security.taint.webapp.sql;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MybatisServlet
 */
public class MybatisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MybatisServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String taintName = request.getParameter("taintName");
		User user = UserDao.findUserById(id);
		User user1 = UserDao.findUserByName(name);
		User user2 = UserDao.findUserByTaintName(taintName);
		response.getWriter().append("UserName:").append(org.owasp.esapi.ESAPI.encoder().encodeForHTML(user.getName()));
		response.getWriter().append("UserName:").append(org.owasp.esapi.ESAPI.encoder().encodeForHTML(user1.getName()));
		response.getWriter().append("UserName:").append(org.owasp.esapi.ESAPI.encoder().encodeForHTML(user2.getName()));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
