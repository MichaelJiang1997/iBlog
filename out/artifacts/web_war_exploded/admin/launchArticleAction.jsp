<%--
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
    out.write(request.getParameter("title"));
    out.write("<br />");
    out.write(request.getParameter("content"));
    out.write("<br />");
    out.write(request.getParameter("class_id"));
    out.write("<br />");
    out.write(request.getParameter("tag_id"));
    out.write("<br />");
    out.write(request.getParameter("visibility"));
    out.write("<br />");
    out.write(request.getParameter("time"));
    out.write("<br />");


%>
