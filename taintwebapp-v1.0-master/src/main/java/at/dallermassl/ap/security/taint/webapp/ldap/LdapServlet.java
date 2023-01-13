package at.dallermassl.ap.security.taint.webapp.ldap;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LdapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LdapServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		String sn = request.getParameter("sn");
		ldapAuthentication ldap = new ldapAuthentication();
		ldap.LDAP_connect();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(ldap.getUserDN(num,sn));
		ldap.closeContext();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		String sn = request.getParameter("sn");
		ldapAuthentication ldap = new ldapAuthentication();
		ldap.LDAP_connect();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(ldap.getUserDN(num,sn));
		ldap.closeContext();
	}

}
