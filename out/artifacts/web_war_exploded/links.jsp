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
            <h1 class="page-title">
                友情链接
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="links.php">
                    友情链接
                </a>
            </h2>
            <div class="post-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <img src="img/Link.png" />
                            <div class="caption">
                                <h3>
                                    友情链接
                                </h3>
                                <p>
                                嘿,baby,这里是存放友情链接的地方,你可以在这里存储对您重要的友情链接，然后将其他友情链接存入一个单独的页面．
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group" id="site-link-list">
                    <a class="list-group-item" target="_blank" href="javascript:if(confirm('点击确定将跳转'))window.location='http://www.ybsat.com/'">
                        <h4 class="list-group-item-heading">
                            <i class="fa fa-link">
                            </i>
                            异步
                        </h4>
                        <p class="list-group-item-text">
                            异步
                        </p>
                    </a>
                </div>
                <div class="list-group" id="site-link-list">
                    <a class="list-group-item" target="_blank" href="javascript:if(confirm('点击确定将跳转'))window.location='http://www.ybsat.com/'">
                        <h4 class="list-group-item-heading">
                            <i class="fa fa-link">
                            </i>
                            异步
                        </h4>
                        <p class="list-group-item-text">
                            异步
                        </p>
                    </a>
                </div>
                <div class="list-group" id="site-link-list">
                    <a class="list-group-item" target="_blank" href="javascript:if(confirm('点击确定将跳转'))window.location='http://www.ybsat.com/'">
                        <h4 class="list-group-item-heading">
                            <i class="fa fa-link">
                            </i>
                            异步
                        </h4>
                        <p class="list-group-item-text">
                            异步
                        </p>
                    </a>
                </div>
                <div class="list-group" id="site-link-list">
                    <a class="list-group-item" target="_blank" href="javascript:if(confirm('点击确定将跳转'))window.location='http://www.ybsat.com/'">
                        <h4 class="list-group-item-heading">
                            <i class="fa fa-link">
                            </i>
                            异步
                        </h4>
                        <p class="list-group-item-text">
                            异步
                        </p>
                    </a>
                </div>
                <div class="list-group" id="site-link-list">
                    <a class="list-group-item" target="_blank" href="javascript:if(confirm('点击确定将跳转'))window.location='http://www.ybsat.com/'">
                        <h4 class="list-group-item-heading">
                            <i class="fa fa-link">
                            </i>
                            异步
                        </h4>
                        <p class="list-group-item-text">
                            异步
                        </p>
                    </a>
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
    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
        /*banner 初始化*/
        $(window).load(function() {
         $('#slider').nivoSlider({
            effect: 'random',        // 过渡效果
            controlNav: false,       // 是否显示图片导航控制按钮（,2,3... ）
            pauseOnHover: true,      // 鼠标县浮时是否停止动画
            manualAdvance: false,    // 是否手动切换 
            animSpeed: 100,          // 图片过渡时间   
            pauseTime: 2000,         // 图片显示时间
            pauseOnHover: false,
            manualAdvance: false,
        });
        });
    $(document).ready(function(){
        $('body').show();
        $('.version').text(NProgress.version);
        NProgress.start();
        setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
    })
    
</script>
</body>

</html>