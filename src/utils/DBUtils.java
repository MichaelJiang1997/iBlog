package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    static Connection con;
    static public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            //con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sencq_java?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false", "root", "123456");
            con = DriverManager.getConnection("jdbc:mysql://sencom.top:3306/iblog?useUnicode=true&characterEncoding" +
                    "=utf-8&serverTimezone=GMT%2B8&useSSL=false", "anyone", "123456");
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    static public void closeAll(Connection conn) throws SQLException {
        conn.close();
    }
}