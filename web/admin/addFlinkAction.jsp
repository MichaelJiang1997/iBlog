<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/10
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
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

    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql = "insert into tb_flink values (null, \""+flink_name+"\", \""+flink_addr+"\", \""+flink_desc+"\")";
    sm.execute(sql);

    DBUtils.closeAll(conn);

    response.sendRedirect("flink.jsp");

%>
