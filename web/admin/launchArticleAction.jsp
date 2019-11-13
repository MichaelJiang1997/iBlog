<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>
<%
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String class_id = request.getParameter("class_id");
    String tag_id = request.getParameter("tag_id");
    String visibility = request.getParameter("visibility");
    String time = request.getParameter("time");


    Connection conn = DBUtils.getConnection();
    String sql = "insert into tb_article values(null,?,?,?,?,?,?,?)";
    PreparedStatement psm = conn.prepareStatement(sql);
    psm.setString(1,title);
    psm.setInt(2,Integer.parseInt(class_id));
    psm.setInt(3,Integer.parseInt(tag_id));
    psm.setString(4,content);
    psm.setString(5,time);
    psm.setInt(6,0);
    psm.setInt(7,Integer.parseInt(visibility));

    psm.execute();

    response.sendRedirect("article.jsp");


%>
