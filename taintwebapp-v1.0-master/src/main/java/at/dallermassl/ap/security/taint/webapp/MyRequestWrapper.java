package at.dallermassl.ap.security.taint.webapp;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class MyRequestWrapper extends HttpServletRequestWrapper{
	private HttpServletRequest request;
	
	public MyRequestWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	
	@Override
	public String getParameter(String name) {
		String str = request.getParameter(name);
		return Sanitizer.sanitize(str);	
	}

	@Override
	public Map<String,String[]> getParameterMap() {
		Map<String,String[]> map = request.getParameterMap();
		Map<String,String[]> newmap = new HashMap<String,String[]>();
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
            String[] values = entry.getValue();
             
			for (int i = 0; i < values.length; i++) { 
				if(values[i] instanceof String){
					values[i] = values[i].replace("<", "&lt;").replace("\"", "&quot;");
				}
			}
            newmap.put(entry.getKey().replace("<", "&lt;").replace("\"", "&quot;"), values);
        }
		return newmap;	
	}
	
	@Override
	public ServletInputStream getInputStream() throws IOException {
		String contentType = request.getContentType();
		System.out.println("request请求头信息：" + contentType);
		
		InputStream in = request.getInputStream();
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));		
		String str = null;
		while((str = reader.readLine()) != null)
		{
			buffer.append(str);
		}
		
		String requestStr = buffer.toString();
		
		try {
			requestStr = checkSignData(requestStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		byte[] byteArray = requestStr.getBytes("UTF-8");
		final ByteArrayInputStream bais = new ByteArrayInputStream(byteArray);
		ServletInputStream newStream = new ServletInputStream() {
			
			@Override
			public int read() throws IOException {
				return bais.read();
			}

			@Override
			public boolean isFinished() {
				return false;
			}

			@Override
			public boolean isReady() {
				return false;
			}

			@Override
			public void setReadListener(ReadListener readListener) {				
			}

		};
		return newStream;
	}
	
	private String checkSignData(String requestStr) throws Exception
	{
		
		if(requestStr == null || "".equals(requestStr) )
		{
			return "";
		}
		else
		{
			return CheckDataSignUtil.checkSign(requestStr);
		}
	}
}
