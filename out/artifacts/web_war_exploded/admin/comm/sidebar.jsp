<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String now = request.getParameter("now");
%>
<aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
    <ul class="nav nav-sidebar">
        <li <%=now.equals("index")?"class=\"active\"":""%>><a href="index.jsp">报告</a></li>
    </ul>
    <ul class="nav nav-sidebar">
        <li <%=now.equals("article")?"class=\"active\"":""%>><a href="article.jsp">文章</a></li>
        <li <%=now.equals("notice")?"class=\"active\"":""%>><a href="notice.jsp">公告</a></li>
        <li <%=now.equals("comment")?"class=\"active\"":""%>><a href="comment.jsp">评论</a></li>
        <li <%=now.equals("xxx")?"class=\"active\"":""%>><a data-toggle="tooltip" data-placement="bottom"
                                                          title="网站暂无留言功能">留言</a></li>
    </ul>
    <ul class="nav nav-sidebar">
        <li <%=now.equals("category")?"class=\"active\"":""%>><a href="category.jsp">栏目</a></li>
        <li <%=now.equals("flink")?"class=\"active\"":""%>><a href="flink.jsp">友情链接</a></li>

        </li>
    </ul>
    <ul class="nav nav-sidebar">
        <li <%=now.equals("manageUser") || now.equals("loginlog")?"class=\"active\"":""%>><a class="dropdown-toggle"
                                                                                             id="userMenu"
                                                                     data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">用户</a>
            <ul class="dropdown-menu" aria-labelledby="userMenu">
                <li><a data-toggle="modal" data-target="#areDeveloping">管理用户组</a></li>
                <li><a href="manageUser.jsp">管理用户</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="loginlog.jsp">管理登录日志</a></li>
            </ul>
        </li>
        <li <%=now.equals("setting") || now.equals("readset")?"class=\"active\"":""%>><a class="dropdown-toggle" id="settingMenu"
                                                                 data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">设置</a>
            <ul class="dropdown-menu" aria-labelledby="settingMenu">
                <li><a href="setting.jsp">基本设置</a></li>
                <li><a href="readset.jsp">阅读设置</a></li>
                <li role="separator" class="divider"></li>
                <li><a data-toggle="modal" data-target="#areDeveloping">安全配置</a></li>
                <li role="separator" class="divider"></li>
                <li class="disabled"><a>扩展菜单</a></li>
            </ul>
        </li>
    </ul>
</aside>
