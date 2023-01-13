package at.dallermassl.ap.security.taint.webapp.ssrf;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SSRFServlet
 */
public class SSRFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SSRFServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String url = request.getParameter("url");
            System.out.println("url:" + url);
            URL u = new URL(url);
            URLConnection urlConnection = u.openConnection();  
            //HttpURLConnection httpUrl = (HttpURLConnection)urlConnection;   //HttpURLConnection
            
            //httpUrl.setInstanceFollowRedirects(false);
            
            BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8")); //send request
            String inputLine;
            StringBuffer html = new StringBuffer(); 
            
            while ((inputLine = in.readLine()) != null) {
                html.append(inputLine);
            }        
            in.close();
            
        
            response.setHeader("Content-type", "text/html");
            PrintWriter myout = response.getWriter();
            myout.println("HttpURLConnection test");
            myout.println("url:" + org.owasp.esapi.ESAPI.encoder().encodeForHTML(url));
            myout.println("<br>len:" + html.toString().length());  
            myout.println("<br>text:" + org.owasp.esapi.ESAPI.encoder().encodeForHTML(html.toString()));
            myout.flush();


        }catch(Exception e) {
            e.printStackTrace();           
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
