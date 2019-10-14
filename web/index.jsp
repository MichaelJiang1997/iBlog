<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<%@ include file="comm/header.jsp"%>


<body>

<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>


<!--主要内容 -->
    <div class="container-fluid main-container" id="main-container">
        <div class="row top-title">
            <div class="col-md-12">
                <h1 class="page-title">
                    最新文章
                </h1>
            </div>
        </div>
    <!--main Start-->
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="content.jsp" title="">异步测试文章</a>
            </h2>
            <div class="meta-box">
            <span class="m-post-date">
              <i class="fa fa-calendar-o">
              </i>
              2015年6月3日
            </span>
            <span class="comments-link">
              <a href="" class="ds-thread-count" data-thread-key="9500" title="Comment on 毕业两周年">
                  <i class="fa fa-comments-o">
                  </i>
                  留言
              </a>
            </span>
            </div>
            <div class="post-content">
                <p>
                    如果您在使用中遇到什么麻烦的事情,那么baby千万不要捶胸顿足,在友情链接界面您会看到作者的博客链接，您可以通过访问作者的博客留言联系我
                    <a href="http://www.ybsat.com">
                        联系我
                    </a>
                    </p>
            </div>
            <div class="meta-box">
            <span class="cat-links">
              <i class="fa fa-navicon">
              </i>
              <b>
                  分类:
              </b>
              <a href="topics/life/diary.htm">
                  测试
              </a>
            </span>
            <span class="tag-links">
              <i class="fa fa-tags">
              </i>
              <b>
                  标签:
              </b>
              <a href="tags/毕业.htm" rel="tag">
                  异步
              </a>
            </span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="content.jsp" title="">异步测试文章</a>
            </h2>
            <div class="meta-box">
            <span class="m-post-date">
              <i class="fa fa-calendar-o">
              </i>
              2015年6月3日
            </span>
            <span class="comments-link">
              <a href="" class="ds-thread-count" data-thread-key="9500" title="Comment on 毕业两周年">
                  <i class="fa fa-comments-o">
                  </i>
                  留言
              </a>
            </span>
            </div>
            <div class="post-content">
                <p>
                    leaves轻博客主要是将大家在博客中不需要的一些东西直接切割掉,只保存最实用的东西,这样使leaves变得更加简洁,同时更显得大方,由于leaves基于bootstrap所以说如果您想定制一些需要的东西是很好改动的．
                    <a href="">
                        这是一个链接
                    </a>
                    如果您觉得本博客的内容不够您的使用,您可以咨询作者,作者是很乐意为广大用户奉献代码的！
                </p>
            </div>
            <div class="meta-box">
            <span class="cat-links">
              <i class="fa fa-navicon">
              </i>
              <b>
                  分类:
              </b>
              <a href="topics/life/diary.html">
                  测试
              </a>
            </span>
            <span class="tag-links">
              <i class="fa fa-tags">
              </i>
              <b>
                  标签:
              </b>
              <a href="tags/毕业.html" rel="tag">
                  异步
              </a>
            </span>
            </div>
        </div>
    </div>
    <!--更多内容-->
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">
                <a href="blog.jsp" title="">更多内容</a>
            </h2>
        </div>
    </div>
    <!--跳转至博客页面-->
    <div class="row">
        <div class="col-md-12 post-container">
            <div class="row">
                <div class="col-md-4">
                    <a class="btn btn-primary home-browser-more-btn" href="blog.jsp">
                        <span>浏览更多文章</span>
                    </a>
                </div>
                <div class="col-md-8">
                </div>
            </div>
        </div>
    </div>
    <!--推荐阅读-->
    <div class="row">
        <div class="col-md-12 post-container m-recommend-page">
            <div class="row">
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="img/works.png" alt="作品展示">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="img/about.png" alt="路人简介">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="img/book.png" alt="作品推荐">
                    </a>
                </div>
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