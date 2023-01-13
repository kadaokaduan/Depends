/**
 *
 */
package at.dallermassl.ap.security.taint.webapp;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

import org.owasp.esapi.ESAPI;

public class Sanitizer {

    public static boolean login(String name) {
        if("Larry Niven".equals(name)) {
            return true;
        }
        return false;
    }

    public static String mySanitizer(String value) {
        return value.replace("../","");
    }

    public static String sanitize(String value) {
        if (value == null) {
            return null;
        }
        String secure = value.replace("<", "&lt;");
        secure = secure.replace("\"", "&quot;");
        return new String(secure);
    }

    public static String encodeforHtml(String value) {
        if (value == null) {
            return null;
        }

        return ESAPI.encoder().encodeForHTML(value);
    }
    
    public static String encodeJs(String value) {
        return value.replace("../","").toCharArray().toString();
    }

    public static boolean validateXss(String value) {
        if("Larry Niven".equals(value)) {
            return true;
        }
        return false;
    }

    public static String genStoreEmail(String email){
        ByteArrayOutputStream opt = new ByteArrayOutputStream();
        byte[] bytes = email.getBytes(StandardCharsets.UTF_8);
        for(byte b: bytes){
            if(b == "@".getBytes(StandardCharsets.UTF_8)[0]){
                continue;
            }
            opt.write(b);
        }
        return new String(opt.toByteArray());
    }

    public static boolean checkFilePath(String path) {
        String[] whitelist = new String[]{"mypath","whitepath"};
        for(String whiteword : whitelist){
            if(path.contains(whiteword)){
                return true;
            }
        }
        
        String[] blacklist = new String[]{"../","/etc/passwd","C:\\Windows"};
        for(String blackword : blacklist){
            if(path.contains(blackword)){
                return false;
            }
        }

        return true;
    }

    public static boolean checkFileContent(String data) {
        String[] blacklist = new String[]{"Runtime.getRuntime().exec"};
        for(String blackword : blacklist){
            if(data.contains(blackword)){
                return false;
            }
        }

        return true;
    }
}
