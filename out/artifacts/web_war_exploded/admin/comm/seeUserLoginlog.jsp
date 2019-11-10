<%@ page import="java.sql.Connection" %>
<%@ page import="utils.DBUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/11/6
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >登录记录</h4>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <th>登录IP</th>
                        <th>登录时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        // 当前用户的查登录日志
                        Connection conn1 = DBUtils.getConnection();
                        Statement s = conn1.createStatement();
                        String sql1 =
                                "select * from tb_user_log where u_login_id="+session.getAttribute("u_id")+" order by id desc limit 10";
                        ResultSet r = s.executeQuery(sql1);
                        while (r.next()){

                    %>
                    <tr>
                        <td><%=r.getString("u_login_ip")%></td>
                        <td><%=r.getString("u_login_time")%></td>
                        <td><%=r.getString("u_login_flag").equals("1")?"成功":"失败"%></td>
                    </tr>
                    <%
                        }
                        DBUtils.closeAll(conn1);
                    %>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>

