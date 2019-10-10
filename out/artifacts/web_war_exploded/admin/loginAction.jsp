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


    Connection conn = DBUtils.getConnection();
    String u_last_login;

    try {
        Statement s = conn.createStatement();
        String sql = "select * from tb_user where u_name = '"+u_name+"' and u_psw = '"+u_psw+"'";
        ResultSet resultSet = s.executeQuery(sql);
        while (resultSet.next()){
            // 拿上次登录时间信息
            u_last_login = resultSet.getString("u_last_login");

            //设置session
            session.setAttribute("u_name",u_name);
            session.setAttribute("u_psw",u_psw);
            session.setAttribute("u_last_login",u_last_login);

            // 跳到Admin
            response.sendRedirect("./");
        }




    } catch (SQLException e) {
        e.printStackTrace();
    }

    try {
        DBUtils.closeAll(conn);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>