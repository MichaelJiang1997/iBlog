<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<%@ include file="comm/header.jsp"%>


<body>

<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>


<div class="container-fluid main-container" id="main-container">
    <div class="row top-title">
        <div class="col-md-12">
            <h1 class="page-title right">
                <a href="blog.jsp">博客</a> >> <a href="content.jsp">异步测试文章</a>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="booklist.htm" tppabs="http://www.soulteary.com/booklist" rel="bookmark">
                    异步测试文章
                </a>
            </h2>
            <div class="meta-box">
            </div>
            <div class="post-content">
                <p>
                    这是本文的简介,可以是文章的前一部分内容,或者是作者对本文所做的一些概括
                </p>
                <hr/>
                <section>
                    <div class="main-container">
                        <div class="row">
                            <p>
                            这是本文的内容,举例,今天是不错的一天,因为今天leaves主题从黑色变成白色的了,虽然说白色的看起来更漂亮,但是我依然不会放弃黑色的主题的,我会对黑色的主题进行再次重构,等到下次更新的时候我们就会看到不一样的黑色主题．
                            </p>
                            <p>
                                其次就是本次新增填了文章音乐播放器,在看文章的时候您可以点开本文所带的音乐,或是一首或是几首,为您带来一段愉悦的时光,当然本文是将音乐放在最下方了,您也可以选择放在本文的最上方
                            </p>
                            <div id="player3" class="aplayer"></div>
                        </div>
                    </div>
                </section>
                <div class="meta-box">
                </div>
            </div>
        </div>
    </div>
    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
</body>

</html>