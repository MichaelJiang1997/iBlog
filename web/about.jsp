<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<jsp:include page="comm/header.jsp">
    <jsp:param value="about" name="now"/>
</jsp:include>


<body>
<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>
<div class="container-fluid main-container" id="main-container">
    <div class="row">
        <div class="col-md-12 top-title">
            <h1 >
                <div class="row">
                    关于<%=session.getAttribute("site_title")%>
                    <div class="input-group ">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                        <button class="btn btn-success" type="button">Go!</button>
                    </span>
                    </div>
                </div>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="about.php" rel="bookmark">
                    关于异步
                </a>
            </h2>
            <div class="post-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <a href="javascript:;">
                                <img title="关于我 @Ybsat" src="img/about.png" alt="关于我 @Ybsat"
                                />
                            </a>
                            <div class="caption">
                                <h3>
                                    个人概况
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default" id="simple-intro">
                    <div class="panel-body">
                        <h3>
                            简单概述
                        </h3>
                        <p>
                            学程序是因为有梦想，希望自己以后能够和小伙伴们创建一家属于自己的互联网公司。对前端(FrontEnd) &amp; 交互体验(User Experience)/后端(Backend)/存储(Storage)/等相关技术十分感兴趣，喜欢变着花样（寻求最优方案）去完成想要完成的事情。可以独立设计并完成网站或软件视觉设计，有轻微代码洁癖。
                        </p>
                        <p>
                            我的联系方式：
                        </p>
                        <blockquote class="contact-list" id="about-list">
                            <ul>
                                <li>
                                    电子邮箱:
                                    <kbd>
                                        junqiahen@gmail.com
                                    </kbd>
                                </li>
                                <li>
                                    腾讯QQ:
                                    <kbd>
                                        @724847899
                                    </kbd>
                                </li>
                                <li>
                                    新浪微博:
                                    <kbd>
                                        weibo.com/5249464563/profile
                                    </kbd>
                                </li>
                                <li>
                                    腾讯微博:
                                    <kbd>
                                        t.qq.com/qaz0857/kbd>
                                </li>
                                <li>
                                    我的GIT:
                                    <kbd>
                                    </kbd>
                                </li>
                            </ul>
                        </blockquote>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body clearfix">
                        <h3>
                            往事如烟
                        </h3>
                        <p>
                            暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发
                        </p>
                        <p>
                            暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发。
                        </p>
                        <p>
                            暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发。
                        </p>
                        <p>
                            暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发暂未开发。
                        </p>
                        <footer class="pull-right">
                            二零一五年九月落笔于
                            <cite title="郑州">
                                郑州
                            </cite>
                        </footer>
                    </div>
                </div>
            </div>
            <div class="meta-box">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
        </div>
    </div>
    <%@ include file="comm/footer.jsp"%>
</div>
<!-- 包含脚本-->
<%@ include file="comm/script.jsp"%>
</body>

</html>