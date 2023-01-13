package at.dallermassl.ap.security.taint.webapp.xxe;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;

/**
 * Servlet implementation class XXEServlet
 */
public class XXEServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String USERNAME = "admin";//账号
	private static final String PASSWORD = "admin";//密码
	
    public XXEServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result="";
        try {
            //DOM Read XML
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();  
            
            //dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
            DocumentBuilder db = dbf.newDocumentBuilder();                  
            Document doc = db.parse(request.getInputStream());

            String username = getValueByTagName(doc,"username");
            String password = getValueByTagName(doc,"password");
            if(username.equals(USERNAME) && password.equals(PASSWORD)){
                result = String.format("<result><code>%d</code><msg>%s</msg></result>",1,username);
            }else{
                result = String.format("<result><code>%d</code><msg>%s</msg></result>",0,username);
            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
            result = String.format("<result><code>%d</code><msg>%s</msg></result>",3,org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.getMessage()));
        } catch (SAXException e) {
            e.printStackTrace();
            result = String.format("<result><code>%d</code><msg>%s</msg></result>",3,org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.getMessage()));
        }
        response.setContentType("text/xml;charset=UTF-8");
        response.getWriter().println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(result));
	}

	public static String getValueByTagName(Document doc, String tagName){  
        if(doc == null || tagName.equals(null)){  
            return "";  
        }  
        NodeList pl = doc.getElementsByTagName(tagName);  
        if(pl != null && pl.getLength() > 0){  
            return pl.item(0).getTextContent();  
        } 
        return "";
	}
}
