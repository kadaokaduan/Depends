package at.dallermassl.ap.security.taint.webapp.deserialization;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class DeserializationServlet
 */
public class DeserializationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeserializationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		InputStream in = request.getInputStream();
		byte[] data = (new BASE64Decoder()).decodeBuffer(in);
		ObjectInputStream objectIn = new ObjectInputStream(new ByteArrayInputStream(data));
        try {
        	Object obj = objectIn.readObject();
        	response.getWriter().println(obj.toString());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        in.close();
	}

}
