<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/10/14
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String now = request.getParameter("now");
%>
<%
    // 拿站点信息
    // 先判断一下是否拿过了，不要重复拿，第一次拿过后存session即可
    if(session.getAttribute("site_title") == null){
        Connection heaconn = DBUtils.getConnection();
        Statement heasm = heaconn.createStatement();
        String heasql = "select * from tb_siteinfo";
        ResultSet heares = heasm.executeQuery(heasql);
        while (heares.next()){
            session.setAttribute("site_title",heares.getString("site_title"));
            session.setAttribute("site_subtitle",heares.getString("site_subtitle"));
            session.setAttribute("site_keyword",heares.getString("site_keyword"));
            session.setAttribute("site_desc",heares.getString("site_desc"));
            session.setAttribute("site_email",heares.getString("site_email"));
            session.setAttribute("site_icp",heares.getString("site_icp"));
            break;
        }
        DBUtils.closeAll(heaconn);

    }

%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>
        <%=now.equals("index")?"首页-":now.equals("about")?"关于-":now.equals("blog")?"博客-":now.equals("works")?"作品-":now.equals("flink")?"链接-":now.equals("contact")?"联系-":""%>
        <%=session.getAttribute("site_title")%></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/nprogress.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/default.css" type="text/css" media="screen" />
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.nivo.slider.pack.js"></script>
    <script src="js/nprogress.js"></script>
</head>
