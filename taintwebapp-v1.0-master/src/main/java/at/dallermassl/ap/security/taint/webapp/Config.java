package at.dallermassl.ap.security.taint.webapp;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Config {

    public static String mysqlUrl;
    public static String mysqlUsername;
    public static String mysqlPassword = "";
    public static String ldapUrl;
    public static String ldapBaseDN;
    public static String ldapRoot;
    public static String ldapPassword;


    static {
        Properties properties = new Properties();
        InputStream inputStream = Config.class.getResourceAsStream("/default.properties");
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        mysqlUrl = properties.getProperty("mysql.connect.url");
        mysqlUsername = properties.getProperty("mysql.connect.username");
        mysqlPassword = properties.getProperty("mysql.connect.password");
        ldapUrl = properties.getProperty("ldap.connect.url");
        ldapBaseDN = properties.getProperty("ldap.connect.baseDN");
        ldapRoot = properties.getProperty("ldap.connect.root");
        ldapPassword = properties.getProperty("ldap.connect.password");
    }

    public static String getProperties(String type){
        if(type.equals("sqlUrl")){
            return mysqlUrl;
        } else if(type.equals("sqlUsername")){
            return mysqlUsername;
        } else if(type.equals("sqlPassword")){
            return mysqlPassword;
        } else if(type.equals("ldapUrl")){
            return ldapUrl;
        } else if(type.equals("ldapBaseDN")){
            return ldapBaseDN;
        } else if(type.equals("ldapRoot")){
            return ldapRoot;
        } else if(type.equals("ldapPassword")){
            return ldapPassword;
        }
        return "";
    }
    
}
