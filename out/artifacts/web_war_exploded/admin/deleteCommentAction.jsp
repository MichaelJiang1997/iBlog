<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/10
  Time: 21:04
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
    String id = request.getParameter("id");

    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql = "delete from tb_contact where id ="+id;
    sm.execute(sql);

    DBUtils.closeAll(conn);

    response.sendRedirect("comment.jsp");

%>
