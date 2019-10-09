<%--
  Created by IntelliJ IDEA.
  User: Michael Jiang
  Date: 2019/10/9
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>撰写新文章-iBlog</title>
</head>
<body>
<form action="UploadServlet" enctype="multipart/form-data" method="post">
    选择文件<input type="file" name="image" />
    <button>上载</button>
</form>
</body>
</html>
