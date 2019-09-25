<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/9/25
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>iBlog-admin</title>
</head>
<body>
<%

    if(session.getAttribute("u_name") == null){
        response.sendRedirect("login.jsp");
    }else{
        out.write((String)session.getAttribute("u_last_login"));
    }


%>
</body>
</html>
