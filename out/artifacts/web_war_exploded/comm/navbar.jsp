<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // 拿站点信息
    // 先判断一下是否拿过了，不要重复拿，第一次拿过后存session即可
    if(session.getAttribute("site_title") == null){
        Connection navconn = DBUtils.getConnection();
        Statement navsm = navconn.createStatement();
        String navsql = "select * from tb_siteinfo";
        ResultSet navres = navsm.executeQuery(navsql);
        while (navres.next()){
            session.setAttribute("site_title",navres.getString("site_title"));
            session.setAttribute("site_subtitle",navres.getString("site_subtitle"));
            session.setAttribute("site_keyword",navres.getString("site_keyword"));
            session.setAttribute("site_desc",navres.getString("site_desc"));
            session.setAttribute("site_email",navres.getString("site_email"));
            session.setAttribute("site_icp",navres.getString("site_icp"));
            break;
        }
        DBUtils.closeAll(navconn);

    }

%>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">
              Toggle navigation
            </span>
                <span class="icon-bar">
            </span>
                <span class="icon-bar">
            </span>
                <span class="icon-bar">
            </span>
            </button>
            <a class="navbar-brand" href="index.jsp"><%=session.getAttribute("site_title")%></a>
        </div>
        <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav header-menu">
                <li>
                    <a href="index.jsp">
                        首页
                    </a>
                </li>
                <li>
                    <a href="about.jsp">
                        关于
                    </a>
                </li>
                <li>
                    <a href="blog.jsp">
                        博客
                    </a>
                </li>
                <li>
                    <a href="links.jsp">
                        链接
                    </a>
                </li>
                <li>
                    <a href="contact.jsp">
                        联系
                    </a>
                </li>
                <li>
                    <a href="admin/">
                        后台
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>