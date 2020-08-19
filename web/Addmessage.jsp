<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <title>
            写留言成功！
        </title>
    </head>
  <body>
  <% 
      request.setCharacterEncoding("UTF-8") ;//在文件的开头加上这句代码
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true","root","root"); 
      Statement stat=conn.createStatement();
      String name=request.getParameter("name");
      String title=request.getParameter("title");
      String content=request.getParameter("content"); 
      if(name.equals(" ")|title.equals(" ")|content.equals(" "))
      {
        response.sendRedirect("messagecontent.jsp");
      }
      else
      {         //增加记录
        String sql="insert into user(Name,Title,Content)values('"+name+"','"+title+"','"+content+"')";
        stat.executeUpdate(sql);
        out.println("数据库连接成功");
        out.println("名字是："+name);
        out.println("标题是："+title);
        out.println("内容是："+content);
        response.setHeader("refresh","5;URL=Display.jsp") ;
//        response.sendRedirect("Display.jsp");
      } 
      stat.close();
      conn.close();
  %>
  </body>
</html>