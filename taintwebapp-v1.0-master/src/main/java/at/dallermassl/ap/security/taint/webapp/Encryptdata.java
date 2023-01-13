package at.dallermassl.ap.security.taint.webapp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.Key;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Encryptdata
 */
public class Encryptdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Encryptdata() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream input = request.getInputStream();
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = new BufferedReader(new InputStreamReader(input, "UTF-8"));		
		String str = null;
		while((str = reader.readLine()) != null)
		{
			buffer.append(str);
		}
		
		String requestStr = buffer.toString();
		String[] array = requestStr.split((char) (35) + "");
		
		String base64str = null;
		try {
			base64str = CheckDataSignUtil.base64ToString(array[0].getBytes("UTF-8"));
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		byte[] dataArr = CheckDataSignUtil.strToBase64(base64str);
		String keyStr = null;
		try {
			keyStr = CheckDataSignUtil.getKeyStr(array[1]);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Key k = SignDataAESCoder.getKey(keyStr.getBytes());
		
		byte[] encryptdata = null;
		try {
			String strRemark = keyStr + array[0];
			
			encryptdata = SignDataAESCoder.encrypt(dataArr, k, "AES/CBC/PKCS5Padding");
			response.getWriter().println(MD5Encrypt.MD5(strRemark) + (char) (35) + CheckDataSignUtil.base64ToString(encryptdata) + (char) (35)+ array[1]);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
