<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 防止非法访问
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>

<%
    String classId = request.getParameter("class_id");
    String tagId = request.getParameter("tag_id");
    String tagName = request.getParameter("tag_name");
    String className = request.getParameter("class_name");

    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql;

    if(classId != null){
        sql = "update tb_art_class set class_name='"+className+"' where class_id = " + classId;
        sm.execute(sql);
    }

    if(tagId != null){
        sql = "update tb_art_tag set tag_name='"+tagName+"' where tag_id = " + tagId;
        sm.execute(sql);
    }


    response.sendRedirect("category.jsp");



%>
