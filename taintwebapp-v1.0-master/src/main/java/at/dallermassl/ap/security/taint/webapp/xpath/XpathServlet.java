package at.dallermassl.ap.security.taint.webapp.xpath;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import at.dallermassl.ap.security.taint.webapp.Sanitizer;

import javax.xml.parsers.*;
import javax.xml.xpath.*;

public class XpathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XpathServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("author");
		
		DocumentBuilderFactory domFactory = DocumentBuilderFactory.newInstance();
	    domFactory.setNamespaceAware(true); // never forget this!
	    DocumentBuilder builder;
	    Document doc = null;
		try {
			builder = domFactory.newDocumentBuilder();
			String root = request.getServletContext().getRealPath("vulns/xpath/books.xml");
			if(root == null){
				root = this.getClass().getClassLoader().getResource("/").getPath() + "../../vulns/xpath/books.xml";
			}
			doc = builder.parse(root);
		} catch (ParserConfigurationException e  ) {
			e.printStackTrace();
		} catch(SAXException e) {
			e.printStackTrace();
		}
	   
	    XPathFactory factory = XPathFactory.newInstance();
	    XPath xpath = factory.newXPath();
	    XPathExpression expr;
	    if(Sanitizer.login(param)) {
	    	try {
				expr = xpath.compile("//book[author='"+ param +"']/title/text()");
				Object result = expr.evaluate(doc, XPathConstants.NODESET);
			    
			    NodeList nodes = (NodeList) result;
			    for (int i = 0; i < nodes.getLength(); i++) {
			        response.getWriter().println(nodes.item(i).getNodeValue()); 
			    }
			} catch (XPathExpressionException e) {
				e.printStackTrace();
			}
	    } else {
			response.setContentType("text/html;charset=utf-8"); 
			response.setCharacterEncoding("utf-8");  
			response.getWriter().println("登录失败，不存在Xpath注入");
	    }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
