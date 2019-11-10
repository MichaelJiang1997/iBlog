<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 防止非法访问
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>

<%
    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql;
    String className = request.getParameter("class_name");
    String tagName = request.getParameter("tag_name");
    if(className != null){
        sql = "insert into tb_art_class(class_name) values ('"+className+"' )";
        sm.execute(sql);
    }
    if(tagName != null){
        sql = "insert into tb_art_tag(tag_name) values ('"+tagName+"' )";
        sm.execute(sql);
    }
    response.sendRedirect("category.jsp");

%>