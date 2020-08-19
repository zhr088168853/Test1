<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
     <head>
        <title>
            修改留言板
        </title>
    </head>
  <body >
  <%
   // 进行乱码处理
   request.setCharacterEncoding("UTF-8") ;
%>
<%!
   String DBDRIVER    = "com.mysql.cj.jdbc.Driver" ;
   String DBURL    = "jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true" ;
   String DBUSER    = "root" ;
   String DBPASSWORD   = "root" ;
   Connection conn    = null ;
   PreparedStatement pstmt = null ;
%>
<%
   // 声明一个boolean变量
   boolean flag = false ;
   // 接收参数
   String name=request.getParameter("name");            //获取到新修改的值
   String title = request.getParameter("title") ;       //获取到新修改的值
   String content = request.getParameter("content") ;   //获取到新修改的值
   String oldname = request.getParameter("oldname") ;   //获取修改前的name值
   out.println(name);
   out.println(title);
   out.println(content);
   out.println(oldname);
%>
<%
   // 更新表中的数据
   String sql = "UPDATE user set Name=?,Title=?,Content=? WHERE Name=?";
   try
   {
    Class.forName(DBDRIVER) ;
    conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    pstmt = conn.prepareStatement(sql) ;
    pstmt.setString(1, name);
    pstmt.setString(2,title) ;
    pstmt.setString(3,content) ;
    pstmt.setString(4,oldname) ;
    pstmt.executeUpdate() ;//若用prepareStatement，则executeUpdate()一定不能传参
    pstmt.close() ;
    conn.close() ;
    // 如果修改成功，则肯定能执行到此段代码,若删除成功则flag=true
    flag = true ;
   }
   catch(Exception e)
   {
       e.printStackTrace();
   }
%>
<%
    response.setHeader("refresh","5;URL=Display.jsp") ;
    if(flag)
    {
%>
    <center>
     留言修改成功，5秒后跳转到留言列表页！！！<br>
     如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
    </center>
<%
    }
    else
    {
%>
    <center>
     留言修改失败，5秒后跳转到留言列表页！！！<br>
     如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
    </center>
<%
    } %>
  </body>
</html>