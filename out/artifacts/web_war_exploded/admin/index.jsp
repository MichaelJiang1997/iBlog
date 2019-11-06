<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.SimpleFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  if(session.getAttribute("u_name") == null)
    response.sendRedirect("login.jsp");

%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>iBlog管理系统</title>
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
      <jsp:param value="index" name="now"/>
    </jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <h1 class="page-header">信息总览</h1>
      <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>文章</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>评论</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>友链</h4>
          <span class="text-muted">0 条</span> </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h4>访问量</h4>
          <span class="text-muted">0</span> </div>
      </div>
      <h1 class="page-header">状态</h1>
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <tbody>
          <tr>
            <td>登录者: <span><%=(String)session.getAttribute("u_name")%></span>，欢迎回来！</td>
          </tr>
          <tr>
            <td>上次登录时间: <%=(String)session.getAttribute("u_last_login")%>,
              上次登录IP:<%=(String)session.getAttribute("u_last_ip")%></td>
          </tr>
          </tbody>
        </table>
      </div>
      <h1 class="page-header">系统信息</h1>
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <thead>
          <tr> </tr>
          </thead>
          <tbody>
          <tr>
            <td>管理员个数:</td>
            <td><%=session.getAttribute("admin_nums")%>人</td>
            <td>服务器软件:</td>
            <td><%=application.getServerInfo()%></td>
          </tr>
          <tr>
            <td>浏览器:</td>
            <td><%=request.getHeader("User-Agent").split(" ")[request.getHeader("User-Agent").split(" ").length - 1]%></td>
            <td>JVM版本:</td>
            <td><%=System.getProperty("java.vm.version")%></td>
          </tr>
          <tr>
            <td>操作系统:</td>
            <td><%=System.getProperty("os.name")%></td>
            <td>Java版本:</td>
            <td><%=System.getProperty("java.version")%></td>
          </tr>
          <tr>
            <td>登录者IP:</td>
            <td><%=request.getRemoteAddr()%></td>
            <td>MYSQL版本:</td>
            <td><%=session.getAttribute("mysql_version")%></td>
          </tr>
          <tr>
            <td>程序版本:</td>
            <td class="version">iBlogCMS 1.0 <font size="-6" color="#BBB">(201910010000)</font></td>
            <td>上传文件:</td>
            <td>可以 <font size="-6" color="#BBB">(最大文件：2M ，表单：8M )</font></td>
          </tr>
          <tr>
            <td>程序编码:</td>
            <td><%=response.getCharacterEncoding()%></td>
            <td>当前时间:</td>
            <td><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%></td>
          </tr>
          </tbody>
          <tfoot>
          <tr></tr>
          </tfoot>
        </table>
      </div>
      <footer>
        <h1 class="page-header">程序信息</h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <tbody>
            <tr>
              <td><span style="display:inline-block; width:8em">版权所有</span> POWERED BY SENCOM ALL RIGHTS RESERVED</td>
            </tr>

            </tbody>
          </table>
        </div>
      </footer>
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
