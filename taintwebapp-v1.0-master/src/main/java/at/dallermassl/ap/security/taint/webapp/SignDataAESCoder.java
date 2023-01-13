package at.dallermassl.ap.security.taint.webapp;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class SignDataAESCoder {
	private static final String KEY_ALGORITHM = "AES";
	private static final String DEFAULT_CIPHER_ALGORITHM = "AES/CBC/PKCS5Padding";	
	static String VEC = "JSNXSJYHJSNXSJYH";
	
	public static Key getKey(byte[] key) {		
		return new SecretKeySpec(key, KEY_ALGORITHM);
	}

	public static byte[] decodeData(byte[] data, Key key) throws Exception {
		return decrypt(data, key, DEFAULT_CIPHER_ALGORITHM);
	}
	
	public static byte[] encrypt(byte[] data, Key key, String cipherAlgorithm)
			throws Exception {
		// 实例化
		Cipher cipher = Cipher.getInstance(cipherAlgorithm);
		// 使用密钥初始化，设置为加密模式
		//cipher.init(Cipher.ENCRYPT_MODE, key);
		cipher.init(Cipher.ENCRYPT_MODE, key,
				new IvParameterSpec(VEC.getBytes("UTF-8")));
		// 执行操作
		return cipher.doFinal(data);
	}
	
	public static byte[] decrypt(byte[] data, Key key, String cipherAlgorithm)
			throws Exception {
		// 实例化
		Cipher cipher = Cipher.getInstance(cipherAlgorithm);
		// 使用密钥初始化，设置为解密模式
		cipher.init(Cipher.DECRYPT_MODE, key,
				new IvParameterSpec(VEC.getBytes("UTF-8")));
		// 执行操作
		return cipher.doFinal(data);
	}
}
