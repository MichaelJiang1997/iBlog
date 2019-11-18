<%-- Created by IntelliJ IDEA. --%>

<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.Article" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 拿get参数作为分页啊
    String pages = request.getParameter("pages");

    // 判断一下pages个是么得,若么得就赋为默认值 1
    if(pages == null){
        pages = "1";
    }
%>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<jsp:include page="comm/header.jsp">
    <jsp:param value="blog" name="now"/>
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
                    博客文章
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
        int p = Integer.parseInt(pages);
        String sql = "select * from tb_article order by art_time desc limit "+(p-1)*3+",3";
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
              <i class="fa fa-calendar-o"></i>
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
              <b>
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

    <!--分页-->
    <div class="row post-pagination">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group" role="group" aria-label="First group">
                <%
                    if(Integer.parseInt(pages) == 1){// 是第一页则不能往前面翻了

                %>

                <button type="button" class="btn btn-danger"
                >已翻到头了</button>

                <%
                }else{
                %>
                <button type="button" class="btn btn-warning"
                ><a href="blog.jsp?pages=<%=String.valueOf(Integer.parseInt(pages)-1)%>">前一页
                </a></button>
                <%
                    }
                %>
            </div>
            <div class="btn-group" role="group" aria-label="Second group">
                <button type="button" class="btn btn-success" ><%=pages%></button>
            </div>
            <div class="btn-group" role="group" aria-label="Third group">

                <%
                    if(Integer.parseInt(pages) * 3  >= totalPage){// 是最后一页则不能往后翻了

                %>

                    <button type="button" class="btn btn-danger"
                    >已翻到底了</button>

                <%
                    }else{
                %>
                    <button type="button" class="btn btn-warning"
                    ><a href="blog.jsp?pages=<%=String.valueOf(Integer.parseInt(pages)+1)%>">后一页
                    </a></button>
                <%
                    }
                %>

                <div class="col-lg-5">
                    <div class="input-group">
                        <form action="jump.jsp" method="post">
                            <input  name="pages" class="form-group-sm" placeholder="电梯">
                            <button class="btn btn-default" type="submit" >Go!</button>
                        </form>
                    </div><!-- /input-group -->
                </div>
            </div>
        </div>
    </div>

    <%@ include file="comm/footer.jsp"%>
</div>
<!-- 包含脚本-->
<%@ include file="comm/script.jsp"%>
</body>

</html>