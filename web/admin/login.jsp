<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String error = request.getParameter("error");

%>

<%
    String path = request.getContextPath() + "/";
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>iBlog-管理系统</title>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/style.css">
<link rel="stylesheet" type="text/css" href="static/css/login.css">
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
<div class="container">
  <div class="siteIcon"><img src="static/images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top"
                             title="欢迎使用iBlog博客管理系统" draggable="false" /></div>
  <%=error==null?"":error=="1"?"<button class=\"btn btn-lg btn-danger btn-block\" id=\"error\" >用户名或密码错误</button>":"<button class=\"btn btn-lg btn-danger btn-block\" id=\"error\" >验证码错误</button>"%>

  <form action="loginAction.jsp" method="post" autocomplete="off" class="form-signin">
    <h2 class="form-signin-heading">管理员登录</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="u_name" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10">
    <label for="password" class="sr-only">密码</label>
    <input type="password" id="password" name="u_psw" class="form-control" placeholder="请输入密码" required
           autocomplete="off" maxlength="18">
    <label for="code" class="sr-only">验证码</label>
    <div class="row form-inline">
        <input type="text" id="code" name="code"  class="form-control" placeholder="验证码" required="" autocomplete="off"
               maxlength="18" >
        &nbsp; <img  id="loginYZM" title="点击刷新" src="<%=path%>/CodeServlet" onclick="changeYZM()">
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录</button>
  </form>
  <div class="footer">
    <p><a href="index.jsp" data-toggle="tooltip" data-placement="left" title="不知道自己在哪?">回到后台 →</a></p>
  </div>
</div>
<script src="static/js/bootstrap.min.js"></script>
<script>
$('[data-toggle="tooltip"]').tooltip();
window.oncontextmenu = function(){
	//return false;
};
$('.siteIcon img').click(function(){
	window.location.reload();
});
$('#signinSubmit').click(function(){
	if($('#userName').val() === ''){
		$(this).text('用户名不能为空');
	}else if($('#userPwd').val() === ''){
		$(this).text('密码不能为空');
	}else{
		$(this).text('请稍后...');
	}
});


function changeYZM() {
    var yzm = document.getElementById("loginYZM");
    yzm.src= "<%=path%>/CodeServlet?num="+Math.random();
}

</script>
</body>
</html>
