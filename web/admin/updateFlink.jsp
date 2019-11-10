<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/10
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // 防止非法访问
  request.setCharacterEncoding("UTF-8");
  if(session.getAttribute("u_name") == null) response.sendRedirect("login.jsp");
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改友情链接 - iBlog管理系统</title>
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
      <jsp:param value="flink" name="now"/>
    </jsp:include>

    <%
      String id = request.getParameter("id");

      // 拿要修改的数据
      Connection conn = DBUtils.getConnection();
      Statement sm = conn.createStatement();
      String sql = "select * from tb_flink where id = "+id;
      ResultSet res = sm.executeQuery(sql);

      String flink_name="",flink_addr="",flink_desc="";

      while (res.next()){
        flink_name = res.getString("flink_name");
        flink_addr = res.getString("flink_addr");
        flink_desc = res.getString("flink_desc");
      }


    %>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <form action="updateFlinkAction.jsp?id=<%=id%>" method="post" class="add-flink-form" autocomplete="off"
              draggable="false">
          <div class="col-md-9">
            <h1 class="page-header">修改友情链接</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>名称</span></h2>
              <div class="add-article-box-content">
                <input type="text" id="flink-name" name="flink_name" class="form-control"
                       value="<%=flink_name%>" required autofocus autocomplete="off">
                <span class="prompt-text">例如：xx技术博客</span> </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>WEB地址</span></h2>
              <div class="add-article-box-content">
                <input type="text" id="flink-url" name="flink_addr" class="form-control"
                       value="<%=flink_addr%>" required autocomplete="off">
                <span class="prompt-text">例子：<code>http://www.abc.com/</code>——不要忘了
                                    <code>http://</code></span> </div>
            </div>

            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>描述</span></h2>
              <div class="add-article-box-content">
                <textarea class="form-control" name="flink_desc"  autocomplete="off"><%=flink_desc%></textarea>
                <span class="prompt-text">描述内容</span> </div>
            </div>
          </div>
          <div class="col-md-3">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>保存</span></h2>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">提交修改</button>
              </div>
            </div>
          </div>
        </form>
      </div>
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
