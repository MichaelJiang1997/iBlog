<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
<title>栏目 - iBlog管理系统</title>
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
      <jsp:param value="category" name="now"/>
    </jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <div class="col-md-5">
          <h1 class="page-header">添加</h1>
          <form action="addCategoryTagAction.jsp" method="post" autocomplete="off">
            <div class="form-group">
              <label for="category-name">栏目名称</label>
              <input type="text" id="category-name" name="class_name" class="form-control" placeholder="在此处输入栏目名称"
                     required autocomplete="off">
              <span class="prompt-text">这将是它在站点上显示的名字。</span> </div>
            <div class="form-group">
              <label for="category-alias">栏目别名</label>
              <input type="text" id="category-alias" name="alias" class="form-control" placeholder="在此处输入栏目别名" required autocomplete="off">
              <span class="prompt-text">“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。{无效}</span> </div>
          <button class="btn btn-primary" type="submit" name="submit">添加新栏目</button>
          </form>
          <hr />
          <form action="addCategoryTagAction.jsp" method="post" autocomplete="off">
            <div class="form-group">
              <label for="category-keywords">标签</label>
              <input type="text" id="category-keywords" name="tag_name" class="form-control" placeholder="在此处输入标签"
                     autocomplete="off">
              <span class="prompt-text">在编写文章时可以选则标签</span> </div>
            <button class="btn btn-primary" type="submit" name="submit">添加新标签</button>
          </form>
        </div>
        <div class="col-md-7">
          <h1 class="page-header">管理 <span class="badge">3</span></h1>
          <h3>栏目</h3>
          <div class="table-responsive">
            <table class="table table-striped table-hover">
              <thead>
                <tr>
                  <th><span class="glyphicon glyphicon-paperclip"></span> <span class="visible-lg">ID</span></th>
                  <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">名称</span></th>
                  <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                </tr>
              </thead>
              <tbody>
              <%
                // 获取 分类 表
                Connection conn = DBUtils.getConnection();
                Statement sm = conn.createStatement();
                String sql = "select * from tb_art_class";

                ResultSet res = sm.executeQuery(sql);
                while (res.next()){
              %>
                <tr>
                  <td><%=res.getString("class_id")%></td>
                  <td><%=res.getString("class_name")%></td>
                  <td><a href="updateCategoryTag.jsp?class_id=<%=res.getString("class_id")%>">修改</a> <a
                          href="deleteTagCategoryAction.jsp?class_id=<%=res.getString("class_id")%>">删除</a></td>
                </tr>
              <%
                }
              %>
              </tbody>
            </table>
            <span class="prompt-text"><strong>注：</strong>删除一个栏目也会删除栏目下的文章和子栏目,请谨慎删除!</span> </div>
        </div>
        <div class="col-md-7">
          <h3>标签</h3>
          <div class="table-responsive">
            <table class="table table-striped table-hover">
              <thead>
              <tr>
                <th><span class="glyphicon glyphicon-paperclip"></span> <span class="visible-lg">ID</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">名称</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
              </thead>
              <tbody>
              <%
                // 获取 分类 表
                conn = DBUtils.getConnection();
                sm = conn.createStatement();
                sql = "select * from tb_art_tag";

                res = sm.executeQuery(sql);
                while (res.next()){
              %>
              <tr>
                <td><%=res.getString("tag_id")%></td>
                <td><%=res.getString("tag_name")%></td>
                <td><a href="updateCategoryTag.jsp?tag_id=<%=res.getString("tag_id")%>">修改</a> <a
                        href="deleteTagCategoryAction.jsp?tag_id=<%=res.getString("tag_id")%>">删除</a></td>
              </tr>
              <%
                }
              %>
              </tbody>
            </table>
            <span class="prompt-text"><strong>注：</strong>删除一个栏目也会删除栏目下的文章和子栏目,请谨慎删除!</span> </div>
        </div>
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
<script>
//是否确认删除
$(function(){   
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		if (event.srcElement.outerText === "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/Category/delete",
					data: "id=" + id,
					cache: false, //不缓存此页面   
					success: function (data) {
						window.location.reload();
					}
				});
			};
		};
	});   
});
</script>
</body>
</html>
