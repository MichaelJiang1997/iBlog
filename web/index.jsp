<%@ page import="Bean.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">


<jsp:include page="comm/header.jsp">
    <jsp:param value="index" name="now"/>
</jsp:include>

<body>

<%@ include file="comm/navbar.jsp"%>
<%@ include file="comm/leftbar.jsp"%>
<%@ include file="comm/banner.jsp"%>


<!--主要内容 -->
    <div class="container-fluid main-container" id="main-container">
        <div class="row">
            <div class="col-md-12 top-title">
                <h1 >
                    <div class="row">
                        最新文章
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
    <!--main Start-->
        <%
            List<Article> aList = new LinkedList<>();

            // 建立数据库连接
            Connection conn = DBUtils.getConnection();
            Statement sm = conn.createStatement();

            // 统计文章总数做分页
            int totalPage = 0;
            String sqlCont = "select count(*) as cnt from tb_article";
            ResultSet conRes = sm.executeQuery(sqlCont);
            while (conRes.next()){
                totalPage = conRes.getInt("cnt");
            }

            // 数据库拿文章
            String sql = "select * from tb_article order by art_time desc limit 3";
            ResultSet res = sm.executeQuery(sql);
            while (res.next()){
                aList.add(new Article(res.getString("art_id"),res.getString("art_title"),
                        res.getString("art_class"),res.getString("art_tag"),res.getString("art_content"),
                        res.getString("art_time"),res.getString("art_count"),res.getString("art_visible")));
            }

            // 拿标签和归类名哎
            for(Article a: aList){
                String sqlClass = "select class_name from tb_art_class where class_id="+a.getArt_class();
                ResultSet classRes = sm.executeQuery(sqlClass);
                String className="";
                while(classRes.next()) {
                    className = classRes.getString("class_name");
                }
                a.setArt_class(className);

                String sqlTag = "select tag_name from tb_art_tag where tag_id="+a.getArt_tag();
                ResultSet tagRes = sm.executeQuery(sqlTag);
                String tagName="";
                while(tagRes.next()) {
                    tagName = tagRes.getString("tag_name");
                }
                a.setArt_tag(tagName);
            }


            DBUtils.closeAll(conn);
        %>

        <%
            for(Article a : aList){

        %>
        <div class="row">
            <div class="col-md-12 post-container">
                <h2 class="post-title">
                    <a href="content.jsp?aid=<%=a.getArt_id() %>" title=""><%=a.getArt_title()%></a>
                </h2>
                <div class="meta-box">
            <span class="m-post-date">
              <i class="fa fa-calendar-o">
              </i>
            </span>

                </div>

                <div class="meta-box">

            <span class="cat-links">
              <i class="fa fa-navicon">
              </i>
              <b>
                  时间:
              </b>
              <a href="#">
                   <%=a.getArt_time()%>
              </a>
            </span>
            <span class="cat-links">
              <i class="fa fa-navicon">
              </i>
              <b >
                  分类:
              </b>
              <a href="#">
                  <%=a.getArt_class()%>
              </a>
            </span>
                    <span class="tag-links">
              <i class="fa fa-tags">
              </i>
              <b>
                  标签:
              </b>
              <a href="#" rel="tag">
                  <%=a.getArt_tag()%>
              </a>
            </span>
                </div>
            </div>
        </div>
        <%
            }
        %>
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