package at.dallermassl.ap.security.taint.webapp.sql;

import org.apache.ibatis.session.SqlSession;

public class UserDao {
	private static SqlSession session;//设置成静态就不用每次就new了
    static {
        session= SessionBean.getSession();
    }
    public static User findUserById(int id)//通过id来查找User
    {
        return session.selectOne("test.findUserById",id);
    }
    public static User findUserByName(String name)//通过id来查找User
    {
        return session.selectOne("test.findUserByName",name);
    }
    public static User findUserByTaintName(String name)//通过id来查找User
    {
        return session.selectOne("test.findUserByTaintName",name);
    }
}
