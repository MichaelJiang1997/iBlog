<%@ page import="java.util.List" %>
<%@ page import="Bean.Article" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 拿get参数作为分页啊
    String aid = request.getParameter("aid");

    // 判断一下pages个是么得,若么得就赋为默认值 1
    if(aid == null){
        aid = "1";
    }

    List<Article> aList = new LinkedList<>();

    //数据库拿文章
    Connection conn = DBUtils.getConnection();
    Statement sm = conn.createStatement();

    String sql = "select * from tb_article where art_id="+aid;
    ResultSet res = sm.executeQuery(sql);
    Article a = null;
    while (res.next()){
        a = new Article(res.getString("art_id"),res.getString("art_title"),
                res.getString("art_class"),res.getString("art_tag"),res.getString("art_content"),
                res.getString("art_time"),res.getString("art_count"),res.getString("art_visible"));
    }
    DBUtils.closeAll(conn);
%>
<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title><%=a.getArt_title()%>-
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



<body>

<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>


<div class="container-fluid main-container" id="main-container">
    <div class="row top-title">
        <div class="col-md-12">
            <h1 class="page-title right">
                <a href="blog.jsp">博客</a> >> <a href="#"><%=a.getArt_title()%></a>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="#" >
                    <%=a.getArt_title()%>
                </a>
            </h2>
            <div class="meta-box">
            </div>
            <div class="post-content">

                <section>
                    <div class="main-container">
                        <div class="row">
                            <%=a.getArt_content()%>
                        </div>
                    </div>
                </section>
                <div class="meta-box">
                </div>
            </div>
        </div>
    </div>
    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
</body>

</html>