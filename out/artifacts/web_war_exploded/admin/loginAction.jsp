<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/9/25
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String u_name = request.getParameter("u_name");
    String u_psw = request.getParameter("u_psw");
    String code = request.getParameter("code");

    // 首先验证验证码
    if(!code.equals(session.getAttribute("code"))){
        response.sendRedirect("login.jsp?error=2");
        return;
    }


    Connection conn = DBUtils.getConnection();
    String u_last_login;
    String u_last_ip;
    String u_id;

    try {
        Statement s = conn.createStatement();
        String sql = "select * from tb_user where u_name = '"+u_name+"' and u_psw = '"+u_psw+"'";
        ResultSet resultSet = s.executeQuery(sql);
        while (resultSet.next()){
            // 这里是登录成功
            // 拿上次登录时间信息和IP
            u_last_login = resultSet.getString("u_last_login");
            u_last_ip = resultSet.getString("u_last_ip");
            u_id = resultSet.getString("id");

            //设置session
            session.setAttribute("u_id",u_id);
            session.setAttribute("u_name",u_name);
            session.setAttribute("u_psw",u_psw);
            session.setAttribute("u_last_login",u_last_login);
            session.setAttribute("u_last_ip",u_last_ip);

            //更新上次登录时间和IP

            sql = "update tb_user set u_last_login=NOW(),u_last_ip= '"+request.getRemoteAddr()+"' where u_name= '" +
                    session.getAttribute("u_name")+"'";
            s.executeUpdate(sql);


            // 拿一个MySQL版本
            sql = "select @@VERSION";
            ResultSet r = s.executeQuery(sql);
            while(r.next()){
                session.setAttribute("mysql_version",r.getString(1));
            }

            // 拿一下管理员个数
            sql = "select count(*) from tb_user";
            r = s.executeQuery(sql);
            while(r.next()){
                session.setAttribute("admin_nums",r.getString(1));
            }


            // 登录成功存登录日志
            sql = "insert into tb_user_log(u_login_id,u_login_ip,u_login_time,u_login_flag)" +
                    "values ('"+ session.getAttribute("u_id") +"','"+session.getAttribute("u_last_ip")+"',NOW(),1)";
            s.execute(sql);

            // 跳到Admin
            response.sendRedirect("./");
        }

        // 登录失败存登录日志
        sql = "insert into tb_user_log(u_login_id,u_login_ip,u_login_time,u_login_flag)" +
                "values ('0','"+request.getRemoteAddr()+"',NOW(),0)";
        s.execute(sql);
        response.sendRedirect("login.jsp?error=1");

    } catch (SQLException e) {
        e.printStackTrace();
    }

    try {
        DBUtils.closeAll(conn);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>