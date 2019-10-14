<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>iBlog</title>
    <meta charset="UTF-8" />
  </head>
  <body>
  <%@ include file="comm/navbar.jsp"%>
  iBlog 主界面,<%= session.getAttribute("u_name") == null?"还没登录?":"欢迎回来"+session.getAttribute("u_name")%>
  <a href="admin/index.jsp">后台管理</a>
  <a href="admin/logout.jsp">登出</a>
  <%@ include file="comm/footer.jsp"%>
  </body>
</html>