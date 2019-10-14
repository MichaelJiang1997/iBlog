<%-- Created by IntelliJ IDEA. --%>
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
                    <a class="btn btn-sm btn-primary" href="mailto:7248478999@qq.com" target="_blank">
                        <i class="fa fa-qq">
                        </i>
                        QQ邮箱
                    </a>
                    <a class="btn btn-sm btn-primary" href="mailto:junqianhen@gmail.com" target="_blank">
                        <i class="fa fa-google">
                        </i>
                        Gmail邮箱
                    </a>
                </p>
                <p>
                    当然，如果你有新浪微博或者腾讯微博的话，也可以在上面给我留言。
                </p>
                <p>
                    <a class="btn btn-sm btn-primary" href="javascript:if(confirm('http://weibo.ybsat.com/  \n\n'))window.location='http://www.ybsat.com/'"
                       target="_blank">
                        <i class="fa fa-weibo">
                        </i>
                        新浪微博
                    </a>
                    <a class="btn btn-sm btn-primary" href="javascript:if(confirm('http://www.ybsat.com/  \n\n'))window.location='http://www.ybsat.com/'"
                       target="_blank">
                        <i class="fa fa-tencent-weibo">
                        </i>
                        腾讯微博
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
                            异步
                        </a>
                      </span>
                                        on
                                        <a rel="nofollow" href="">
                                            <time pubdate datetime="2015-01-06T00:15:56+00:00">
                                                2015 年 1 月 6 日 at am 12:15
                                            </time>
                                        </a>
                      <span class="says">
                        said:
                      </span>
                                    </cite>
                                </footer>
                                <div class="comment-content">
                                    <p>
                                        嗨~
                                    </p>
                                </div>
                            </article>
                        </li>
                        <li class="comment odd alt thread-odd thread-alt depth-1" id="li-comment-11323">
                            <article id="comment-11323" class="comment">
                                <footer class="comment-meta">
                                    <cite class="comment-author vcard">
                      <span class="fn">
                        <a href=""
                           rel='external nofollow' class='url'>
                            异步
                        </a>
                      </span>
                                        on
                                        <a rel="nofollow" href="">
                                            <time pubdate datetime="2015-01-05T17:12:39+00:00">
                                                2015 年 1 月 5 日 at pm 5:12
                                            </time>
                                        </a>
                      <span class="says">
                        said:
                      </span>
                                    </cite>
                                </footer>
                                <div class="comment-content">
                                    <p>
                                        新年快乐~
                                    </p>
                                </div>
                            </article>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <div class="post-content">
                <form method="post" action="black/lib/contact.php" id="form1" class="contact-form">
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
            <textarea name="contact_con" class="textbox">
            </textarea>
          </span>
                    </div>
                    <div>
          <span>
            <input type="submit" value="提交" name="tijiao">
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