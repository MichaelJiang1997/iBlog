<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/10
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>

<%
    // 防止非法访问
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>

<%
    String site_title = request.getParameter("site_title");
    String site_subtitle = request.getParameter("site_subtitle");
    String site_keyword = request.getParameter("site_keyword");
    String site_desc = request.getParameter("site_desc");
    String site_email = request.getParameter("site_email");
    String site_icp = request.getParameter("site_icp");

    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();
    String sql =
            "update tb_siteinfo set site_title='"+site_title+"',site_keyword='"+site_keyword+"', site_subtitle='"+site_subtitle+"', site_desc='"+site_desc+"', site_email='"+site_email+"',   site_icp='"+site_icp+"' where 1";
    sm.execute(sql);

    DBUtils.closeAll(conn);

    response.sendRedirect("setting.jsp");

%>
