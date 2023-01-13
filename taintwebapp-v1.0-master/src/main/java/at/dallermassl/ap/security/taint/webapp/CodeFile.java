package at.dallermassl.ap.security.taint.webapp;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class CodeFile {
    public static String Decode(String s) throws UnsupportedEncodingException {
        byte[] base64decodedBytes = Base64.getDecoder().decode(s);
        String decstr = new String(base64decodedBytes, "utf-8");
        return decstr;
    }
    public static String RandName(String value)
    {
        int max=999999999,min=1;
        long randomNum = System.currentTimeMillis();
        int ran3 = (int) (randomNum%(max-min)+min);
        String[] strs = value.split("\\.");
        String filename = "";
        int len=strs.length;
        for(int i=0;i<len-1;i++){
            filename += strs[i].toString();
        }
        filename = filename + ran3 + "." + strs[len-1];
        return filename;
    }
}
