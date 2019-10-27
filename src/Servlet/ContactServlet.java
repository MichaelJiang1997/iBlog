package Servlet;


import utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/ContactServlet")
@MultipartConfig(location = "./")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String contact_name = request.getParameter("contact_name");
        String contact_title = request.getParameter("contact_title");
        String contact_email = request.getParameter("contact_email");
        String contact_content = request.getParameter("contact_content");


        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        try {
            Connection conn = DBUtils.getConnection();
            String sql = "INSERT INTO tb_contact VALUES (null,?,?,?,?,NOW())";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,contact_name);
            ps.setString(2,contact_title);
            ps.setString(3,contact_email);
            ps.setString(4,contact_content);
            int returnCode = ps.executeUpdate();
            //out.write("return code:"+returnCode);
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("contact.jsp");
    }
}
