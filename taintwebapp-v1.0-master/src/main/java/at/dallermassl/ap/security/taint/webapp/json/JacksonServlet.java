package at.dallermassl.ap.security.taint.webapp.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.*;

public class JacksonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JacksonServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletInputStream inputstream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputstream));  
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enableDefaultTyping();
		Student student = mapper.readValue(sb.toString(),Student.class);
		mapper.disableDefaultTyping();
		Student student2 = mapper.readValue(sb.toString(),Student.class);
		
		String str = mapper.writeValueAsString(student2);
		
		//response.getWriter().println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(student.getStudentName()));
		response.getWriter().println(student.getStudentName());
		//response.getWriter().println(student);
		/*
		JsonNode node = mapper.readTree(sb.toString());
		
		String teacherName = node.get("teacherName").asText();
		response.getWriter().println(teacherName);
		
		if(node.get("students") != null && node.get("students").size() > 0) {
			JsonNode studentNode = node.get("students");
			for(int i = 0; i < studentNode.size(); i++) {
				response.getWriter().println(studentNode.get(i).get("studentName").asText() + " " + studentNode.get(i).get("studentAge").asInt());
			}
		}
		
		JsonNode courseNode = node.get("course");
		response.getWriter().println(courseNode.get("courseId") + " " + courseNode.get("courseName").asText());
		*/
	}

}
