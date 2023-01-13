package at.dallermassl.ap.security.taint.webapp.xxe;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.xml.sax.SAXException;

/**
 * Servlet implementation class Dom4jXML
 */
public class Dom4jXML extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USERNAME = "admin";//账号
	private static final String PASSWORD = "admin";//密码
	
    public Dom4jXML() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result="";
        try {
            //DOM4J Read XML
            SAXReader saxReader = new SAXReader();
            //saxReader.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
            Document document = saxReader.read(request.getInputStream());

            String username = getValueByTagName2(document,"username");
            String password = getValueByTagName2(document,"password");

            if(username.equals(USERNAME) && password.equals(PASSWORD)){
                result = String.format("<result><code>%d</code><msg>%s</msg></result>",1,username);
            }else{
                result = String.format("<result><code>%d</code><msg>%s</msg></result>",0,username);
            }                

        } catch (DocumentException  e) {
            System.out.println(e.getMessage());
        } 
        response.setContentType("text/xml;charset=UTF-8");
        response.getWriter().println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(result));
	}
	
	public static String getValueByTagName2(Document document, String tagName){  
		
		if(document == null || tagName.equals(null)){  
			return "";  
	    }  
		
		Element root = document.getRootElement();
	  
	    for (Iterator<Element> it = root.elementIterator(); it.hasNext();) {
	    	Element myuser = (Element) it.next();              
	    	if(myuser.getName().equals(tagName)){
	    		return myuser.getText();
	    	}
	    }	
	    return "";
	}
}
