<%--
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


<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>评论 - iBlog管理系统</title>
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
      <jsp:param value="comment" name="now"/>
    </jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="/Comment/checkAll" method="post">
        <h1 class="page-header">管理 <span class="badge">4</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">昵称</span></th>
                <th><span class="glyphicon glyphicon-envelope"></span> <span class="visible-lg">邮箱</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">摘要</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">内容</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            <%
              // 读取留言表数据
              Connection conn = DBUtils.getConnection();
              Statement sm = conn.createStatement();
              String sql = "select * from tb_contact order by contact_time desc";
              ResultSet res = sm.executeQuery(sql);
              while (res.next()){
            %>
                <tr>
                  <td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
                  <td class="article-title"><%=res.getString("contact_name")%></td>
                  <td class="article-title"><%=res.getString("contact_email")%></td>
                  <td class="article-title"><%=res.getString("contact_title")%></td>
                  <td class="article-title"><%=res.getString("contact_content")%></td>
                  <td><%=res.getString("contact_time")%></td>
                  <td><a rel="1" href="deleteCommentAction.jsp?id=<%=res.getString("id")%>">删除</a></td>
                </tr>
            <%
              }
              DBUtils.closeAll(conn);
            %>
            </tbody>
          </table>
        </div>

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
