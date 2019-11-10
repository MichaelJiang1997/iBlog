<%@ page import="Bean.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>
<%
  // 拿get参数作为分页啊
  String pages = request.getParameter("pages");

  // 判断一下pages个是么得,若么得就赋为默认值 1
  if(pages == null){
    pages = "1";
  }
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章 - iBlog管理系统</title>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/style.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="static/images/icon/icon.png">
<link rel="shortcut icon" href="static/images/icon/favicon.ico">
<script src="static/js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
    <script src="static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="static/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="static/js/respond.min.js" type="text/javascript"></script>
    <script src="static/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select">
<section class="container-fluid">
  <!--通用头-->
  <%@include file="comm/header.jsp"%>

  <div class="row">
    <!--通用侧边栏-->
    <jsp:include page="comm/sidebar.jsp">
      <jsp:param value="article" name="now"/>
    </jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="articleCheckAllAction.jsp" method="post" >
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="addArticle.jsp">增加文章</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge">7</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">栏目</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">标签</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            <%

              // 把文章按页卷出来 一页就8条文章吧！

              List<Article> aList = new LinkedList<>();

              // 建立数据库连接
              Connection conn = DBUtils.getConnection();
              Statement sm = conn.createStatement();

              // 统计文章总数做分页
              int totalPage = 0;
              String sqlCont = "select count(*) as cnt from tb_article";
              ResultSet conRes = sm.executeQuery(sqlCont);
              while (conRes.next()){
                totalPage = conRes.getInt("cnt");
              }

              // 数据库拿文章
              int p = Integer.parseInt(pages);
              String sql = "select * from tb_article order by art_time desc limit "+(p-1)*8+",8";
              ResultSet res = sm.executeQuery(sql);
              while (res.next()){
                aList.add(new Article(res.getString("art_id"),res.getString("art_title"),
                        res.getString("art_class"),res.getString("art_tag"),res.getString("art_content"),
                        res.getString("art_time"),res.getString("art_count"),res.getString("art_visible")));
              }

              // 拿标签和归类名哎
              for(Article a: aList){
                String sqlClass = "select class_name from tb_art_class where class_id="+a.getArt_class();
                ResultSet classRes = sm.executeQuery(sqlClass);
                String className="";
                while(classRes.next()) {
                  className = classRes.getString("class_name");
                }
                a.setArt_class(className);

                String sqlTag = "select tag_name from tb_art_tag where tag_id="+a.getArt_tag();
                ResultSet tagRes = sm.executeQuery(sqlTag);
                String tagName="";
                while(tagRes.next()) {
                  tagName = tagRes.getString("tag_name");
                }
                a.setArt_tag(tagName);
              }

              DBUtils.closeAll(conn);
            %>
            <%

              for(Article a : aList){
            %>
              <tr>
                <td><input type="checkbox" class="input-control" name="<%=a.getArt_id()%>" value="" /></td>
                <td class="article-title"><%=a.getArt_title()%></td>
                <td><%=a.getArt_class()%></td>
                <td class="hidden-sm"><%=a.getArt_tag()%></td>
                <td class="hidden-sm">NULL</td>
                <td><%=a.getArt_time()%></td>
                <td><a href="update-article.html">修改</a> <a rel="6">删除</a></td>
              </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>

            <ul class="pagination pagenav">
              <%
                for (int i = 0; i < totalPage / 3; i++){
              %>
              <!--分页-->
              <div class="row post-pagination">
                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                  <div class="btn-group" role="group" aria-label="First group">
                    <%
                      if(Integer.parseInt(pages) == 1){// 是第一页则不能往前面翻了

                    %>

                    <button type="button" class="btn btn-danger"
                    >已翻到头了</button>

                    <%
                    }else{
                    %>
                    <button type="button" class="btn btn-warning"
                    ><a href="article.jsp?pages=<%=String.valueOf(Integer.parseInt(pages)-1)%>">前一页
                    </a></button>
                    <%
                      }
                    %>
                  </div>
                  <div class="btn-group" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-success" ><%=pages%></button>
                  </div>
                  <div class="btn-group" role="group" aria-label="Third group">

                    <%
                      if(Integer.parseInt(pages) * 3  >= totalPage){// 是最后一页则不能往后翻了

                    %>

                    <button type="button" class="btn btn-danger"
                    >已翻到底了</button>

                    <%
                    }else{
                    %>
                    <button type="button" class="btn btn-warning"
                    ><a href="article.jsp?pages=<%=String.valueOf(Integer.parseInt(pages)+1)%>">后一页
                    </a></button>
                    <%
                      }
                    %>


                  </div>
                </div>
              </div>

              <%
                }
              %></ul>
          </nav>
        </footer>
      </form>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<%@ include file="comm/seeUserInfo.jsp"%>

<!--个人登录记录模态框-->
<%@ include file="comm/seeUserLoginlog.jsp"%>

<!--微信二维码模态框-->
<%@ include file="comm/WeChat.jsp"%>

<!--提示模态框-->
<%@ include file="comm/areDeveloping.jsp"%>


<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/admin-scripts.js"></script>

</body>
</html>
