package at.dallermassl.ap.security.taint.webapp.ldap;

import java.util.Hashtable;  

import javax.naming.AuthenticationException;  
import javax.naming.Context;  
import javax.naming.NamingEnumeration;  
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;  
import javax.naming.directory.BasicAttributes;  
import javax.naming.directory.SearchControls;  
import javax.naming.directory.SearchResult;  
import javax.naming.ldap.Control;  
import javax.naming.ldap.InitialLdapContext;  
import javax.naming.ldap.LdapContext;

import at.dallermassl.ap.security.taint.webapp.Config;

public class ldapAuthentication {
	private final String URL = Config.getProperties("ldapUrl");  
    private final String BASEDN = Config.getProperties("ldapBaseDN");  // 根据自己情况进行修改  
    private final String FACTORY = "com.sun.jndi.ldap.LdapCtxFactory";  
    private LdapContext ctx = null;  
    private final Control[] connCtls = null;  
    
    void LDAP_connect() {  
        Hashtable<String, String> env = new Hashtable<String, String>();  
        env.put(Context.INITIAL_CONTEXT_FACTORY, FACTORY);  
        env.put(Context.PROVIDER_URL, URL + BASEDN);  
        env.put(Context.SECURITY_AUTHENTICATION, "simple");  
              
        env.put(Context.SECURITY_PRINCIPAL, Config.getProperties("ldapRoot"));   // 管理员  
        env.put(Context.SECURITY_CREDENTIALS, Config.getProperties("ldapPassword"));  // 管理员密码  
           
        try {  
            ctx = new InitialLdapContext(env, connCtls);  
            System.out.println( "连接成功" );   
               
        } catch (javax.naming.AuthenticationException e) {  
            System.out.println("连接失败：");  
            e.printStackTrace();  
        } catch (Exception e) {  
            System.out.println("连接出错：");  
            e.printStackTrace();  
        }  
           
    }
    
    void closeContext(){  
        if (ctx != null) {  
	        try {  
	            ctx.close();  
	        }  
	        catch (NamingException e) {  
	            e.printStackTrace();  
	        }  
        }
    }
    
    String getUserDN(String uid,String sn) {  
        String userDN = "查询语句：";

        String search = "(&(telephoneNumber=" + uid + ")(sn="+ sn +"))";
        userDN =  userDN + search + "<br>";
        try {  
            SearchControls constraints = new SearchControls();  
            constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);  
              
            NamingEnumeration<SearchResult> en = ctx.search("", search , constraints);  
              
            if (en == null || !en.hasMoreElements()) {  
                String result = userDN + "未找到该用户";
                return result;  
            }  
            // maybe more than one element  
            while (en != null && en.hasMoreElements()) {  
                Object obj = en.nextElement();  
                if (obj instanceof SearchResult) {  
                    SearchResult si = (SearchResult) obj;  
                    userDN += si.getName();
                    userDN += "," + BASEDN;
    				Attributes attrs = si.getAttributes();
                    userDN += "," + attrs.get("sn");
                } else {  
                    System.out.println(obj);  
                }  
            }  
        } catch (Exception e) {  
            String result = userDN + "查找用户时产生异常。";
               
            e.printStackTrace();
            return result;  
        }  
    
        return userDN;  
    }

}
