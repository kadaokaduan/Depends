package at.dallermassl.ap.security.taint.webapp;

import java.io.IOException;
import java.security.Key;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class CheckDataSignUtil {
	public static String checkSign(String data) throws Exception {
		String resData = null;
		long startDate = System.currentTimeMillis();
		try {
			System.out.println("请求数据解密开始");
			if(data.length() < 1500)
			{
				System.out.println("待解密数据：" + data);
			}
			
			String[] array = getSignDataArray(data);
			
			// 数据摘要
			String md5Str = array[0];
			
			System.out.println("MD5数据：" + md5Str);
			
			// 数字信封
			String keyStr = getKeyStr(array[2]);
			
			System.out.println("随机数：" + keyStr);
			
			resData = decodeSignData(array[1], keyStr);
			
			if(resData.length() < 1500)
			{
				System.out.println("报文：" + resData);
			}
			
			long endDate = System.currentTimeMillis();
			
			System.out.println("解密耗时：" + (endDate - startDate));
			System.out.println("请求数据解密结束");
		} catch (Exception e) {
			System.out.println("解密发生异常:");
			e.printStackTrace();
		}
		return resData;
	}
	
	public static String getKeyStr(String str) throws Exception {
		SignDataRSACerPlus plus = SignDataRSACerPlus.getInstance();
		
		String keyStr = plus.doDecrypt(str);
		
		return keyStr;
	}

	private static String decodeSignData(String data, String keyStr) throws Exception {
		if(data.length() < 1500)
		{
			System.out.println("加密数据：" + data);
		}
		
		Key k = SignDataAESCoder.getKey(keyStr.getBytes());
		// 交易报文解密
		byte[] dataArr = strToBase64(data);
		byte[] encryptData = SignDataAESCoder.decodeData(dataArr, k);
		data = new String(encryptData, "utf-8");
		
		return data;
	}

	public static byte[] strToBase64(String data) throws IOException {
		return (new BASE64Decoder()).decodeBuffer(data);
	}
	
	public static String base64ToString(byte[] key) throws Exception {
		return (new BASE64Encoder()).encodeBuffer(key);
	}

	public static String[] getSignDataArray(String data) throws Exception
	{
		String[] array = data.split((char) (35) + "");
		
		if (array.length != 3) {
			System.out.println("请求数据结构不正确!");
			throw new Exception("请求数据结构不正确!");
		}
		
		return array;
	}
	
	public static void checkMD5Data(String md5Str, String keyStr, String resData) throws Exception
	{
		// 对数据摘要生产的报文进行md5校验
		String strRemark = keyStr + resData;
		if (!md5Str.equals(MD5Encrypt.MD5(strRemark))) {
			System.out.println("数据摘要不正确，报文非法!");
			throw new Exception("数据摘要不正确，报文非法!");
		}
	}
}
