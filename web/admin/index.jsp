<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.SimpleFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="zh-CN">
<%@ include file="comm/header.jsp"%>
<%
  if(session.getAttribute("u_name") == null){
    response.sendRedirect("login.jsp");
  }else{
%>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">YlsatCMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="">消息 <span class="badge">1</span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                                     aria-haspopup="true" aria-expanded="false"><%=(String)session.getAttribute("u_name")%> <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a href="logout-old.jsp" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a href="index.jsp">报告</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="article.html">文章</a></li>
        <li><a href="notice.html">公告</a></li>
        <li><a href="comment.html">评论</a></li>
        <li><a data-toggle="tooltip" data-placement="bottom" title="网站暂无留言功能">留言</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="category.html">栏目</a></li>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
          <ul class="dropdown-menu" aria-labelledby="otherMenu">
            <li><a href="flink.html">友情链接</a></li>
            <li><a data-toggle="modal" data-target="#areDeveloping">访问记录</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a data-toggle="modal" data-target="#areDeveloping">管理用户组</a></li>
            <li><a href="manage-user.html">管理用户</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="loginlog.html">管理登录日志</a></li>
          </ul>
        </li>
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="setting.html">基本设置</a></li>
            <li><a href="readset.html">阅读设置</a></li>
            <li role="separator" class="divider"></li>
            <li><a data-toggle="modal" data-target="#areDeveloping">安全配置</a></li>
            <li role="separator" class="divider"></li>
            <li class="disabled"><a>扩展菜单</a></li>
          </ul>
        </li>
      </ul>
    </aside>
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
            <td><%=request.getHeader("User-Agent").split(" ")[0]%></td>
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
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
            <tr> </tr>
            </thead>
            <tbody>
            <tr>
              <td wdith="20%">姓名:</td>
              <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
            </tr>
            <tr>
              <td wdith="20%">用户名:</td>
              <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
            </tr>
            <tr>
              <td wdith="20%">电话:</td>
              <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
            </tr>
            <tr>
              <td wdith="20%">旧密码:</td>
              <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
            </tr>
            <tr>
              <td wdith="20%">新密码:</td>
              <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
            </tr>
            <tr>
              <td wdith="20%">确认密码:</td>
              <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
            </tr>
            </tbody>
            <tfoot>
            <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
          <tr>
            <th>登录IP</th>
            <th>登录时间</th>
            <th>状态</th>
          </tr>
          </thead>
          <tbody>
          <%
          // 当前用户的查登录日志
            Connection conn = DBUtils.getConnection();
            Statement s = conn.createStatement();
            String sql =
                    "select * from tb_user_log where u_login_id="+session.getAttribute("u_id")+" order by id desc limit 10";
            ResultSet r = s.executeQuery(sql);
            while (r.next()){

          %>
            <tr>
              <td><%=r.getString("u_login_ip")%></td>
              <td><%=r.getString("u_login_time")%></td>
              <td><%=r.getString("u_login_flag").equals("1")?"成功":"失败"%></td>
            </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="static/images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="static/images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/admin-scripts.js"></script>
</body>
<%
  }
%>

</html>
