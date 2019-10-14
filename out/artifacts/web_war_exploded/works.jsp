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
            <h1 class="page-title">作品</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title"><a href="book.htm" rel="bookmark">阅读列表</a></h2>
            <div class="meta-box"></div>
            <div class="post-content">
                <p>存放一些作品,或者是相册。</p>
                <hr />
                <style>
                    .book-opt-sort{margin-left:10px;}
                </style>
                <div class="btn-group book-opt-filter"><a class="btn btn-primary btn-sm" data-filter="*">显示所有</a>
                    <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown"><span class="caret"></span><span class="sr-only">筛选内容</span></button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a data-filter=".book-cat-recommend">推荐</a></li>
                        <li><a data-filter=".book-cat-oreilly">“前端”</a></li>
                        <li><a data-filter=".book-cat-oreilly">“后端”</a></li>
                    </ul>
                </div>
                <div class="btn-group book-opt-sort"><a class="btn btn-primary btn-sm" data-sort-by="original-order">默认排序</a>
                    <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown"><span class="caret"></span><span class="sr-only">切换排序</span></button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a data-sort-by="name">类型</a></li>
                        <li><a data-sort-by="author">时间</a></li>
                        <li class="divider"></li>
                        <li><a data-sort-by="pubdate">开源</a></li>
                        <li><a data-sort-by="publisher">购买</a></li>
                    </ul>
                </div>
                <div class="book-container clearfix">
                    <div class="meta-box"></div>
                    <div class="row">

                        <div class="col-md-3"><a  class = "fancybox"  rel = "group"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                    </div>
                    <div class="meta-box"></div>
                    <div class="row">
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group1"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group1"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group1"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group1"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                    </div>
                    <div class="meta-box"></div>
                    <div class="row">
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group2"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group2"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group2"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group2"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                    </div>
                    <div class="meta-box"></div>
                    <div class="row">
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group3"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group3"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group3"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                        <div class="col-md-3"><a  class = "fancybox"  rel = "group3"  href = "img/backgrounds/1.jpg" ><img  src = "img/backgrounds/1.jpg"  alt = ""  width="100%"/></a></div>
                    </div>
                    <div class="meta-box"></div>
                </div>
            </div>
            <div class="meta-box"></div>
        </div>
    </div>
    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>
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
        $(".fancybox").fancybox();
    })
    
</script>
</body>
</html>