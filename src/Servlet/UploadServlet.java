package Servlet;


import org.apache.catalina.core.ApplicationPart;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/UploadServlet")
@MultipartConfig(location = "./")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String path = this.getServletContext().getRealPath("/");
        Part p = request.getPart("image");
        if(p.getContentType().contains("image")){
            ApplicationPart ap = (ApplicationPart)p;
            String fname = ap.getSubmittedFileName();
            //int path_index = fname.lastIndexOf("\\")+1;
            //fname = fname.substring(path_index,fname.length());
            p.write(path+"/upload/"+fname);
            out.write("上载成功："+fname);
        }else{
            out.write("失败！");
        }
    }
}
