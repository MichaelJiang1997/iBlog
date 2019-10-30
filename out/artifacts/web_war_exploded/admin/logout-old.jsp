<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/9/25
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
session.invalidate();
out.write("登出成功！");
response.sendRedirect("../");
%>
