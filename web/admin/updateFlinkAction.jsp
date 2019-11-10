<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/10
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 防止非法访问
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>

<%
    String flink_name = request.getParameter("flink_name");
    String flink_addr = request.getParameter("flink_addr");
    String flink_desc = request.getParameter("flink_desc");
    String id = request.getParameter("id");

    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql =
            "update tb_flink set flink_name='"+flink_name+"', flink_addr='"+flink_addr+"', flink_desc='"+flink_desc+"' where id = "+id;
    sm.execute(sql);

    DBUtils.closeAll(conn);

    response.sendRedirect("flink.jsp");

%>
