package at.dallermassl.ap.security.taint.webapp.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

public class GsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GsonServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader( (ServletInputStream) request.getInputStream(), "utf-8"));  
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		
		Gson gson = new Gson();
		Student student = gson.fromJson(sb.toString(), Student.class);
	    JsonObject jsonObject = (JsonObject) new JsonParser().parse(sb.toString());
	    response.getWriter().println(student.getStudentName());
	    response.getWriter().println(jsonObject.get("studentName").getAsString());
	}

}
