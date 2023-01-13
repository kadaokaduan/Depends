package at.dallermassl.ap.security.taint.webapp.custom;

import org.owasp.esapi.ESAPI;
import org.owasp.esapi.codecs.MySQLCodec;

import at.dallermassl.ap.security.taint.webapp.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "PayDemo")
public class PayDemo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rset = null;

    public PayDemo(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(Config.getProperties("sqlUrl"), Config.getProperties("sqlUsername"), Config.getProperties("sqlPassword"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String money = request.getParameter("money");
        String stamps = request.getParameter("stamps");

        boolean payStatus = false;
        boolean reChargeStatus = false;

        if(checkMoney(money)){
            payStatus = payExec(money);
        }

        if(payStatus){
            reChargeStatus = reChargeExec(stamps);
        }

        if(reChargeStatus){
            response.getWriter().println("充值成功!跳转中...");
        } else {
            response.getWriter().println("充值失败。跳转中...");
        }

        response.sendRedirect(request.getContextPath() + "/vulns/custom-rule/sink.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        boolean setUserNameStatus = false;
        setUserNameStatus = setUserName(name);
        if(setUserNameStatus){
            response.getWriter().println("修改用户名成功!跳转中...");
        } else {
            response.getWriter().println("修改用户名失败。跳转中...");
        }
        response.sendRedirect(request.getContextPath() + "/vulns/custom-rule/source.jsp");
    }

    public boolean checkMoney(String money){
        return true;
    }

    public boolean payExec(String money){
        String balance = getMoney();
        String newBalance = "" + (Double.parseDouble(balance) - Double.parseDouble(money));

        try {
            String sql = "update account set bank_balance = ? where id = 1";
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setString(1, newBalance);
            int result =preStmt.executeUpdate();// 返回值代表收到影响的行数
            if(result>0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean reChargeExec(String stamps){
        String stampsBalance = getStamps();
        String newStampsBalance = "" + (Double.parseDouble(stampsBalance) + Double.parseDouble(stamps));

        try {
            String sql = "update account set account_balance = ? where id = 1";
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setString(1, newStampsBalance);
            int result =preStmt.executeUpdate();// 返回值代表收到影响的行数
            if(result>0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public String getUserName(){
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery ("SELECT user_name FROM account WHERE id = 1");
            StringBuffer sb = new StringBuffer();
            if (!rset.next()) {
                sb.append("<P> No matching rows.<P>\n");
            } else {
                do {
                    sb.append(rset.getString(1) + "\n");
                } while (rset.next());
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "无名";
    }

    public boolean setUserName(String name){
        MySQLCodec mysqlCodec = new MySQLCodec(MySQLCodec.Mode.ANSI);
        String encodeName = ESAPI.encoder().encodeForSQL(mysqlCodec,name);
        try {
            String sql = "update account set user_name = ? where id = 1";
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setString(1, encodeName);
            int result =preStmt.executeUpdate();// 返回值代表收到影响的行数
            if(result>0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public String getMoney(){
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery ("SELECT bank_balance FROM account WHERE id = 1");
            StringBuffer sb = new StringBuffer();
            if (!rset.next()) {
                sb.append("<P> No matching rows.<P>\n");
            } else {
                do {
                    sb.append(rset.getString(1) + "\n");
                } while (rset.next());
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0.00";
    }

    public String getStamps(){
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery ("SELECT account_balance FROM account WHERE id = 1");
            StringBuffer sb = new StringBuffer();
            if (!rset.next()) {
                sb.append("<P> No matching rows.<P>\n");
            } else {
                do {
                    sb.append(rset.getString(1) + "\n");
                } while (rset.next());
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "0.00";
    }


}
