<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Bean.Contact" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<%@ include file="comm/header.jsp"%>


<body>

<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>


<div class="container-fluid main-container contact" id="main-container">
    <div class="row top-title">
        <div class="col-md-12">
            <h1 class="page-title">
                给我留言
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="contact.jsp" rel="bookmark">
                    给我留言
                </a>
            </h2>
            <div class="meta-box">
            <span class="comments-link">
              <a href="contact.jsp" class="ds-thread-count" data-thread-key="750" title="Comment on 给我留言">
                  394 条评论
              </a>
            </span>
            </div>
            <div class="post-content">
                <p>
                    <a href="javascript:;">
                <p>
                    呵呵
                </p>
                <blockquote class="contact-list" id="contact-list">
                    <ul>
                        <li>
                            有朋自远方来，不亦悦乎。
                        </li>
                        <li>
                            既然来了，如果我们有共同兴趣的话，不妨留言讨论，说不定我们会成为朋友。
                        </li>
                    </ul>
                </blockquote>
                <p>
                    关于我，我想我的个人
                    <a href="about.jsp" target="_blank">
                        关于页面
                    </a>
                    已经介绍的比较详细了，如果你想联系我的话，不妨写信给我。
                </p>
                <p>
                    <a class="btn btn-sm btn-primary" href="mailto:sencom1997@outlook.com" target="_blank">
                        <i class="fa fa-qq">
                        </i>
                        QQ邮箱
                    </a>
                    <a class="btn btn-sm btn-primary" href="mailto:sencom1997@outlook.com" target="_blank">
                        <i class="fa fa-google">
                        </i>
                        Gmail邮箱
                    </a>
                </p>
                <p>
                    当然，你也可以去我的代码仓库逛一逛
                </p>
                <p>
                    <a class="btn btn-sm btn-primary"
                       href="javascript:if(confirm('https://github.com/MichaelJiang1997  \n\n'))window.location='https://github.com/MichaelJiang1997'"
                       target="_blank">
                        <i class="fa fa-weibo">
                        </i>
                        GitHub
                    </a>

                </p>
                <p>
                    或者，直接在本页留言也可以，不过不确定什么时候会看到
                </p>
            </div>
            <div class="meta-box">
            </div>
        </div>
    </div>

    <%
        // 从数据库读取最新的十六条留言显示出来

        //首先准备一个容器来张数据
        List<Contact> list = new LinkedList<>();

        Connection conn = DBUtils.getConnection();
        String sql = "select * from tb_contact order by contact_time desc limit 16";
        Statement sm = conn.createStatement();
        ResultSet res = sm.executeQuery(sql);
        while (res.next()){
            list.add(new Contact(res.getString("contact_name"),
                    res.getString("contact_title"),res.getString("contact_email"),
                    res.getString("contact_content"),res.getString("contact_time")));

        }

        for(Contact c: list){
    %>
        <div class="row">
        <div class="col-md-12 post-container">
            <div class="post-content">
                <div class="ds-thread" data-thread-key="750" data-author-key="1" data-title="给我留言"
                     data-url="contact.php">
                </div>
                <div id="ds-ssr">
                    <ol id="commentlist">
                        <li class="comment even thread-even depth-1" id="li-comment-11325">
                            <article id="comment-11325" class="comment">
                                <footer class="comment-meta">
                                    <cite class="comment-author vcard">
                      <span class="fn">
                        <a href=""
                           rel='external nofollow' class='url'>
                            <%=c.getContact_name()%>
                        </a>
                      </span>
                                        on
                                        <a rel="nofollow" href="">
                                            <time pubdate datetime="2015-01-06T00:15:56+00:00">
                                                <%=c.getContact_time()%>
                                            </time>
                                        </a>
                                        <span class="says">
                        said:
                      </span>
                                    </cite>
                                </footer>
                                <div class="comment-content">
                                    <p>
                                        <%=c.getContact_content()%>
                                    </p>
                                </div>
                            </article>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>


    <div class="row">
        <div class="col-md-12 post-container">
            <div class="post-content">
                <form action="ContactServlet" method="post"  class="contact-form">
                    <div>
          <span>
            <label>
                姓名*
            </label>
          </span>
          <span>
            <input name="contact_name" type="text" class="textbox">
          </span>
                    </div>
                    <div>
          <span>
            <label>
                标题*
            </label>
          </span>
          <span>
            <input name="contact_title" type="text" class="textbox">
          </span>
                    </div>
                    <div>
          <span>
            <label>
                邮箱*
            </label>
          </span>
          <span>
            <input name="contact_email" type="email" class="textbox">
          </span>
                    </div>
                    <div>
          <span>
            <label>
                内容*
            </label>
          </span>
          <span>
            <textarea name="contact_content" class="textbox">
            </textarea>
          </span>
                    </div>
                    <div>
          <span>
            <input type="submit" value="提交" name="submit">
          </span>
                    </div>
                </form>
            </div>
            <div class="meta-box">
            </div>
        </div>
    </div>

    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
<!-- 包含脚本-->
<%@ include file="comm/script.jsp"%>
</body>

</html>