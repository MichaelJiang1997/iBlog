<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/13
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.Article" %>
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
<title>文章修改 - iBlog管理系统</title>
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

<%
  Article now = null;
  List<Article> aList = (List)session.getAttribute("aList");
  for (Article a:aList){
    if(a.getArt_id().equals(request.getParameter("aid"))){
        now = a;
    }
  }


%>


<body class="user-select">
<!--通用头-->
<%@include file="comm/header.jsp"%>

<div class="row">
  <!--通用侧边栏-->
  <jsp:include page="comm/sidebar.jsp">
    <jsp:param value="article" name="now"/>
  </jsp:include>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <form action="updateArticleAction.jsp?aid=<%=now.getArt_id()%>" method="post" class="add-article-form">
          <div class="col-md-9">
            <h1 class="page-header">文章修改</h1>
            <div class="form-group">
              <label for="article-title" class="sr-only">标题</label>
              <input type="text" id="article-title" name="title" class="form-control" placeholder="在此处输入标题"
                     value="<%=now.getArt_title()%>"
                     required autofocus autocomplete="off">
            </div>
            <div class="form-group">
              <label for="article-content" class="sr-only">内容</label>
              <script id="article-content" name="content" type="text/plain"><%=now.getArt_content()%></script>
            </div>

          </div>
          <div class="col-md-3">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>栏目</span></h2>
              <div class="add-article-box-content">
                <ul class="category-list">
                  <%
                    // 获取 分类 表
                    Connection conn = DBUtils.getConnection();
                    Statement sm = conn.createStatement();
                    String sql = "select * from tb_art_class";

                    ResultSet res = sm.executeQuery(sql);
                    while (res.next()){
                  %>
                  <li>
                    <label>
                      <input name="class_id" type="radio"  value="<%=res.getString("class_id")%> " checked>
                      <%=res.getString("class_name")%></label>
                  </li>
                  <%
                    }
                  %>
                </ul>
              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>标签</span></h2>
              <div class="add-article-box-content">
                <%
                  // 获取 标签 表
                  conn = DBUtils.getConnection();
                  sm = conn.createStatement();
                  sql = "select * from tb_art_tag";

                  res = sm.executeQuery(sql);
                  while (res.next()){
                %>
                <li>
                  <label>
                    <input name="tag_id" type="radio" value="<%=res.getString("tag_id")%>" checked>
                    <%=res.getString("tag_name")%></label>
                </li>
                <%
                  }
                %>
              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>标题图片</span></h2>
              <div class="add-article-box-content">
                <input type="text" class="form-control" placeholder="点击按钮选择图片" id="pictureUpload" name="titlepic" autocomplete="off">
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-default" type="button" ID="upImage">选择</button>
              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>发布</span></h2>
              <div class="add-article-box-content">
                <p><label>状态：</label><span class="article-status-display">未发布</span></p>
                <p><label>公开度：</label><input type="radio" name="visibility" value="1" checked/>公开 <input type="radio"
                                                                                                         name="visibility" value="0" />加密</p>
                <p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime"
                                                                                name="time" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" /></span></p>
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">修改</button>
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
<script src="static/lib/ueditor/ueditor.config.js"></script>
<script src="static/lib/ueditor/ueditor.all.min.js"> </script>
<script src="static/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<script id="uploadEditor" type="text/plain" style="display:none;"></script>
<script type="text/javascript">
var editor = UE.getEditor('article-content');
window.onresize=function(){
    window.location.reload();
}
var _uploadEditor;
$(function () {
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    _uploadEditor = UE.getEditor('uploadEditor');
    _uploadEditor.ready(function () {
        //设置编辑器不可用
        //_uploadEditor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _uploadEditor.hide();
        //侦听图片上传
        _uploadEditor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input,只去第一张图片的路径
            $("#pictureUpload").attr("value", arg[0].src);
            //图片预览
            //$("#imgPreview").attr("src", arg[0].src);
        })
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _uploadEditor.addListener('afterUpfile', function (t, arg) {
            $("#fileUpload").attr("value", _uploadEditor.options.filePath + arg[0].url);
        })
    });
});
//弹出图片上传的对话框
$('#upImage').click(function () {
    var myImage = _uploadEditor.getDialog("insertimage");
    myImage.open();
});
//弹出文件上传的对话框
function upFiles() {
    var myFiles = _uploadEditor.getDialog("attachment");
    myFiles.open();
}
</script>
</body>
</html>