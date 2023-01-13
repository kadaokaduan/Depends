package at.dallermassl.ap.security.taint.webapp.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import at.dallermassl.ap.security.taint.webapp.json.Student;

public class FastJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FastJsonServlet() {
        // TODO Auto-generated constructor stub
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
		
		response.setContentType("text/html;charset=utf-8");
		
		/*JSON反序列化*/
		//简单对象
		/*
		Student student = JSON.parseObject(sb.toString(),Student.class);
		JSONObject jsonObject = JSON.parseObject(sb.toString());
		response.getWriter().println(student.getStudentName());
        response.getWriter().println(jsonObject.getString("studentName"));
		*/
		
		//JSON数组类型
		/*
		JSONArray jsonArray = JSON.parseArray(sb.toString());
		for (Object obj : jsonArray) {
            JSONObject jsonObject = (JSONObject) obj;
            response.getWriter().println(jsonObject.getString("studentName")+":"+jsonObject.getInteger("studentAge"));
        }
        */
		
		//复杂JSON
		JSONObject jsonObject = JSON.parseObject(sb.toString());        
        String teacherName = jsonObject.getString("teacherName");
        Integer teacherAge = jsonObject.getInteger("teacherAge");
        JSONObject course = jsonObject.getJSONObject("course");
        JSONArray students = jsonObject.getJSONArray("students");
        response.getWriter().println(teacherName);
        response.getWriter().println(teacherAge);
        response.getWriter().println(course.getString("courseName") + course.getInteger("courseId"));
        for (Object obj : students) {
            JSONObject student = (JSONObject) obj;
            response.getWriter().println(student.getString("studentName")+":"+student.getInteger("studentAge"));
        }
		
		/*java序列化成JSON*/
		/*
		String serializedStr = JSON.toJSONString(student);
		Student student1 = JSON.parseObject(serializedStr,Student.class);
		response.getWriter().println(student1.getStudentName());
		*/
        Student student = new Student();
        student.setStudentName(teacherName);
        student.setStudentAge(teacherAge);
        
        
//        Map<String,Object> map = new HashMap();
//        map.put("1111",  student.getStudentName());
//        response.getWriter().println(map);
        
//        String serializedStr = JSON.toJSONString(student);
//        response.getWriter().println(student);
//        response.getWriter().println(serializedStr);
        
	}

}
