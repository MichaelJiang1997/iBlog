<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Enumeration<String> artId = request.getParameterNames();
    while (artId.hasMoreElements()){
        out.write(artId.nextElement());
    }


%>