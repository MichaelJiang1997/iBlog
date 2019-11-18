<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<jsp:include page="comm/header.jsp">
    <jsp:param value="flink" name="now"/>
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
                    友情链接
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
        // 读取友链表数据
        Connection conn = DBUtils.getConnection();
        Statement sm = conn.createStatement();
        String sql = "select * from tb_flink";
        ResultSet res = sm.executeQuery(sql);
        while (res.next()){
    %>
        <div class="list-group" id="site-link-list">
        <a class="list-group-item" target="_blank"
           href="<%=res.getString("flink_addr")%>">
            <h4 class="list-group-item-heading">
                <i class="fa fa-link">
                </i>
                <%=res.getString("flink_name")%>
            </h4>
            <p class="list-group-item-text">
                <%=res.getString("flink_desc")%>
            </p>
        </a>
    </div>
    <%
        }
        DBUtils.closeAll(conn);
    %>
</div>
    <div class="row">
        <div class="col-md-4">
        </div>
    </div>
    <!-- 网站底部 -->
    <%@ include file="comm/footer.jsp"%>
</div>
<!-- 包含脚本-->
<%@ include file="comm/script.jsp"%>
</body>

</html>