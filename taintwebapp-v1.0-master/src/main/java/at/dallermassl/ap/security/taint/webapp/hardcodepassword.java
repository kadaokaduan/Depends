package at.dallermassl.ap.security.taint.webapp;

import java.security.Key;

import javax.crypto.spec.SecretKeySpec;

public class hardcodepassword {
    public static final String password = "mypassword";
    public static final String date_password = "date_password";
    public static final byte[] aes = "key".getBytes();
    private static final String KEY_ALGORITHM = "AES";

    public static Key getKey(byte[] key) {		
		return new SecretKeySpec(key, KEY_ALGORITHM);
    }

}
