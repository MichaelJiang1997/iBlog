<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/10/16
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pages = request.getParameter("pages");
    if(Integer.parseInt(pages) > 0)
        response.sendRedirect("blog.jsp"+"?pages="+pages);
    response.sendRedirect("blog.jsp");
%>